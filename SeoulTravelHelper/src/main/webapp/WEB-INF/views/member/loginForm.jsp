<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function checked11(){
	var a = document.getElementById("userid").value;
	var b = document.getElementById("password").value;
	if(a.length<1||b.length<1){
		alert("아이디나 비번을 입력해주세요");
		return;
	}
	document.form.submit();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>[로그인]</h1>
<p id="msg">${message }</p>
	<form name="form" action="login" method="post">
		<table border="1">
			<tr>
				<td><label class="secret" for="userid">아이디</label></td>
				<td><input class="secret" type="text" name="userid" id="userid" placeholder="아이디"></td>
			</tr>
			
			<tr>
				<td><label class="secret" for="password">비밀번호</label></td>
				<td><input class="secret" type="password" name="password" id="password" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td colspan="2"><center><input type="button" onclick="checked11()" value="로그인"/></center></td>
			</tr>
		</table>
	</form>
	
</body>
</html>