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
	<title>ȸ������</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// ���
		$(".cencle").on("click", function(){
			
			location.href = "/home";
					    
		})
	
		$("#submit").on("click", function(){
			if($("#ktId").val()==""){
				alert("���̵� �Է����ּ���.");
				$("#ktId").focus();
				return false;
			}
			if($("#ktPw").val()==""){
				alert("��й�ȣ�� �Է����ּ���.");
				$("#ktPw").focus();
				return false;
			}
			if($("#ktName").val()==""){
				alert("������ �Է����ּ���.");
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
						alert("���� ���̵� �����մϴ�.");
						$("#ktId").focus();
					}else if (e == 'notEquals') {
						alert("ȸ�����Կ� �����ϼ̽��ϴ�." + e);
						location.href = "/home";
					}
					
				},
				error: function(request,status,error){
					alert("ȸ������ ���� ������ �߻��Ͽ����ϴ� : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
				},
				fail: function(){
					alert("ȸ�����Կ� �����Ͽ����ϴ�.");
				}
			});
		});
		
			
		
	})
</script>
<body>
	<section id="container">
		<div class="form-group has-feedback">
			<label class="control-label" for="ktId">���̵�</label>
			<input class="form-control" type="text" id="ktId" name="ktId" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="ktPw">�н�����</label>
			<input class="form-control" type="password" id="ktPw" name="ktPw" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="ktName">����</label>
			<input class="form-control" type="text" id="ktName" name="ktName" />
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="button" id="submit">ȸ������</button>
			<button class="cencle btn btn-danger" type="button">���</button>
		</div>
	</section>
	
</body>
</html>