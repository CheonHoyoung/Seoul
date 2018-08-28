<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글</title>
<script>
function checked1(num){
	document.getElementById("bookcode").value = num;
	document.form.submit();
}
</script>

</head>
<body>
	<a href="${pageContext.request.contextPath}"><h1>메인으로 </h1></a>
	<c:if test="${wlist==null}">
	<h1>위시리스트가 없습니다.</h1>
	</c:if>
	<c:if test="${wlist!=null}">
	<form name="form" action="deleteWish" method="get">
		<table border="1px">
			<tr>
				<th>상품코드</th>
				<th>제목</th>
				<th>가격</th>
				<th>관심상품 삭제하기</th>
			</tr>
			<c:forEach varStatus="stat" var="item" items="${wlist}">
				<tr>
					<td>${item.bookcode}<input type="hidden" name="bookcode" id="bookcode" value=${item.bookcode }></td>
					<td>${item.title}</td>
					<td>${item.price}</td>
					<td><input type="button" onclick="checked1(${item.bookcode })" value="삭제"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	</c:if>
</body>
</html>