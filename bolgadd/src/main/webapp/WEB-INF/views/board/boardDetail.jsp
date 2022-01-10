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
	<title>게시판 상세조회</title>
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
		console.log(">>>>> 게시판 상세조회 진입");
	});
</script>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false"></jsp:include>

<body>
	<div class="bodyin">
		<p>
			게시판 상세조회
		</p>
	</div>
</body>
</html>