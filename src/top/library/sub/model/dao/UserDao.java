package top.library.sub.model.dao;

import top.library.sub.model.entity.User;

public interface UserDao {
	void saveUser(User user);
	User findUser(String uname);
	User findUser(Long id);
	
	boolean exsits(String uname);
	void update(User user);
}
