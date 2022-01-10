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

<style type="text/css">
	.main {
		float:left;
		margin-top:15px;
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
	}
	.top {
		height: 50px;
		background-color: #D8D8D8;
		font-weight: 200;
		font-size: 14px;
	}
	.btn {
		float:right;
		margin-right: 10px;
		margin-top:4px;
	}
	.homeBtn {
		float: left;
		padding-right: 30px;
		margin-left:10px; 
		margin-top:10px;
	}
</style>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$("#logout").on("click", function(){
			if( confirm("���� �α׾ƿ� �Ͻðڽ��ϱ�?")){
				$.ajax({
					type: 'POST',
					url: "/member/logout",
					dataType : "text",
					success: function(data){
						
						alert("�α׾ƿ��Ǿ����ϴ�");
						location.href = '/home';
						
					},
					error: function(request,status,error){
						alert("�α׾ƿ� ���� ������ �߻��Ͽ����ϴ� : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
					},
					fail: function(){
						alert("�α׾ƿ��� �����Ͽ����ϴ�.");
					}
				});
			}
		});
		
		$("#memberUpdate").on("click", function(){
			var id = "${sessionScope.tcId}";
			
			location.href="/member/memberUpdate";
		});
	})
</script>

<body>
	
	<div class='top'>
		<div class="homeBtn">
			<input type="button" value="Ȩ" onclick="location.href='/home'" />
		</div>
		
		<div class='main'>
			<p>TEST</p>
		</div>

		<div class='btn'>
			<c:if test="${sessionScope.tcId eq null }"> <%-- �α����� �Ǿ����� ���� �� --%>
				<input type="button" value="�α���" onclick="location.href='/member/login'"/>
				<input type="button" value="ȸ������" onclick="location.href='/member/register'"/>
			</c:if>
			<c:if test="${sessionScope.tcId ne null }"> <%-- �α����� �Ǿ��� �� --%>
				<input type="button" value="ȸ������" id="memberUpdate" />
				<input type="button" value="�α׾ƿ�" id="logout"/>
			</c:if>
		</div>
	</div>

</body>
</html>