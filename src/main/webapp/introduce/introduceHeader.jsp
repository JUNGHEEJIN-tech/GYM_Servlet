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
	<div class="tab_menu">
        <ul class="tabmenu01">
            <li class="menu_0101 selected"><a href="${conPath }/introduce/intro" target="_self">인사말</a></li>
            <li class="menu_0103"><a href="${conPath }/introduce/attractionInfo" target="_self">시설현황</a></li>
            <li class="menu_0106"><a href="${conPath }/introduce/locationInfo" target="_self">오시는 길</a></li>
        </ul>
    </div>
</body>
</html>