package dao.user;

import dto.user.User2DTO;
import util.DBHelper;

public class User2DAO extends DBHelper{
	
	private static final User2DAO INSTANCE = new User2DAO();
	public static User2DAO getInstance() {
		return INSTANCE;
	}
	
	private User2DAO(){}// private User2DAO() {} 는→ User2DAO 객체를 외부에서 직접 생성하지 못하게 막는 생성자다. 이 덕분에 오직 클래스 내부에 있는 INSTANCE 하나만 생성되고, 외부에서는 getInstance() 메서드로만 그 객체를 사용할 수 있다.

	public void insertUser2(User2DTO dto) {}
	public void selectUser2(String uid) {}
	public void selectAllUser2() {}
	public void updateUser2(User2DTO dto) {}
	public void deleteUser2(String uid) {}
}
