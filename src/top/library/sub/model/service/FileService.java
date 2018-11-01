package top.library.sub.model.service;


import java.util.List;

import top.library.sub.model.entity.UserFile;

public interface FileService {
	List<UserFile> findAllFiles();
	void delFile(Long id);
}
