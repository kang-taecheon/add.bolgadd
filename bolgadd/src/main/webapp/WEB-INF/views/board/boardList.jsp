<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<title>자유게시판</title>
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
	
	/* 페이징 css */
	.page-wrap{margin-top: 15px;}
	.page-wrap .page{display: flex; justify-content: center;}
	.page-wrap .page > a{position: relative; width: 20px; text-indent: -9999px; border: 1px solid #5d738d; border-radius: 2px; }
	.page-wrap .page .btn-page-prev:before{content:''; position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%) rotate(180deg); width: 7px; height: 5px; background: url(../images/btn-page-on.png) #fff center center no-repeat; background-size: 5px 7px;}
	.page-wrap .page .btn-page-prev.disabled{border: 1px solid #93a3b7;}
	.page-wrap .page .btn-page-prev.disabled:before{background: url(../images/btn-page-off.png) center center no-repeat; background-size: 5px 7px;}
	.page-wrap .page .btn-page-next:before{content:''; position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%); width: 7px; height: 5px; background: url(../images/btn-page-on.png) #fff center center no-repeat; background-size: 5px 7px;}
	.page-wrap .page .btn-page-next.disabled{border: 1px solid #93a3b7;}
	.page-wrap .page ul{display: flex; margin: 0 10px; text-align: center;}
	.page-wrap .page ul li{position: relative; width: 26px;}
	.page-wrap .page ul li.active:before{content: ''; width: 8px; height: 1px; position: absolute; bottom: 4px; background: #222; left: 50%; transform: translateX(-45%);}
	.page-wrap .page ul li.active a{color: #222; font-weight: bold;}
	.page-wrap .page ul li a{font-size: 13px; letter-spacing: -0.33px; text-align: center; color: #666666;}
	.page-wrap .page ul li:hover a{color: #222; font-weight: bold;}
</style>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		
// 		$("#btnSearch").one("click", function(){
// 			console.log("1111");
// 		});
		
		
		$("#btnSearch").on("click", function(){
			console.log("검색 시작");
			var data = {
				tcBoardTitel : $("#tcBoardTitel").val()
				, tcNm : $("#tcNm").val()
			}
			
			$.ajax({
				data: data,
				type: "POST",
				url : '/board/boardList',
// 				dataType: 'json',
				success: function(data) {
	// 	 			console.log(JSON.stringify(data, null, 4));
					console.log("검색 success : " + data);
				},
				error: function(request,status,error){
					alert("조회 도중 에러가 발생하였습니다 : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
				},
				fail: function(){
					alert("조회에 실패하였습니다.");
				}
			});
		});
		
	});
	
	function detailBtn(sn) {
		$("#tcBoardSn").val(sn);
		$("#detailSubmit").attr("action", "/board/boardDetail"); // attribute setting
		$("#detailSubmit").submit();
	}
	
	// 페이징 클릭 이벤트
	function list(page){
// 		$("#boardListForm").attr("action", "/mngBbsSelect.do");
	    $("#curPage").val(page);
	    $("#boardListForm").submit();
	}
</script>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false"></jsp:include>


<form id="detailSubmit">
	<input type="hidden" id="tcBoardSn" name="tcBoardSn">
</form>

<body>
	<div class="bodyin">
		<p>
			게시판
			<br>
			(세션GET) 현재 아이디 ${sessionScope.tcId}(으)로 로그인 되어있습니다.
			<br>
			(세션GET) NAME : ${sessionScope.tcNm}
			<br>
			(세션GET) SN : ${sessionScope.tcSn}
			<br>
			(세션GET) RYT : ${sessionScope.tcRyt}
			<br>
			(컨트롤러GET) list : ${list}
		</P>
		
		<form id="boardListForm" action="/board/boardList" method="post">
			<input type="hidden" id="curPage" name="curPage">
<!-- 			<div> -->
<!-- 				<div> -->
<!-- 	            	<input type="text" value="" name="tcBoardTitel" id="tcBoardTitel" placeholder="제목" maxlength="50"/> -->
<!-- 				</div> -->
	
<!-- 	            <div> -->
<!-- 	            	<input type="text" value="" name="tcNm" id="tcNm" placeholder="작성자" maxlength="25"/> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
			<div>
				<div>
					<select id="selectOption" name="selectOption">
						<option value="titel">제목</option>
						<option value="name">이름</option>
					</select>
				</div>
				<div>
					<input type="text" value="" name="inputText" id="inputText" placeholder="" maxlength="50"/>
				</div>
			</div>
			
			<button class="button" id="btnSearch" name="btnSearch">검색</button>
		</form>
		
		<!-- table -->
		<table class="table">
        	<caption></caption>
			<colgroup>
				<col style="width: 5%">
				<col style="width: 40%">
				<col style="width: 20%">
				<col style="width: 20%">
				<col style="width: 5%">
			</colgroup> 
            <thead>
            	<tr>
                	<th style="text-align: center">NO</th>
                    <th style="text-align: center">제목</th>
                    <th style="text-align: center">작성자</th>
                    <th style="text-align: center">작성일</th>
                    <th style="text-align: center">조회수</th>
				</tr>
			</thead>
            <tbody>
            	<c:choose>
                	<c:when test="${fn:length(list) != 0 }">
	                	<c:forEach var="item" items="${list}" begin="0" step="1">
		                	<td style="text-align: center">${item.RN}</td>
<%-- 		                	<td>${item.TC_BOARD_TITEL}</td> --%>
							<td><a href="javascript:detailBtn('${item.TC_BOARD_SN}');">${item.TC_BOARD_TITEL}</a></td>
		                	<td style="text-align: center">${item.TC_NM}</td>
		                	<td style="text-align: center">${item.REG_DATE}</td>
		                	<td style="text-align: center">${item.CNT}</td>
						</c:forEach>
					</c:when>
                	<c:otherwise>
                		<td colspan="5" style="text-align: center;">
                			조회된 데이터가 없습니다.
						</td>
					</c:otherwise>
				</c:choose>
			</tbody>
        </table>
        <!-- //table -->
        
        <!-- 페이징 시작 -->
        <div class="page-wrap">
			<div class="page">
				<c:if test="${pv.curBlock > 1}">
			  		<a href="javascript:list('${pv.prevPage}')" class="btn-page-prev disabled">이전</a>
			  	</c:if>
			  	<ul>
			  	<c:forEach var="num" begin="${pv.blockBegin}" end="${pv.blockEnd}">
			  		<c:choose>
			  			<c:when test="${num == pv.curPage}">
			  				<li style="list-style: none;" class="active">${num}</li>
			  			</c:when>
			  			<c:otherwise>
			  				<li style="list-style: none;" ><a href="javascript:list('${num}')">${num}</a></li>
			  			</c:otherwise>
			  		</c:choose>
			  	</c:forEach>
			  	</ul>
			  	<c:if test="${pv.curBlock <= pv.totBlock}">
			  		<a href="javascript:list('${pv.nextPage}')" class="btn-page-next">다음</a>
			  	</c:if>
			</div>
		</div>
        <!-- 페이징 끝 -->
        
		<c:if test="${sessionScope.tcRyt ne null}">
			<p>글쓰기 버튼 생성할 자리</p>
		</c:if>
	</div>
</body>
</html>