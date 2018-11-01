package top.library.sub.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

import top.library.sub.model.entity.Message;
import top.library.sub.model.service.MessageService;
@Scope("prototype")
@Component("messageAction")
public class MessageAction extends ActionSupport {
	private static final long serialVersionUID = -6640415012647848181L;
	private String keyword;
	private String name;
	private String dates;
	private String msg;
	private String key;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	private MessageService messageService;

	public MessageService getMessageService() {
		return messageService;
	}
	@Resource(name="messageService")
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String execute() throws Exception {
		List<Message> messageAll = messageService.findMessageAll();
		ServletActionContext.getRequest().setAttribute("message", messageAll);
		return SUCCESS;
	}
	
	public String msgboard() {
		//if("wl".equals(key)) {
			Message message= new Message();
			message.setMsg(msg);
			message.setName(name);
			messageService.saveMessage(message);
			this.addActionMessage("保存成功");
			return SUCCESS;
		//}else {
			//this.addActionError("口令错误");
		//return INPUT;	
		//}
	}
	
	public String search() {
		List<Message> list = messageService.findMessage(keyword);
		ServletActionContext.getRequest().setAttribute("search", list);
		return SUCCESS;		
	}
	
}
