package top.library.sub.action.intereptor;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.StrutsStatics;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import top.library.sub.action.DownloadFileAction;

public class FileExsists implements Interceptor {
	private static final long serialVersionUID = 6674547984916937414L;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {		
		HttpServletRequest req = (HttpServletRequest) arg0.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		String inputPath = req.getParameter("inputPath");
		System.out.println(inputPath);
		File file = new File("//usr//tomcat//webapps//library"+inputPath);
		System.out.println(file.isFile());
		if(file.isFile()==true) {
			return arg0.invoke();
		}else {
			
		DownloadFileAction action = (DownloadFileAction) arg0.getAction();
		action.addActionError("文件不存在或已被移动位置!"+file.exists()+inputPath);
		return "error";
		}
	}

}
