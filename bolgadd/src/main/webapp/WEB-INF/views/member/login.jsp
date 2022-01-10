<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
	<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- �ΰ����� �׸� -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>�α���</title>
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
		$("#tcId").focus();
		
		$("#loginBtn").on("click", function(){
			var data = {
				tcId : $("#tcId").val()
				, tcPw : $("#tcPw").val()
			}
			console.log(data);
			$.ajax({
				type: 'POST',
				url: "/member/login",
				data: data,
				dataType : "text",
				success: function(data){
					
					if (data == 'pwNotEquals') {
						alert("��й�ȣ�� �ٸ��ϴ�.");
						$("#tcPw").focus();
					}else if (data == 'noMember') {
						alert("���Ե� ȸ���� �ƴմϴ�.");
					}else if (data == 'login') {
						alert("�α��� �Ǿ����ϴ�.");
						location.href = "/home";
					}
					
				},
				error: function(request,status,error){
					alert("�α��� ���� ������ �߻��Ͽ����ϴ� : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
				},
				fail: function(){
					alert("�α��ο� �����Ͽ����ϴ�.");
				}
			});
		});
	})
	
</script>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false"></jsp:include>

<body>
<div class="bodyin">
	<h1> �α��� </h1>
	
	<fieldset>
	  <legend> �α��� </legend>
	<!--   <form action="/member/loginPost" method="post"> -->
	    ID : <input type="text" name="tcId" id="tcId"> <br>
	    PW : <input type="password" name="tcPw" id="tcPw"> <br>
	<!--     <input type="submit" id="loginBtn" value="�α���">           -->
	    <input type="button" id="loginBtn" value="�α���">          
	    <input type="button" onclick="location.href='/member/register'" value="ȸ������">
	    <input type="button" onclick="location.href='/home'" value="���">
	<!--   </form>   -->
	</fieldset>
</div>
</body>
</html>