<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>����</title>
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
	<P>  �α��� �Ǿ����� �ʽ��ϴ�. </P>
</c:if>
<c:if test="${sessionScope.ktId ne null }">
	<P>  
		���� ���̵� ${sessionScope.ktId}(��)�� �α��� �Ǿ��ֽ��ϴ�. 
		<br>
		NAME : ${sessionScope.ktName}
	</P>
</c:if>

<c:if test="${sessionScope.ktId eq null }"> <%-- �α����� �Ǿ����� ���� �� --%>
	<input type="button" value="�α���" onclick="location.href='/member/login'"/>
	<input type="button" value="ȸ������" onclick="location.href='/member/register'"/>
</c:if>
<c:if test="${sessionScope.ktId ne null }"> <%-- �α����� �Ǿ��� �� --%>
	<input type="button" value="ȸ������" id="memberUpdate" />
	<input type="button" value="�α׾ƿ�" id="logout"/>
</c:if>

</body>
</html>