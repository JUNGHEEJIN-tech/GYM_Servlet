<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div id="wrap_content" class="wrap_sub">
    <div class="tab_menu">
		<ul class="tabmenu04">			
			<li class="menu_0401">
				<a href="${conPath }/board/notice" target="_self">공지사항</a>
			</li>
			<li class="menu_0402">
				<a href="${conPath }/board/freeboard" target="_self">자유게시판</a>
			</li>
			<li class="menu_0403">
				<a href="${conPath }/board/qna" target="_self">묻고답하기</a>
			</li>
			<li class="menu_0404">
				<a href="${conPath }/main/schedule" target="_self">이달의 일정</a>
			</li>
			<li class="menu_0407">
				<a href="${conPath }/board/recruit" target="_self">채용공고</a>
			</li>
		</ul>		
	</div>
</div>
</body>
</html>