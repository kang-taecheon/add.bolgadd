<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>����</title>
	
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
		
	})
</script>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false"></jsp:include>

<body>
<div class="bodyin">
	<h1> Hello world! </h1>
	
	<%-- <P>  The time on the server is ${serverTime}. </P> --%>
	 
	<c:if test="${sessionScope.tcId eq null }">
		<P>  �α��� �Ǿ����� �ʽ��ϴ�. </P>
	</c:if>
	<c:if test="${sessionScope.tcId ne null }">
		<P>  
			���� ���̵� ${sessionScope.tcId}(��)�� �α��� �Ǿ��ֽ��ϴ�. 
			<br>
			NAME : ${sessionScope.tcNm}
		</P>
	</c:if>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
</body>
</html>