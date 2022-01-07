<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		
		$("#memberUpdate").on("click", function(){
			var id = "${sessionScope.ktId}";
			
			alert( id );
			
			location.href="/member/memberUpdate";
		});
	})
</script>

<body>
<h1> Hello world! </h1>

<%-- <P>  The time on the server is ${serverTime}. </P> --%>
 
<c:if test="${sessionScope.ktId eq null }">
	<P>  로그인 되어있지 않습니다. </P>
</c:if>
<c:if test="${sessionScope.ktId ne null }">
	<P>  
		현재 아이디 ${sessionScope.ktId}(으)로 로그인 되어있습니다. 
		<br>
		NAME : ${sessionScope.ktName}
	</P>
</c:if>

<c:if test="${sessionScope.ktId eq null }"> <%-- 로그인이 되어있지 않을 때 --%>
	<input type="button" value="로그인" onclick="location.href='/member/login'"/>
	<input type="button" value="회원가입" onclick="location.href='/member/register'"/>
</c:if>
<c:if test="${sessionScope.ktId ne null }"> <%-- 로그인이 되었을 때 --%>
	<input type="button" value="회원수정" id="memberUpdate" />
	<input type="button" value="로그아웃" id="logout"/>
</c:if>

</body>
</html>