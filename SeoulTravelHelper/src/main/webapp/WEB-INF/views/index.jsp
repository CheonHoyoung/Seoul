<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>[온라인 서점]</h1>
	<c:choose>
		<c:when test="${sessionScope.loginId==null}">
			<ul>
				<li><a href="join"><h3>회원가입</h3></a></li>
				<li><a href="login"><h3>로그인</h3></a></li>
				<li><a href="list"><h3>상품목록</h3></a></li>
				<li><a href="best"><h3>베스트셀러</h3></a></li>
				<li><a href="map"><h3>멥</h3></a></li>
				<li><a href="chat"><h3>채팅</h3></a></li>
			</ul>
		</c:when>
	</c:choose>
	
	<c:choose>
		<c:when test="${sessionScope.loginId!=null}">
			<ul>
				<li><a href="logout"><h3>로그아웃</h3></a></li>
				<li><a href="wishList"><h3>관심상품</h3></a></li>
				<li><a href="list"><h3>상품목록</h3></a></li>
				<li><a href="best"><h3>베스트셀러</h3></a></li>
				<li><a href="map"><h3>멥</h3></a></li>
				<li><a href="chat"><h3>채팅</h3></a></li>
			</ul>
		</c:when>
	</c:choose>
</body>
</html>