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
		// 뒤로(임시, 검색조건 및 페이징을 유지한채로 list화면으로 가게 바꿔야함)
		$(".cencle").on("click", function(){
			location.href = "/board/boardList";
		});
	});
</script>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false"></jsp:include>

<form action="/board/boardDetail" method="get">
	<input type="hidden" id="tcBoardSn" name="tcBoardSn" value="" />
</form>

<body>
	<div class="bodyin">
		<p>
			게시판 상세조회
			<br>
			(세션GET) 현재 아이디 ${sessionScope.tcId}(으)로 로그인 되어있습니다.
			<br>
			(세션GET) NAME : ${sessionScope.tcNm}
			<br>
			(세션GET) SN : ${sessionScope.tcSn}
			<br>
			(세션GET) RYT : ${sessionScope.tcRyt}
			<br>
			(컨트롤러GET) map : ${map}
		</p>
		
		<h2>상세내용</h2>
		<table>
			<caption></caption>
			<colgroup>
				<col style="width:10%">
				<col style="width:40%">
				<col style="width:10%">
				<col style="width:40%">
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${map.TC_BOARD_TITEL}</td>
					<th>작성자</th>
					<td>${map.TC_NM}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${map.TC_BOARD_CN}</td>
				</tr>
				<tr>
					<th>파일이름</th>
					<td>${map.TC_FILE_NM}</td>
					<th>파일확장자</th>
					<td>${map.TC_FILE_EXT}</td>
				</tr>
			</tbody>
		</table>
		
		<div class="form-group has-feedback">
			<button class="cencle btn btn-danger" type="button">뒤로</button>
			<button class="btn btn-success" type="button" id="update">수정</button>
		</div>
	</div>
</body>
</html>