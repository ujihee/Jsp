<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String address = request.getParameter("address");
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env"); 
		DataSource ds = (DataSource) ctx.lookup("jdbc/tmfflavndn");
		
		Connection conn = ds.getConnection();
		
		String sql = "UPDATE USER5 SET GENDER=?, AGE=?, ADDR=? WHERE NAME=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, gender);
		psmt.setInt(2, Integer.parseInt(age));
		psmt.setString(3, address);
		psmt.setString(4, name);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		

	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch05/user5/list.jsp");

%>