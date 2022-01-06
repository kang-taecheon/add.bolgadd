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
	<title>회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			
			location.href = "/home";
					    
		})
	
		$("#submit").on("click", function(){
			if($("#ktId").val()==""){
				alert("아이디를 입력해주세요.");
				$("#ktId").focus();
				return false;
			}
			if($("#ktPw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#ktPw").focus();
				return false;
			}
			if($("#ktName").val()==""){
				alert("성명을 입력해주세요.");
				$("#ktName").focus();
				return false;
			}
			
			var param = {
				ktId : $("#ktId").val()
				, ktPw : $("#ktPw").val()
				, ktName : $("#ktName").val()
			}
			
			$.ajax({
				type: 'POST',
				url: "/member/insertMember",
				data: param,
				dataType : "text",
				success: function(e){
					
					if (e == 'equals') {
						alert("같은 아이디가 존재합니다.");
						$("#ktId").focus();
					}else if (e == 'notEquals') {
						alert("회원가입에 성공하셨습니다." + e);
						location.href = "/home";
					}
					
				},
				error: function(request,status,error){
					alert("회원가입 도중 에러가 발생하였습니다 : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
				},
				fail: function(){
					alert("회원가입에 실패하였습니다.");
				}
			});
		});
		
			
		
	})
</script>
<body>
	<section id="container">
		<div class="form-group has-feedback">
			<label class="control-label" for="ktId">아이디</label>
			<input class="form-control" type="text" id="ktId" name="ktId" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="ktPw">패스워드</label>
			<input class="form-control" type="password" id="ktPw" name="ktPw" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="ktName">성명</label>
			<input class="form-control" type="text" id="ktName" name="ktName" />
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="button" id="submit">회원가입</button>
			<button class="cencle btn btn-danger" type="button">취소</button>
		</div>
	</section>
	
</body>
</html>