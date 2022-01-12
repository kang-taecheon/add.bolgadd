<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
	.top {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
	}
	.bodyin {
		padding-top: 50px;
	}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			
			location.href = "/home";
					    
		})
	
		$("#submit").on("click", function(){
			if($("#tcId").val()==""){
				alert("아이디를 입력해주세요.");
				$("#tcId").focus();
				return false;
			}
			if($("#tcPw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#tcPw").focus();
				return false;
			}
			if($("#tcNm").val()==""){
				alert("성명을 입력해주세요.");
				$("#tcNm").focus();
				return false;
			}
			
			var param = {
				tcId : $("#tcId").val()
				, tcPw : $("#tcPw").val()
				, tcNm : $("#tcNm").val()
			}
			
			$.ajax({
				type: 'POST',
				url: "/member/insertMember",
				data: param,
				dataType : "text",
				success: function(e){
					
					if (e == 'equals') {
						alert("같은 아이디가 존재합니다.");
						$("#tcId").focus();
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

<jsp:include page="/WEB-INF/views/top.jsp" flush="false"></jsp:include>

<body>
<div class="bodyin">
	<section id="container">
		<div class="form-group has-feedback">
			<label class="control-label" for="tcId">아이디</label>
			<input class="form-control" type="text" id="tcId" name="tcId" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="tcPw">패스워드</label>
			<input class="form-control" type="password" id="tcPw" name="tcPw" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="tcName">성명</label>
			<input class="form-control" type="text" id="tcNm" name="tcNm" />
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="button" id="submit">회원가입</button>
			<button class="cencle btn btn-danger" type="button">취소</button>
		</div>
	</section>
</div>
</body>
</html>