package top.library.sub.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.utility.StringUtil;
import top.library.sub.model.entity.User;
import top.library.sub.model.service.UserService;

@Scope("prototype")
@Component("register")
public class RegisterOrLogin extends ActionSupport {

	private static final long serialVersionUID = -1227828622151354634L;
	private static UserService userService;

	@Resource(name = "userService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private String uemail;
	private String uname;
	private String upass;
	private String upasss;
	private String uadmin;
	private String jump;

	public void setJump(String jump) {
		this.jump = jump;
	}

	public String getUpasss() {
		return upasss;
	}

	public void setUpasss(String upasss) {
		this.upasss = upasss;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getUadmin() {
		return uadmin;
	}

	public void setUadmin(String uadmin) {
		this.uadmin = uadmin;
	}

	public UserService getUserService() {
		return userService;
	}

	@Override
	public String execute() throws Exception {
		if (userService.exsitsUser(uname)) {
			this.addActionError("用户名已存在");
			return INPUT;
		} else {
			User user = new User();
			user.setUemail(uemail);
			user.setUname(uname);
			user.setUpass(upass);
			user.setUadmin(uadmin);
			userService.registerUser(user);
			this.addActionMessage("注册成功");
			return SUCCESS;
		}

	}

	public String Login() {
		User user = userService.findUser(uname);
		if (user!=null&&!"".equals(user)) {
			if (upass.equals(user.getUpass())) {
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(60*30);
				this.addActionMessage("登陆成功");
				return SUCCESS;
			} else {
				this.addActionError("密码不正确");
				System.out.println(user.getFiles());
				return INPUT;
			}
		}
		this.addActionError("账号不存在或已注销");
		return ERROR;

	}

	public String logOut() {
		if (ServletActionContext.getRequest().getSession(false).getAttribute("user")!= null && !"".equals(ServletActionContext.getRequest().getSession(false).getAttribute("user"))) {
			ServletActionContext.getRequest().getSession(false).removeAttribute("user");
			return SUCCESS;
		} else {
			this.addActionError("未登陆");
			return ERROR;
		}

	}

}
