package service.User;

import dto.user.User2DTO;

public class User2Service {
	
	private static User2Service instance = new User2Service();
	public static User2Service getInstance() {
		return instance;
	}
	
	private User2Service() {}
	
	public void insertUser2(User2DTO dto) {}
	public void selectUser2(String uid) {}
	public void selectAllUser2() {}
	public void updateUser2() {}
	public void deleteUser2() {}

}