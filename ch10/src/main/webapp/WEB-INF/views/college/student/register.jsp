<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>College/Student::register</title>
	</head>
	<body>
		<h3>College/Student 등록</h3>
		
		<a href="/ch10">처음으로</a>
		<a href="/ch10/college/student/list.do">목록이동</a>
		
		<form action="/ch10/college/student/register.do" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="stdno" placeholder="아이디 입력"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름 입력"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" placeholder="휴대폰 입력(- 포함)"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="date" name="birth" placeholder="주소 입력"/></td>
				</tr>
				<tr>
					<td>전공</td>
					<td><select name="major">
						<option value="">컴퓨터공학</option>
						<option value=""></option>
						<option value=""></option>
						<option value=""></option>
						<option value=""></option>
					</select>
					</td>
				</tr>
				<tr>
					<td>입학일</td>
					<td><input type="date" name="enr_rdate"/></td>
				</tr>
				<tr>					
					<td colspan="2" align="right">
						<input type="submit" value="등록하기"/>
					</td>
				</tr>			
			</table>		
		</form>
	</body>
</html>