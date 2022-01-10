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
		// ���
		$(".cencle").on("click", function(){
			
			location.href = "/home";
					    
		})
	
		$("#submit").on("click", function(){
			if($("#tcId").val()==""){
				alert("���̵� �Է����ּ���.");
				$("#tcId").focus();
				return false;
			}
			if($("#tcPw").val()==""){
				alert("��й�ȣ�� �Է����ּ���.");
				$("#tcPw").focus();
				return false;
			}
			if($("#tcNm").val()==""){
				alert("������ �Է����ּ���.");
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
						alert("���� ���̵� �����մϴ�.");
						$("#tcId").focus();
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

<jsp:include page="/WEB-INF/views/top.jsp" flush="false"></jsp:include>

<body>
<div class="bodyin">
	<section id="container">
		<div class="form-group has-feedback">
			<label class="control-label" for="tcId">���̵�</label>
			<input class="form-control" type="text" id="tcId" name="tcId" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="tcPw">�н�����</label>
			<input class="form-control" type="password" id="tcPw" name="tcPw" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="tcName">����</label>
			<input class="form-control" type="text" id="tcNm" name="tcNm" />
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="button" id="submit">ȸ������</button>
			<button class="cencle btn btn-danger" type="button">���</button>
		</div>
	</section>
</div>
</body>
</html>