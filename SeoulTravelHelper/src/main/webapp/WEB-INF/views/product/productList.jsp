<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글</title>
<script>
/* function viewFunc(seq){
	document.getElementById("seq").value=seq;
	document.viewDetail.submit();
} */
</script>

</head>
<body>
	<a href="${pageContext.request.contextPath}"><h1>메인으로 </h1></a>
	<c:if test="${blist==null}">
	<h1>게시글이 없습니다.</h1>
	</c:if>
	<c:if test="${blist!=null}">
	<table border="1px">
		<tr>
			<th>상품코드</th>
			<th>제목</th>
		</tr>
		<c:forEach varStatus="stat" var="item" items="${blist}">
			<tr>
				<td>${item.bookcode}</td>
				<td style="width: 200px;text-align: center"><a href="detail?bookcode=${item.bookcode}">${item.title}</a></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
</body>
</html>