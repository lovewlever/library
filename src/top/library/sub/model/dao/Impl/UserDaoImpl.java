package top.library.sub.model.dao.Impl;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import top.library.sub.model.dao.UserDao;
import top.library.sub.model.entity.User;
@Component("userDao") 
@Repository
public class UserDaoImpl implements UserDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session currentSession() {
		return sessionFactory.getCurrentSession();
		
	}
	@Override
	public void saveUser(User user) {
		this.currentSession().save(user);

	}

	@Override
	public User findUser(String uname) {
		
		return (User) currentSession().createQuery("from User where uname=?0").setParameter(0, uname).uniqueResult();
	}

	@Override
	public boolean exsits(String uname) {
		long in=(long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from User where uname=?0")
				.setParameter(0, uname)
				.uniqueResult();
		if(in>0) {
			return true;
		}
		return false;
	}
	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		currentSession().update(user);
	}
	@Override
	public User findUser(Long id) {
		Query query = currentSession().createQuery("from User where id=?0");
		query.setParameter(0, id);
		User result = (User) query.uniqueResult();
		
		return result;
	}

}
