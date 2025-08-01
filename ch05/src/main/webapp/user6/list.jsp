<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.User6VO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%
	
	List<User6VO> users = new ArrayList<>();
	
	try{
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/tmfflavndn");
	
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("SELECT * FROM USER6");
	
	while(rs.next()){
		User6VO vo = new User6VO();
		vo.setSeq(rs.getString(1));
		vo.setName(rs.getString(2));
		vo.setGender(rs.getString(3));
		vo.setAge(rs.getInt(4));
		vo.setAddr(rs.getString(5));
		
		users.add(vo);
		
	}
	rs.close();
	stmt.close();
	conn.close();

	}catch(Exception e){
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user6::list</title>
	</head>
	<body>
		<h3>User6 목록</h3>
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		
		<table border="1">
			<tr>
				<th>순번</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
			</tr>
			
			<%for(User6VO user6VO : users) {%>
			<tr>
				<td><%= user6VO.getSeq() %></td>
				<td><%= user6VO.getName() %></td>
				<td><%= user6VO.getGender() %></td>
				<td><%= user6VO.getAge() %></td>
				<td><%= user6VO.getAddr() %></td>

			<td>
				<a href = "./modify.jsp?seq=<%= user6VO.getSeq() %>">수정</a>
				<a href = "./delete.jsp?seq=<%= user6VO.getSeq() %>">삭제</a>
			</td>	
			</tr>
			<%} %>
		</table>
	
	</body>
</html>