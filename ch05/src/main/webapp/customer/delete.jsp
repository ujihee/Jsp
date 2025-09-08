<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cid = request.getParameter("cid");
	
	try{
		Context initCtx = new InitialContext(); 
		Context ctx = (Context) initCtx.lookup("java:comp/env"); 
		DataSource ds = (DataSource) ctx.lookup("jdbc/tmfflavndn"); 
		
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("DELETE FROM CUSTOMER WHERE CID = ?");
		psmt.setString(1, cid);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

	// 목록이동
		response.sendRedirect("/ch05/customer/list.jsp");

%>
