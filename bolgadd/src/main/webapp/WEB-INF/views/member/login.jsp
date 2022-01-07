<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>로그인</title>
</head>

<script type="text/javascript">

	$(document).ready(function(){

		$("#loginBtn").on("click", function(){
			var data = {
				ktId : $("#ktId").val()
				, ktPw : $("#ktPw").val()
			}
			console.log(data);
			$.ajax({
				type: 'POST',
				url: "/member/login",
				data: data,
				dataType : "text",
				success: function(data){
					
					if (data == 'pwNotEquals') {
						alert("비밀번호가 다릅니다.");
						$("#ktPw").focus();
					}else if (data == 'noMember') {
						alert("가입된 회원이 아닙니다.");
					}else if (data == 'login') {
						alert("로그인 되었습니다.");
						location.href = "/home";
					}
					
				},
				error: function(request,status,error){
					alert("로그인 도중 에러가 발생하였습니다 : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
				},
				fail: function(){
					alert("로그인에 실패하였습니다.");
				}
			});
		});
	})
	
</script>

<body>

<h1> 로그인 </h1>

<fieldset>
  <legend> 로그인 </legend>
<!--   <form action="/member/loginPost" method="post"> -->
    ID : <input type="text" name="ktId" id="ktId"> <br>
    PW : <input type="password" name="ktPw" id="ktPw"> <br>
<!--     <input type="submit" id="loginBtn" value="로그인">           -->
    <input type="button" id="loginBtn" value="로그인">          
    <input type="button" onclick="location.href='/member/register'" value="회원가입">
    <input type="button" onclick="location.href='/home'" value="취소">
<!--   </form>   -->
</fieldset>

</body>
</html>