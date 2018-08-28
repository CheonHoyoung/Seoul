<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>
</head>
<body>
	<div class="wrap">
		<div class="info">
			<div class="title">
				카카오 스페이스닷원
				<div class="close" onclick="closeOverlay()" title="닫기"></div>
			</div>
			<div class="body">
				<div class="img">
					<img src="http://cfile181.uf.daum.net/image/250649365602043421936D"
						width="73" height="70">
				</div>
				<div class="desc">
					<table>
					<c:forEach var="car" items="${car }" varStatus="status">
						<tr>
							<td class="center">${car.car}</td>
							<td class="center">${car.reserve}</td>  
						</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>