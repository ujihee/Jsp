package dao.college;

import dto.student.StudentDTO;
import util.DBHelper;

public class StudentDAO extends DBHelper{
	
	private static final StudentDAO INSTANCE = new StudentDAO();
	
	public static StudentDAO getInstance() {
		return INSTANCE;
	}
	
	private StudentDAO() {}
	
	private final String DBCP = "jdbc/college";
	
	public void insertStudent() {
		
		try {
			conn = getConnection(DBCP);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectStudent() {
		try {
			conn = getConnection(DBCP);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectAllStudent() {
		
		try {
			conn = getConnection(DBCP);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateStudent() {
		
		try {
			conn = getConnection(DBCP);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteStudent() {}
	
	

}
