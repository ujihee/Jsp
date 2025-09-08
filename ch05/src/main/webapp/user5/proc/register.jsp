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
		
		String sql = "INSERT INTO USER5 VALUES(?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, address);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();

	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch05/user5/list.jsp");

%>