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
	<title>ȸ������ ����</title>
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
					    
		});
		
		$("#update").on("click", function(){
			if($("#tcNm").val()==""){
				alert("������ �Է����ּ���.");
				$("#tcNm").focus();
				return false;
			}
			
			var param = {
				tcId : "${outVo.TC_ID}"
				, tcPw : "${outVo.TC_PW}"
				, tcNm : $("#tcNm").val()
				, tcSn : "${outVo.TC_SN}"
			}
			
			$.ajax({
				type: 'POST',
				url: "/member/memberUpdatePost",
				data: param,
				success: function(e){
					
					alert("ȸ�������� �����Ǿ����ϴ�.");
					location.href = "/home";
					
				},
				error: function(request,status,error){
					alert("ȸ������ ���� ���� ������ �߻��Ͽ����ϴ� : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
				},
				fail: function(){
					alert("ȸ������ ������ �����Ͽ����ϴ�.");
				}
			});
		});
	});
</script>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false"></jsp:include>

<body>
<div class="bodyin">
	<P>  
		(����GET) ���� ���̵� ${sessionScope.tcId}(��)�� �α��� �Ǿ��ֽ��ϴ�.
		<br>
		(����GET) NAME : ${sessionScope.tcNm}
		<br>
		(��Ʈ�ѷ����� ModelAndView ����) KT_ID : ${outVo.TC_ID}
		<br>
		(��Ʈ�ѷ����� ModelAndView ����) KT_PW : ${outVo.TC_PW}
		<br>
		(��Ʈ�ѷ����� ModelAndView ����) KT_NAME : ${outVo.TC_NM }
	</P>
	
	<section id="container">
		<div class="form-group has-feedback">
			<label class="control-label" for="tcName">����</label>
			<input class="form-control" type="text" id="tcNm" name="tcNm" value="${outVo.TC_NM }" />
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="button" id="update">����</button>
			<button class="cencle btn btn-danger" type="button">���</button>
		</div>
	</section>
</div>
</body>
</html>