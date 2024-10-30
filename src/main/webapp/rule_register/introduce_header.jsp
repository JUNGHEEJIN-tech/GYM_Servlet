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
			<ul class="tabmenu03">
				<li class="menu_0301">
					<a href="#" target="_self">이용수칙</a>
				</li>
				<li class="menu_0302">
					<a href="${conPath }/introduce/onlineRegister" target="_self">온라인접수 안내</a>
				</li>
				<li class="menu_0303">
					<a href="#" target="_self">일일입장 안내</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>