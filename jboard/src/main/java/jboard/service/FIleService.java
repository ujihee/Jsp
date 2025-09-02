package jboard.service;

import java.util.List;

import jboard.dao.FIleDAO;
import jboard.dto.FileDTO;


public enum FIleService {
	
	INSTANCE;
	
	private FIleDAO dao = FIleDAO.getInstance();
	
	public void register(FileDTO dto) {
		dao.insert(dto);
	}
	public FileDTO findByID(int fno) {
		return dao.select(fno);
	}
	public List<FileDTO> findAll() {
		return dao.selectAll();
	}
	public void modify(FileDTO dto) {
		dao.update(dto);
	}
	public void delete(int fno) {
		dao.delete(fno);
	}

}
