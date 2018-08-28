<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글</title>
<script>
</script>

</head>
<body>
	<a href="${pageContext.request.contextPath}"><h1>메인으로 </h1></a>
	<c:if test="${blist==null}">
	<h1>베스트셀러가 없습니다.</h1>
	</c:if>
	<c:if test="${blist!=null}">
	<h1>가장많이 팔린 책</h1>
	<table border="1px">
		<c:forEach varStatus="stat" var="item" items="${blist}">
		<tr>
			<td>상품코드</td>
			<td>${item.bookcode}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${item.title}</td>
		</tr>
		<tr>
			<td>총 판매 수량</td>
			<td>${item.purchasecnt}</td>
		</tr>
		<tr>
			<td colspan="2">============================</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
</body>
</html>