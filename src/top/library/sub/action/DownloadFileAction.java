package top.library.sub.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
@Scope("prototype")
@Component
public class DownloadFileAction extends ActionSupport {
	private static final long serialVersionUID = 5455530871678859528L;
		//文件路径
		private String inputPath;
		//文件类型
/*		private String contentType;*/
		//文件名
		private String downFileName;
		//getset方法
		public String getInputPath() {
			return inputPath;
		}
		public void setInputPath(String inputPath) throws UnsupportedEncodingException {
			this.inputPath = new String(inputPath.getBytes("iso-8859-1"),"GBK");
		}
/*		public String getContentType() {
			return contentType;
		}
		public void setContentType(String contentType) {
			this.contentType = contentType;
		}*/
		public String getDownFileName() {
			return downFileName;
		}
		public void setDownFileName(String downFileName) throws UnsupportedEncodingException {
			this.downFileName = new String(downFileName.getBytes("iso-8859-1"),"GBK");
		}
		
		public InputStream getTargetName() throws Exception {
			// TODO Auto-generated method stub
				return ServletActionContext.getServletContext().getResourceAsStream(inputPath);				
		}
		
}
