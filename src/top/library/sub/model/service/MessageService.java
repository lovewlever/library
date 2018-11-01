package top.library.sub.model.service;

import java.util.List;

import top.library.sub.model.dao.BaseDao;
import top.library.sub.model.entity.Message;

public interface MessageService{
	List<Message> findMessagePage(int fist,int last);
	List<Message> findMessageAll();
	List<Message> findMessage(String keyword);
	void saveMessage(Message message);
}
