<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
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
			if( confirm("정말 로그아웃 하시겠습니까?")){
				$.ajax({
					type: 'POST',
					url: "/member/logout",
					dataType : "text",
					success: function(data){
						
						alert("로그아웃되었습니다");
						location.href = '/home';
						
					},
					error: function(request,status,error){
						alert("로그아웃 도중 에러가 발생하였습니다 : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
					},
					fail: function(){
						alert("로그아웃에 실패하였습니다.");
					}
				});
			}
		});
		
		$("#memberUpdate").on("click", function(){
			
			location.href="/member/memberUpdate";
			
		});
	})
</script>

<body>
	
	<div class='top'>
		<div class="homeBtn">
			<input type="button" value="홈" onclick="location.href='/home'" />
			<input type="button" value="게시판" onclick="location.href='/board/boardList'" />
		</div>
		
		<div class='main'>
			<p>TEST</p>
		</div>

		<div class='btn'>
			<c:if test="${sessionScope.tcId eq null }"> <%-- 로그인이 되어있지 않을 때 --%>
				<input type="button" value="로그인" onclick="location.href='/member/login'"/>
				<input type="button" value="회원가입" onclick="location.href='/member/register'"/>
			</c:if>
			<c:if test="${sessionScope.tcId ne null }"> <%-- 로그인이 되었을 때 --%>
				<input type="button" value="회원수정" id="memberUpdate" />
				<input type="button" value="로그아웃" id="logout"/>
			</c:if>
		</div>
	</div>

</body>
</html>