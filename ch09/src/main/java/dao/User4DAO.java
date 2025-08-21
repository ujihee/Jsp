package dao;

import java.util.List;

import dto.User4DTO;

public class User4DAO {
	
	private final static User4DAO INSTANCE = new User4DAO();
	
	public static User4DAO getInstance() {
		return INSTANCE;
	}
	private User4DAO() {}
	
	public void insertUser4(User4DTO dto) {}
	public User4DTO selectUser4(String name) {
		return null;
	}
	public List<User4DTO> selectAllUser4() {
		return null;
	}
	public void updateUser4(User4DTO dto) {}
	public void deleteUser4(String name) {}
	
}
