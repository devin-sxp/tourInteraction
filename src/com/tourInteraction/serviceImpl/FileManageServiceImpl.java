package com.tourInteraction.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.tourInteraction.dao.FileManageDao;
import com.tourInteraction.entity.Files;
import com.tourInteraction.service.IFileManageService;

@Service("fileManageServiceImpl")
public class FileManageServiceImpl implements IFileManageService {

	@Autowired
	private FileManageDao fileManageDao;

	@Override
	public int addFile(Files file) {
		fileManageDao.addFile(file);
		return file.getId();
	}

}
