<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 수업 목록 출력 페이지</title>
<link rel="stylesheet" href="${conPath }/resources/css/style_prog.css">
</head>
<body>
	<c:if test = "${empty loginMember }">
		<script>
			alert('현재 로그인 상태가 아니므로 메인 화면으로 이동합니다.');
			location.href='${conPath}/main/home';
		</script>
	</c:if>
	<c:if test = "${not empty modifyResult}">
		<script>
			alert('${modifyResult} 건 수정이 완료되었습니다.');
		</script>
	</c:if>
	<c:if test = "${not empty deleteResult }">
		<script>
			alert('삭제가 ${deleteResult}건 완료되었습니다.');
		</script>
	</c:if>	
	<jsp:include page="../header.jsp"/>
	<div class = "page">
		<h2 class="stit"> 시설 내 프로그램 목록 출력 </h2>
		<div class="prog_container02">
	    	<div class="prog_box01">
	    		<ul class="prog_request_tit">
	    			<li>번호</li>
	    			<li>수업명</li>
	    			<li>내용</li>
	    			<li>담당</li>
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
	    				<li>${attraction.end_time eq null? '-': attraction.end_time}</li>
	    				<li>
	    					<button class = "btn_submit" onclick = "location.href='${conPath}/rule_register/attractionModify?attr_idx=${attraction.attr_idx }'">수정</button>
						</li>
	    				<li>
							<button class = "btn_submit" onclick = "confirmDelete(${attraction.attr_idx})">삭제</button>										
						</li>
	    			</ul>
	    		</c:forEach>	
	    		<script>
	    			function confirmDelete(attr_idx){
	    				let isDelete = confirm('정말 ' + attr_idx + '번 과목을 삭제하시겠습니까?');
	    				if (isDelete){
	    					location.href = '${conPath}/rule_register/attractionDelete?attr_idx='+attr_idx;
	    				}
	    			}
	    		</script>
	    		<nav class="pg_wrap">
    	<span class="pg">
    		<c:if test = "${pagination.startPage > pagination.blockSize }">    		
    			<a href = "${conPath }/rule_register/attractionList?pageNum=${pagination.startPage -1}">이전</a>
    		</c:if>
    		<c:forEach var = "i" begin="${pagination.startPage }" end ="${pagination.endPage }">
    			<c:if test = "${pagination.currentPage eq i }">
    				<b> [${i }]</b>
    			</c:if>
    			<c:if test = "${pagination.currentPage != i }">
    				<a href = "${conPath }/rule_register/attractionList?pageNum=${i}">[${i }]</a>
    			</c:if>
    		</c:forEach>
    		<c:if test = "${pagination.endPage < pagination.pageCnt }">
    			<a href = "${conPath }/rule_register/attractionList?pageNum=${pagination.endPage +1}">다음</a>
    		</c:if>	
		</span>
	</nav>    
	    	</div>	    
		</div>
	</div>				
<jsp:include page="../footer.jsp"/>
</body>
</html>