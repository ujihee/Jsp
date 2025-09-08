package dao.user;

import java.util.ArrayList;
import java.util.List;

import dto.user.User2DTO;
import util.DBHelper;

public class User2DAO extends DBHelper{
	
	private static final User2DAO INSTANCE = new User2DAO();
	public static User2DAO getInstance() {
		return INSTANCE;
	}
	
	private User2DAO(){}// private User2DAO() {} 는→ User2DAO 객체를 외부에서 직접 생성하지 못하게 막는 생성자다. 이 덕분에 오직 클래스 내부에 있는 INSTANCE 하나만 생성되고, 외부에서는 getInstance() 메서드로만 그 객체를 사용할 수 있다.
	
	private final String DBCP = "jdbc/studydb";
	
	public void insertUser2(User2DTO dto) {
		try {
			
			conn = getConnection(DBCP);
			
			String sql = "INSERT INTO USER2 VALUES (?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getBirth());
			psmt.setString(4, dto.getAddr());
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public User2DTO selectUser2(String uid) {
		
		User2DTO dto = null;
		
		try {
			
			conn = getConnection(DBCP);
			String sql = "select * from user2 where uid=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new User2DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setAddr(rs.getString(4));
			}
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public List<User2DTO> selectAllUser2() {
		
		List<User2DTO> dtoList = new ArrayList<>();
		
		try {
			conn = getConnection(DBCP);
			String sql = "SELECT * FROM USER2";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				User2DTO dto = new User2DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setAddr(rs.getString(4));
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtoList;
	}
	public void updateUser2(User2DTO dto) {
		try {
			conn = getConnection(DBCP);
			String sql = "UPDATE USER2 SET NAME =?, BIRTH =?, ADDR =? WHERE UID = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getBirth());
			psmt.setString(3, dto.getAddr());
			psmt.setString(4, dto.getUid());
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteUser2(String uid) {
		try {
			conn = getConnection(DBCP);
			String sql = "DELETE FROM USER2 WHERE UID = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, uid);
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
