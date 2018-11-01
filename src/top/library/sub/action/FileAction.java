package top.library.sub.action;


import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.opensymphony.xwork2.ActionSupport;
import top.library.sub.model.entity.User;
import top.library.sub.model.entity.UserFile;
import top.library.sub.model.service.FileService;
import top.library.sub.model.service.UserService;
@Scope("prototype")
@Component("fileAction")
public class FileAction extends ActionSupport {

	private UserService userService;
	private FileService fileService;
	private String result;
	private static final long serialVersionUID = -8431235254266765782L;

	
	public UserService getUserService() {
		return userService;
	}
	@Resource(name="userService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private String inputPath;
	private Long id;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getInputPath() {
		return inputPath;
	}
	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}
	public FileService getFileService() {
		return fileService;
	}
	@Resource(name="fileService")
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}

	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String execute() throws Exception {
		List<UserFile> findAll = fileService.findAllFiles();
		JSONArray json=new JSONArray();
		for(UserFile uf:findAll) {
			JSONObject jo=new JSONObject();
			jo.put("filename",uf.getFilename());
			jo.put("filepath", uf.getFilepath());
			jo.put("fileshare", uf.getFileshare());
			jo.put("filesize", uf.getFilesize());
			jo.put("uploadtime", uf.getUploadtime());
			jo.put("id", uf.getId());
			jo.put("userna", uf.getUser().getUname());
			json.put(jo);
		}
		
		result=json.toString();
		return SUCCESS;
	}
	
	public String returnSession() {
		String mess=ServletActionContext.getRequest().getSession(false).getAttribute("progress").toString();
		String s="{\"progress\":"+mess+"}";
		result=s;
		return SUCCESS;
		
	}
	public String deleteFile() {
		File file = new File(inputPath);
		if(file.exists()) {
			System.out.println("cunzai");
			file.delete();
			fileService.delFile(id);
			User user2 = userService.findUser(((User)ServletActionContext.getRequest().getSession(false).getAttribute("user")).getUname());
			ServletActionContext.getRequest().getSession(false).removeAttribute("user");
			ServletActionContext.getRequest().getSession(false).setAttribute("user", user2);
			result="{\"err\":\"文件已删除\"}";
			return SUCCESS;
		}else {
			result="{\"err\":\"文件不存在\"}";
		return SUCCESS;		
		}
	}
	
}
