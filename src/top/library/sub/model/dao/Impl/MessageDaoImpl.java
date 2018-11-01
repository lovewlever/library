package top.library.sub.model.dao.Impl;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import top.library.sub.model.dao.MessageDao;
import top.library.sub.model.entity.Message;
@Repository
@Component("messageDao")
public class MessageDaoImpl extends BaseDaoImpl<Message, Integer> implements MessageDao {

}
