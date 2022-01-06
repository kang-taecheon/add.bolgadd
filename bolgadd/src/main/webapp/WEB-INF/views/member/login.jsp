<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>Insert title here</title>
</head>

<script type="text/javascript">

	$(document).ready(function(){
		
<%-- 		var pw = '<%=(String)session.getAttribute("ktPw")%>'; --%>
<%-- 		var session = '<%=session%>'; --%>
		
// 		console.log(">>>>> session : " + session);
		
// 		if (pw == "notPw") { // ��й�ȣ�� ����ġ �� ��
// 			alert("��й�ȣ�� Ʋ���ϴ�.");
// 			sessionStorage.clear();
// 		}else if (pw == "noMem") { // ȸ�� ������ ���� ��
// 			alert("������ ��ġ�ϴ� ȸ���� �����ϴ�.");
// 			sessionStorage.clear();
// 		}

		
		$("#loginBtn").on("click", function(){
			var data = {
				ktId : $("#ktId").val()
				, ktPw : $("#ktPw").val()
			}
			console.log(data);
			$.ajax({
				type: 'POST',
				url: "/member/login",
				data: data,
				dataType : "text",
				success: function(data){
					
					if (data == 'pwNotEquals') {
						alert("��й�ȣ�� �ٸ��ϴ�.");
						$("#ktPw").focus();
					}else if (data == 'noMember') {
						alert("���Ե� ȸ���� �ƴմϴ�.");
					}else if (data == 'login') {
						alert("�α��� �Ǿ����ϴ�.");
						location.href = "/home";
					}
					
				},
				error: function(request,status,error){
					alert("�α��� ���� ������ �߻��Ͽ����ϴ� : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
				},
				fail: function(){
					alert("�α��ο� �����Ͽ����ϴ�.");
				}
			});
		});
	})
	
</script>

<body>

<h1> �α��� </h1>

<fieldset>
  <legend> �α��� </legend>
<!--   <form action="/member/loginPost" method="post"> -->
    ID : <input type="text" name="ktId" id="ktId"> <br>
    PW : <input type="password" name="ktPw" id="ktPw"> <br>
<!--     <input type="submit" id="loginBtn" value="�α���">           -->
    <input type="button" id="loginBtn" value="�α���">          
    <input type="button" onclick="location.href='/member/register'" value="ȸ������">
    <input type="button" onclick="location.href='/home'" value="���">
<!--   </form>   -->
</fieldset>

</body>
</html>