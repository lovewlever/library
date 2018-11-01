package top.library.sub.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;
import java.util.TimeZone;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.opensymphony.xwork2.ActionSupport;
import top.library.sub.model.entity.User;
import top.library.sub.model.entity.UserFile;
import top.library.sub.model.service.UserService;

@Scope("prototype")
@Component
public class UploadAction extends ActionSupport {
	private static final long serialVersionUID = -6777015478329332533L;
	private UserService userService;
	private File file;
	private String fileContentType;
	private String savePath;
	private String fileFileName;
	private String share;

	public UserService getUserService() {
		return userService;
	}

	@Resource(name = "userService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getShare() {
		return share;
	}

	public void setShare(String share) {
		this.share = share;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getSavePath() {
		return ServletActionContext.getRequest().getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String value) {
		this.savePath = value;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	@Override
	public String execute() throws Exception {
		if (fileFileName.substring(fileFileName.lastIndexOf(".")).equals(".rar")
				|| fileFileName.substring(fileFileName.lastIndexOf(".")).equals(".zip")) {
			// 获取文件大小
			long length = file.length();
			String fizesize = String.valueOf(length / 1024 / 1024);
			// 防止文件重名覆盖!重新生成文件名
			String newfilename = UUID.randomUUID() + fileFileName.substring(fileFileName.lastIndexOf("."));
			// 保存文件
			
			FileOutputStream fos = new FileOutputStream(getSavePath() + File.separator + newfilename);
			FileInputStream fis = new FileInputStream(getFile());
			byte[] buffer = new byte[1024 * 1024];
			double tempSize = 0.0;
			int len = 0;
			int progress = 0;
			HttpSession session = ServletActionContext.getRequest().getSession();
			while ((len = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, len);
				tempSize += len;
				progress = (int) ((tempSize / length) * 100);
				session.setAttribute("progress", progress);
			}
			fos.close();
			fis.close();

			session.removeAttribute("progress");
			// 保存路径到数据库
			TimeZone timezone = TimeZone.getTimeZone("Asia/Shanghai");
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeZone(timezone);
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH) + 1;
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			int hour = calendar.get(Calendar.HOUR_OF_DAY);
			int minute = calendar.get(Calendar.MINUTE);
			int second = calendar.get(Calendar.SECOND);
			String dates = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;

			User user = (User) ServletActionContext.getRequest().getSession(false).getAttribute("user");
			UserFile uf = new UserFile();
			uf.setFilename(fileFileName);
			uf.setFilepath(File.separator+File.separator + savePath + File.separator+File.separator + newfilename);
			uf.setFilesize(fizesize);
			uf.setUploadtime(dates);
			uf.setFileshare(share);
			Set<UserFile> files = new HashSet<>();
			files.add(uf);
			user.setFiles(files);
			uf.setUser(user);

			// 执行插入
			userService.update(user);
			//重新查询信息
			
			User user2 = userService.findUser(user.getUname());
			ServletActionContext.getRequest().getSession(false).removeAttribute("user");
			ServletActionContext.getRequest().getSession(false).setAttribute("user", user2);
			
			return SUCCESS;
		}
		this.addActionError("文件类型错误");
		return ERROR;

	}

}
