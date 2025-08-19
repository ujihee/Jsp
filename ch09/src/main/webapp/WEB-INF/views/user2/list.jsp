<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2::list</title>
	</head>
	<body>
		<h3>User2 목록</h3>
		
		<a></a>
		<a></a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
		</table>
		<c:forEach var="dto" items="${requestScope.dtoList}">
			<tr>
				<td>${dto.getUser_id}</td>
				<td>${dto.getName}</td>
				<td>${dto.getHp}</td>
				<td>${dto.getAge}</td>
				<td>
					<a></a>
					<a></a>
				</td>
			</tr>
		</c:forEach>
	</body>
</html>