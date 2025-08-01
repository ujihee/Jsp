<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.User4VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%
	List<User4VO> users = new ArrayList<>();

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/tmfflavndn");
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM USER4");
		
		while(rs.next()){
			User4VO vo = new User4VO();
			vo.setName(rs.getString(1));
			vo.setGender(rs.getString(2));
			vo.setAge(rs.getInt(3));
			vo.setAddr(rs.getString(4));
			
			users.add(vo);
		}
		
		conn.close();
		stmt.close();
		rs.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>user4::list</title>
	</head>
	<body>
		<h3>User4 목록</h3>
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		
		<table border="1">
			<tr>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
			</tr>
			
			<% for(User4VO user4VO : users) {%>
			<tr>
				<th><%= user4VO.getName() %></th>
				<th><%= user4VO.getGender() %></th>
				<th><%= user4VO.getAge() %></th>
				<th><%= user4VO.getAddr() %></th>
			<td>
			<a href = "./modify.jsp?name=<%= user4VO.getName() %>">수정</a>
			<a href = "./delete.jsp?name=<%= user4VO.getName() %>">삭제</a>
			</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>