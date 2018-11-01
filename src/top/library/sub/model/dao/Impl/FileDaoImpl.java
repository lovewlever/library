package top.library.sub.model.dao.Impl;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import top.library.sub.model.dao.FileDao;
import top.library.sub.model.entity.UserFile;
@Repository
@Component("fileDao")
public class FileDaoImpl extends BaseDaoImpl<UserFile, Integer> implements FileDao {

}
