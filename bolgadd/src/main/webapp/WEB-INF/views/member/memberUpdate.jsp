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
</head>

<script type="text/javascript">
	$(document).ready(function(){
		alert("????");
	});
</script>

<body>

	<P>  
		(세션GET) 현재 아이디 ${sessionScope.ktId}(으)로 로그인 되어있습니다.
		<br>
		(세션GET) NAME : ${sessionScope.ktName}
		<br>
		(컨트롤러에서 ModelAndView 리턴) KT_ID : ${outVo.KT_ID}
		<br>
		(컨트롤러에서 ModelAndView 리턴) KT_PW : ${outVo.KT_PW}
		<br>
		(컨트롤러에서 ModelAndView 리턴) KT_NAME : ${outVo.KT_NAME }
	</P>

</body>
</html>