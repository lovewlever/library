package top.library.sub.model.service;

import top.library.sub.model.entity.User;

public interface UserService {
	User findUser(String uname);
	User findUser(Long id);	
	boolean exsitsUser(String uname);
	void registerUser(User user);
	void update(User user);
	
}
