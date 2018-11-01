package top.library.sub.action.intereptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import top.library.sub.action.UploadAction;
import top.library.sub.model.entity.User;

public class UserSession implements Interceptor {

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
		HttpServletRequest req=(HttpServletRequest) arg0.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		HttpSession session = req.getSession(false);
		User user = (User) session.getAttribute("user");
		if(user!=null&&!"".equals(user)) {
			return arg0.invoke();
		}

		return Action.LOGIN;
	}

}
