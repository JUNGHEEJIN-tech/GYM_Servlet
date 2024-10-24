<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<div class="tab_menu">
        <ul class="tabmenu01">
            <li class="menu_0101 selected"><a href="${conPath }/introduce/intro" target="_self">인사말</a></li>
            <li class="menu_0103"><a href="${conPath }/introduce/attractionInfo" target="_self">시설현황</a></li>            
            <li class="menu_0105"><a href="#" target="_self">지도자 소개</a></li>
            <li class="menu_0106"><a href="#">오시는 길</a></li>
        </ul>
    </div>
</body>
</html>