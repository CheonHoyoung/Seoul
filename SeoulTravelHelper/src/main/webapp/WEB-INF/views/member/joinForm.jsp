<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function checked11(){
		var a = document.getElementById("userid").value;
		var b = document.getElementById("password").value;
		if(a.length<3||a.length>10){
			alert("3에서 10이내의 아이디만 가능합니다.");
			return;
		}
		
		if(b.length<3||b.length>10){
			alert("3에서 10이내의 아이디만 가능합니다.");
			return;
		}
		document.form.submit();
	}
</script>
</head>
<body>
	<h1>[회원가입]</h1>
	<form name="form" action="join" method="post">
		<table border="1">
			<tr>
				<td><label class="secret" for="userid">ID</label></td>
				<td><input class="secret" type="text" name="userid" id="userid" placeholder="아이디"></td>
			</tr>
			
			<tr>
				<td><label class="secret" for="password">비밀번호</label></td>
				<td><input class="secret" type="password" name="password" id="password" placeholder="비밀번호"></td>
			</tr>
			
			<tr>
				<td><label class="secret" for="user_name">이름</label></td>
				<td><input class="secret" type="text" name="username" id="username" placeholder="이름"></td>
			</tr>
			
			<tr>
				<td><label class="secret" for="phone">주소</label></td>
				<td><input class="secret" type="tel" name="phone" id="phone" placeholder="전화번호"></td>
			</tr>
			
			<tr>
				<td><label class="secret" for="address">전화번호</label></td>
				<td><input class="secret" type="text" name="address" id="address" placeholder="상세주소"></td>
			</tr>
			<tr>
				<td><input type="button" onclick="checked11()" value="가입완료"></td>
			</tr>
		</table>
	</form>
</body>
</html>
