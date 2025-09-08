<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내장객체 스코프</title>
		<%--
			날짜 : 2025/07/28
			이름 : 우지희
			내용 : JSP 내장객체 scope 실습하기
			
		 --%>
	
	</head>
	<body>
	<h3>JSP 내장객체 scope 실습하기</h3>
		
		<h4>내장객체 값 설정</h4>
	
	<%
		//내장객체 값 설정
		pageContext.setAttribute("name", "김유신");
		request.setAttribute("name", "김춘추");
		session.setAttribute("name", "장보고");
		application.setAttribute("name", "강감찬");
	%>
	
		<h4>내장객체 값 확인</h4>
		<p>
			pageContext 값 : <%= pageContext.getAttribute("name") %><br/>
			request 값: <%= request.getAttribute("name") %><br/>
			session 값: <%= session.getAttribute("name") %><br/>
			application 값: <%= application.getAttribute("name") %><br/>
		</p>
		<%
			pageContext.forward("./proc/resultScope.jsp");
		%>
	</body>
</html>

<%-- 
✅ 문제 요약
pageContext.setAttribute("name", "김유신");
이렇게 설정했는데 resultScope.jsp에서는
<%= pageContext.getAttribute("name") %>
이렇게 설정했는데 resultScope.jsp에서는 이 결과가 null 또는 빈값으로 나오는 이유는?

pageContext는 말 그대로 현재 JSP 페이지 하나에서만 유효해.

forward로 다른 JSP 페이지로 넘기면, 새로운 pageContext가 생성되기 때문에, 이전 pageContext에 설정한 값은 사라짐.

반대로 request, session, application은 그 범위가 더 넓기 때문에 계속 살아있어.

| 스코프         | 유지 범위                 | resultScope.jsp에서 값 보임? |
| ----------- | ------------------       |  -----------------------  |
| pageContext | 현재 JSP 파일 내에서만 유효    | ❌ (새 JSP에서는 없어짐)      |
| request     | 한 요청(Request) 내 전체     |     ✅ (forward 시 공유됨)  |
| session     | 같은 브라우저 세션 전체        |     ✅                    |
| application | 서버 전체(모든 사용자와 공유됨)  |    ✅                     |

pageContext는 현재 JSP에서만 사용됨 → forward하면 날아감

request, session, application은 넓은 범위를 가지므로 resultScope.jsp에서도 계속 보임

 --%>