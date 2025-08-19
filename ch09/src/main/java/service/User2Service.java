package service;

import java.util.List;

import dao.User2DAO;
import dto.User2DTO;

public class User2Service {
	private static User2Service instance = new User2Service();
	public static User2Service getInstance() {
		return instance;
	}
	private User2Service() {}
	
	private User2DAO dao = User2DAO.getInstance();
	
	public void register(User2DTO dto) {}
	public User2DTO findbyId(String user_id) {
		return null;
	}
	public List<User2DTO> findAll() {
		return dao.selectAllUser2();
	}
	public void modify(User2DTO dto) {}
	public void delete(String user_id) {}
}
