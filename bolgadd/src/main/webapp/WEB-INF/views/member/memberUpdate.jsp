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
	<title>회원정보 수정</title>
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
		
	});
</script>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false"></jsp:include>

<body>
<div class="bodyin">
	<P>  
		(세션GET) 현재 아이디 ${sessionScope.tcId}(으)로 로그인 되어있습니다.
		<br>
		(세션GET) NAME : ${sessionScope.tcNm}
		<br>
		(컨트롤러에서 ModelAndView 리턴) KT_ID : ${outVo.TC_ID}
		<br>
		(컨트롤러에서 ModelAndView 리턴) KT_PW : ${outVo.TC_PW}
		<br>
		(컨트롤러에서 ModelAndView 리턴) KT_NAME : ${outVo.TC_NM }
	</P>
</div>
</body>
</html>