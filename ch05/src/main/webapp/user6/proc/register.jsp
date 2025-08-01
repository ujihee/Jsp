<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/tmfflavndn");
		
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("INSERT INTO USER6 (SEQ, NAME, GENDER, AGE, ADDR) VALUES(SEQ_USER6.NEXTVAL, ?, ?, ?, ?)");
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setInt(3, Integer.parseInt(age));
		psmt.setString(4, addr);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("../list.jsp");

%>