<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space GYM | 채용공고</title>
<link rel="stylesheet" href="${conPath }/resources/css/default.css"/>
<link rel="stylesheet" href="${conPath }/resources/css/global.css"/>
<link rel="stylesheet" href="${conPath }/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${conPath }/resources/css/style_board.css">
<link rel="stylesheet" href="${conPath }/resources/css/style.css">

<script>
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "04_07";
var g5_sca       = "";
var g5_editor    = "smarteditor2";
var g5_cookie_domain = "";
</script>
<script src="${conPath }/resources/js/jquery-1.12.4.min.js"></script>
<script src="${conPath }/resources/js/jquery-migrate-1.4.1.min.js"></script>
<script src="${conPath }/resources/js/jquery.menu.js"></script>
<script src="${conPath }/resources/js/common.js"></script>
<script src="${conPath }/resources/js/wrest.js"></script>
<script src="${conPath }/resources/js/placeholders.min.js"></script>
<script src="${conPath }/resources/js/global.js"></script>
</head>
<body>
	<script>
		var snum = "menu_0407";
	</script>
<jsp:include page="../header.jsp"/>
	
	<div class="hd_menu_bg" style="display: none; height: 2.22283px;"><div style="height: 241px;"></div></div>
<!-- } 헤더 끝 -->
<!-- 비주얼 시작 { -->
<div class="sub_visual">
	<div class="bg_vis">
		<ul class="list_init">
			<li class="vis01" style="background: url(&quot;${conPath}/resources/img/sub_vis01.jpg&quot;) 50% 50% / auto 100% no-repeat; width: 1904px; display: list-item;">
				<div class="txt_vis in_1200">
					<span>스페이스씨엘 연수생들을 위한</span>
					<strong>Space GYM</strong>
				</div>
			</li>
		</ul>
	</div>
</div>
<!-- } 비주얼 끝 -->
<!-- 서브 콘텐츠 시작 { -->
<jsp:include page = "../board/board_header.jsp"/>

	<div class="sub_contents">
		<h1 class="page_title">채용공고</h1>
		<!-- 내용 시작 { -->
		<div class="page">
		
<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">

<!-- 게시판 검색 시작 { -->
    <div class="bo_sch_wrap">
        <fieldset class="bo_sch">
            <form action="search" method="get" > 
            <label for="filter"></label>       
            <select name="f" id="filter">
                <option value="title">제목</option>
                <option value="writer">글쓴이</option>
            </select>            
            <div class="sch_bar">
            	<label for="query"></label>
                <input type="text" name="query" value="" required="" id="query" class="sch_input" size="25" maxlength="20" placeholder="검색어를 입력해주세요">
                <button type="submit" value="검색" class="sch_btn">검색</button>
            </div>
            </form>
        </fieldset>
    </div>
<!-- } 게시판 검색 끝 -->
    
    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
    <div id="bo_btn_top">
        <div id="bo_list_total">
            <!-- <span>Total ${Recruit_BoardCount} 건</span> -->
            ${param.pageNum eq null? '1' : param.pageNum}페이지
        </div>
        <!-- 임시로 일단 노출. 나중에 로그인 처리 필요. -->
     	<ul class = "btn_bo_user">
     		<li>
     			<a href="${conPath }/board/recruitInput" class = "btn btn_b02">글쓰기</a>
     		</li>
     	</ul>
     	   
    </div>
    
    <!-- } 게시판 페이지 정보 및 버튼 끝 -->

	<div class="tbl_head01 tbl_wrap">    
		<table>
			<caption>채용공고 목록</caption>
			<thead>
			<tr>
				<th scope="col">아이디</th>
            	<th scope="col">제목</th>
            	<th scope="col">작성자</th>
            	<th scope="col">작성일</th>
            	<th scope="col">조회</th>            	
			</tr>
			</thead>
		<c:forEach var = "board" items="${boards}">
			<tr>
				<td>${board.id}</td>
				<td><a href = "Recruit_Board/detail?id=${board.id}">${board.title}</td>
				<td>${board.writer}</td>
				<td>${board.regist_Date}</td>
				<td>${board.views}</td>		
			</tr>
		</c:forEach>
	</table>
<!-- 페이지 영역 -->
  
	</div>       
</div>        
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>