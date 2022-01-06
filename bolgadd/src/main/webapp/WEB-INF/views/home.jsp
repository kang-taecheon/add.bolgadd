<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>Insert title here</title>
<title>메인</title>
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
	})
</script>

<body>
<h1>
	Hello world!  
</h1>

<%-- <P>  The time on the server is ${serverTime}. </P> --%>
 
<c:if test="${sessionScope.ktId eq null }">
	<P>  session is null </P>
</c:if>
<c:if test="${sessionScope.ktId ne null }">
	<P>  session is ${sessionScope.ktId} </P>
</c:if>

<!-- 로그인하였을 때 로그인, 회원가입 버튼숨기고 로그아웃 버튼 표시해야함 -->
<c:if test="${sessionScope.ktId eq null }"> <!-- 로그인이 되어있지 않을 때 -->
	<input type="button" value="로그인" onclick="location.href='/member/login'"/>
	<input type="button" value="회원가입" onclick="location.href='/member/register'"/>
</c:if>
<c:if test="${sessionScope.ktId ne null }"> <!-- 로그인이 되었을 때 -->
	<input type="button" value="로그아웃" id="logout"/>
</c:if>

</body>
</html>