<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글</title>
<script>
function total(){
}
</script>

</head>
<body>
	<a href="${pageContext.request.contextPath}"><h1>메인으로 </h1></a>
	<h1>${sessionScope.loginId }님의 구매목록</h1>
	<c:if test="${olist==null}">
	<h1>구매목록이 없습니다.</h1>
	</c:if>
	<c:if test="${olist!=null}">
	<c:set var="total" value="0"/>
	<table border="1px">
		<tr>
			<th>구입일</th>
			<th>상품코드</th>
			<th>제목</th>
			<th>가격</th>
			<th>수량</th>
			<th>합계금액</th>
		</tr>
		<c:forEach varStatus="stat" var="item" items="${olist}">
			<tr>
				<td>${item.purchasedate}</td>
				<td>${item.bookcode}</td>
				<td>${item.title}</td>
				<td>${item.price}</td>
				<td>${item.purchasecnt}</td>
				<td>${item.purchasecnt*item.price} </td>
				<c:set var="total" value="${total+(item.purchasecnt*item.price)}"/>
		</c:forEach>
			<tr>
				<td>누적합계</td>
				<td colspan="5">
					<c:out value="${total }"/>
				</td>
			</tr>
	</table>
	</c:if>
</body>
</html>