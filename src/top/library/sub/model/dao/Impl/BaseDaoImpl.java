package top.library.sub.model.dao.Impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import top.library.sub.model.dao.BaseDao;

public class BaseDaoImpl<T, V> implements BaseDao<T, V> {
	private SessionFactory sessionFactory;
	private Class<T> clazz;
	
	
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
	public BaseDaoImpl() {
		super();
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz=(Class<T>) type.getActualTypeArguments()[0];
	}

	@Override
	public List<T> findAll(String hql) {

		return currentSession().createQuery(hql).list();
	}

	@Override
	public List<T> findByPage(V fist, V last) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T findByObj(T object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T findByNmae(V name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T findById(final Serializable id) {
		
		return (T) currentSession().get(clazz,id);
	}

	@Override
	public List<T> findByKeyWord(V keyword) {
		CriteriaBuilder criteriaBuilder = currentSession().getCriteriaBuilder();
		CriteriaQuery<T> query = criteriaBuilder.createQuery(clazz);
		Root<T> root = query.from(clazz);
		query.select(root);
		query.where(criteriaBuilder.like(root.get("msg"), "%"+keyword+"%"));
		List<T> resultList = currentSession().createQuery(query).getResultList();
		
		String sql="select id,name,dates,msm from T_MESSAGE WHERE msm LIKE '%"+keyword+"%'";
		return resultList;
	}

	@Override
	public void save(T object) {
		this.currentSession().save(object);
		
	}

	@Override
	public void update(T object) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(T object) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delByid(Long id) {
		// TODO Auto-generated method stub
		Query query = currentSession().createQuery("delete UserFile where id=?0");
		query.setParameter(0, id);
		query.executeUpdate();
	}

}
