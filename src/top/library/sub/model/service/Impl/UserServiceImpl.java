package top.library.sub.model.service.Impl;

import java.util.Calendar;
import java.util.TimeZone;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import top.library.sub.model.dao.UserDao;
import top.library.sub.model.entity.User;
import top.library.sub.model.service.UserService;

@Component("userService")
public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	@Resource(name = "userDao")
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User findUser(String uname) {
		// TODO Auto-generated method stub
		return userDao.findUser(uname);
	}

	@Override
	public boolean exsitsUser(String uname) {
		return userDao.exsits(uname);
	}

	@Override
	public void registerUser(User user) {
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
		user.setRegistration(dates);
		userDao.saveUser(user);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

	@Override
	public User findUser(Long id) {
		
		return userDao.findUser(id);
	}

}
