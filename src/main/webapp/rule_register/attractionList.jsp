<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 수업 목록 출력 페이지</title>
<link rel="stylesheet" href="${conPath }/resources/css/style_prog.css">
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<div class = "page">
		<div class = "sub_visual">
			<div class = "bg_vis">
				<ul class = "list_init">
					<li class = "vis01" style = "background: url(&quot;${conPath}/resources/img/sub_vis02.jpg&quot;) 50% 50% / auto 100% no-repeat; width: 1904px; display: list-item;">
					<div class = "txt_vis in_1200">
						<span>트레이너 수업 목록</span>
						<strong>Space GYM</strong>
					</div>
					</li>
				</ul>
			</div>
		</div>
		
		<h2 class="stit"> 시설 내 프로그램 목록 출력 </h2>
		<div class="prog_container02">
	    	<div class="prog_box01">
	    		<ul class="prog_request_tit">
	    			<li>번호</li>
	    			<li>수업명</li>
	    			<li>수업내용</li>
	    			<li>트레이너</li>
	    			<li>시작일</li>
	    			<li>종료일</li>
	    			<li>수정</li>
	    			<li>삭제</li>
	    		</ul>
	    		
	    		<c:forEach items="${attractionList}" var="attraction">
	    			<ul class="prog_request_cont">
	    				<li>${attraction.attr_idx }</li>
	    				<li>${attraction.title }</li>
	    				<li>${attraction.content }</li>
	    				<li>${attraction.name }</li>
	    				<li>${attraction.prog_time }</li>
	    				<li>${attraction.end_time }</li>
	    				<li>
	    					<button class = "btn_submit" onclick = "location.href='${conPath}/rule_register/attractionModify?attr_idx=${attraction.attr_idx }'">수정</button>
						</li>
	    				<li>
							<button class = "btn_submit" onclick = "location.href='${conPath}/rule_register/attractionDelete?attr_idx=${attraction.attr_idx }'">삭제</button>						
						</li>
	    			</ul>
	    		</c:forEach>	
	    	</div>	    
		</div>
	</div>				
<jsp:include page="../footer.jsp"/>
</body>
</html>