package jboard.dao;

import java.util.List;

import jboard.dto.FileDTO;
import jboard.util.DBHelper;

public class FIleDAO extends DBHelper{
	
	private final static FIleDAO INSTANCE = new FIleDAO();
	public static FIleDAO getInstance() {
		return INSTANCE;
	}
	private FIleDAO() {}
	
	public void insert(FileDTO dto) {
		
	}
	public FileDTO select(int fno) {
		return null;
	}
	public List<FileDTO> selectAll(){
		return null;
	}
	public void update(FileDTO dto) {
		
	}
	public void delete(int fno) {
		
	}

}
