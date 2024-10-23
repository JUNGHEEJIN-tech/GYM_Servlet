<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 검색</title>
<link rel="stylesheet" href="${conPath }/resources/css/default.css"/>
<link rel="stylesheet" href="${conPath }/resources/css/global.css"/>
<link rel="stylesheet" href="${conPath }/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${conPath }/resources/css/style_board.css">
<link rel="stylesheet" href="${conPath }/resources/css/style.css">

<script src="${conPath }/resources/js/jquery-1.12.4.min.js"></script>
<script src="${conPath }/resources/js/jquery-migrate-1.4.1.min.js"></script>
<script src="${conPath }/resources/js/jquery.menu.js"></script>
<script src="${conPath }/resources/js/common.js"></script>
<script src="${conPath }/resources/js/wrest.js"></script>
<script src="${conPath }/resources/js/placeholders.min.js"></script>
<script src="${conPath }/resources/js/global.js"></script>

</head>

<body>
	<div class="sub_contents">
		<h1 class="page_title">채용공고 검색</h1>		
		<div class="page">
			<section id="bo_w">
    			<h2 class="sound_only">채용공고 검색</h2>
    			
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
    
    <h3 style="font-size: 24px;">검색 결과: "${param.query}"으로 검색한 결과입니다.</h3>

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
    </div>
    
<a href ="recruitList" style="font-size: 17px;">목록으로</a>
</body>
</html>
