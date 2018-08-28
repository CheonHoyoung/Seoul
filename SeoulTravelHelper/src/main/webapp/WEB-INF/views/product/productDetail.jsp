<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check1(){
	var a = document.getElementById("ea").value;
	
	if(isNaN(a)){
		alert("숫자가 아닙니다");
		return;
	}
	if(a.length<1){
		alert("입력하세요");
		return;
	}
	
	if(a>${bcontent.quantity }){
		alert("재고수량보다 더 클수없습니다");
		return;
	}
	document.getElementById("form").action ="orderList";
	document.form.submit();
}

function check2(){
	document.getElementById("form").action ="wishList";
	document.form.submit();
}
</script>

</head>
<body>
	<h1>[상품 상세 정보]</h1>
	<form id="form" name="form" action="orderList" method="post">
	<table border="1px">
		<tr>
			<td>
				삼품코드
			</td>
			<td>
				${bcontent.bookcode }
				<input type="hidden" name="bookcode" id="bookcode" value=${bcontent.bookcode }>
			</td>
		</tr>
		<tr>
			<td>${bcontent.bookcode }
				제목
			</td>
			<td>${bcontent.title }</td>
		</tr>
		<tr>
			<td>
				가격
			</td>
			<td>${bcontent.price }</td>
		</tr>
		<tr>
			<td>
				재고수량
			</td>
			<td>${bcontent.quantity }</td>
		</tr>
		<tr>
			<td colspan="2">구매수량<input type="text" id="ea" name="ea">
			<input type="button" onclick="check1()" value="구입하기">
			<input type="button" onclick="check2()" value="관심상품저장"></td>
		</tr>
	</table>
	</form>
</body>
</html>
