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
</head>

<script type="text/javascript">
	$(document).ready(function(){
		alert("????");
	});
</script>

<body>

	<P>  
		(����GET) ���� ���̵� ${sessionScope.ktId}(��)�� �α��� �Ǿ��ֽ��ϴ�.
		<br>
		(����GET) NAME : ${sessionScope.ktName}
		<br>
		(��Ʈ�ѷ����� ModelAndView ����) KT_ID : ${outVo.KT_ID}
		<br>
		(��Ʈ�ѷ����� ModelAndView ����) KT_PW : ${outVo.KT_PW}
		<br>
		(��Ʈ�ѷ����� ModelAndView ����) KT_NAME : ${outVo.KT_NAME }
	</P>

</body>
</html>