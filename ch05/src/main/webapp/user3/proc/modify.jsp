<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	String host = "jdbc:oracle:thin:@localhost:1521:xe"; 
	String user = "tmfflavndn";
	String pass = "1234";
	
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");	
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		Statement stmt = conn.createStatement();
		
		String sql = "UPDATE USER3 SET name = ?, hp = ?, age = ? WHERE user_id = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
	    psmt.setString(1, name);
	    psmt.setString(2, hp);
	    psmt.setString(3, age);
	    psmt.setString(4, user_id);
		
		psmt.executeUpdate();
		
		stmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("../list.jsp");


%>