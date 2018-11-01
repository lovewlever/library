package top.library.sub.model.service.Impl;

import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import top.library.sub.model.dao.BaseDao;
import top.library.sub.model.dao.MessageDao;
import top.library.sub.model.entity.Message;
import top.library.sub.model.service.MessageService;
@Component("messageService")
public class MessageServiceImpl implements MessageService {
	private BaseDao<Message, String> baseDao;		
	public BaseDao<Message, String> getBaseDao() {
		return baseDao;
	}
	@Resource(name="messageDao")
	public void setBaseDao(BaseDao<Message, String> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<Message> findMessagePage(int fist, int last) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> findMessageAll() {
		String hql="from Message order by id desc";		
		return baseDao.findAll(hql);
	}

	@Override
	public List<Message> findMessage(String keyword) {
		
		return baseDao.findByKeyWord(keyword);
	}

	@Override
	public void saveMessage(Message message) {
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
		message.setDates(dates);
		baseDao.save(message);

	}

}
