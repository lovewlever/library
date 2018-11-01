package top.library.sub.model.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T,V> {
	List<T> findAll(String hql);
	List<T> findByPage(V fist,V last);
	<T> T findByObj(T object);
	<T> T findByNmae(V name);
	<T> T findById(final Serializable id);
	List<T> findByKeyWord(V keyword);
	
	void save(T object);
	void update(T object);
	void delete(T object);
	void delByid(Long id);
		
}
