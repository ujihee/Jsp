package service.User;

import java.util.List;

import dao.user.User1DAO;
import dto.user.User1DTO;

public class User1Service {
	
	// 싱글톤
	private static User1Service instance = new User1Service();
	public static User1Service getInstance() {
		return instance;
	}
	private User1Service() {}
	
	// dao 싱글톤 객체 가져오기
	private User1DAO dao = User1DAO.getInstance();	
	
	// DAO 메서드 호출 - Service에 맞게 네이밍
	public void register(User1DTO dto) {
		dao.insertUser1(dto);
	}	
	public User1DTO findById(String uid) {
		return dao.selectUser1(uid);
	}
	public List<User1DTO> findAll() {
		return dao.selectAllUser1();
	}
	public void modify(User1DTO dto) {
		dao.updateUser1(dto);
	}
	public void delete(String uid) {
		dao.deleteUser1(uid);
	}

}