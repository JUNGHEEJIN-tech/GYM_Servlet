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
		<ul class="tabmenu02">
			<li class="menu_0201">
				<a href="${conPath }/rule_register/rule">이용자 준수사항</a>
			</li>
			<li class="menu_0202">
				<a href="${conPath }/rule_register/register">수강신청</a>
			</li>			
		</ul>
	</div>
</div>
</body>
</html>