<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>HOME</title>
</head>
<body>
	<h1>
		Hello!! With Animal 
	</h1>
	<P>  The time on the server is ${serverTime}. </P>
	
	<%-- 로그인이 되어있지 않으면 로그인 버튼을 --%>
	<c:if test="${empty sessionScope.vo }">
		<button onclick="location.href='/member/login'">로그인</button>
	</c:if>
	
	
	<%-- 로그인되어있으면 로그아웃 버튼을 --%>
	<c:if test="${not empty sessionScope.vo }">
		[<a href="${pageContext.request.contextPath }/board/protectList">보호동물 현황</a>]
		[<a href="${pageContext.request.contextPath }/board/boardList">게시판 리스트 가기</a>]
		[<a href="#">비번 변경</a>]
		[<a href="#">회원 탈퇴</a>]
		<button onclick="location.href='/member/logout'">로그아웃</button>
	</c:if>
</body>
</html>
