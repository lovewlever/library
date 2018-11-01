package top.library.sub.model.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import top.library.sub.model.dao.BaseDao;
import top.library.sub.model.entity.UserFile;
import top.library.sub.model.service.FileService;
@Component("fileService")
public class FileServiceImpl implements FileService {
	private BaseDao<UserFile, Integer> baseDao;
	
	public BaseDao<UserFile, Integer> getBaseDao() {
		return baseDao;
	}
	@Resource(name="fileDao")
	public void setBaseDao(BaseDao<UserFile, Integer> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<UserFile> findAllFiles() {
		final String hql="from UserFile where fileshare='y'";		
		return baseDao.findAll(hql);
	}
	@Override
	public void delFile(Long id) {
		baseDao.delByid(id);
		
	}
	
}
