<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>메인</title>
	
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
		<P>  로그인 되어있지 않습니다. </P>
	</c:if>
	<c:if test="${sessionScope.tcId ne null }">
		<P>  
			현재 아이디 ${sessionScope.tcId}(으)로 로그인 되어있습니다. 
			<br>
			NAME : ${sessionScope.tcNm}
		</P>
	</c:if>
</div>
</body>
</html>