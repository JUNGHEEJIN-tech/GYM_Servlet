<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
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
<c:if test = "${not empty loginSuccessMessage }">
	<script>
		alert('${loginSuccessMessage}');
	</script>
</c:if>
<jsp:include page="../header.jsp"/>
	
<div class="hd_menu_bg" style="display: none; height: 2.22283px;">
	<div style="height: 241px;"></div>
</div>
<jsp:include page ="../board/board_header.jsp"/>
	<div class="sub_contents">
		<h1 class="page_title">자유게시판 글쓰기</h1>		
		<div class="page">
			<section id="bo_w">    			
    			<!-- 게시물 작성/수정 시작 { -->
    			<form name="freeBoardWriteResult" id="fwrite" action="${conPath }/board/freeBoardWriteResult" onsubmit="return fwrite_submit(this);" method="post" autocomplete="off" style="width:100%">
    				<input type="hidden" name="member_idx" value="${loginMember.idx }">
    				<input type="hidden" name="pageNum" value="${param.pageNum == null? '1' : param.pageNum}">
    		<div class="bo_w_info write_div">
        	</div>    
        	<div class="write_div">
    		</div>
    
    <div class="bo_w_tit write_div">        
        <div id="autosave_wrapper" class="write_div">
            <input type="text" name="title" value="" id="wr_subject" required class="frm_input full_input required" size="50" maxlength="255" placeholder="제목을 입력하세요.">                                                
        </div>
    </div>

    <div class="write_div">        
        <div class="wr_content ">            
			<textarea id="wr_content" name="content" class="" maxlength="65536" style="width:100%;height:300px"></textarea>
		</div>
    </div>   
    <div class="bo_w_flie write_div">
    	<div class="file_wr write_div">
            <label for="bf_file_1" class="lb_icon"></label>
            <input type="file" name="bf_file" id="bf_file_1" title="파일첨부 : 용량 10,485,760 바이트 이하만 업로드 가능" class="frm_file ">
        </div>
    </div>
    <div class="btn_confirm write_div">
        <a href="${conPath }/board/freeBoardList" class="btn_cancel btn">취소</a>
        <button type="submit" id="btn_submit" accesskey="s" class="btn_submit btn">작성완료</button>
    </div>
    </form>

    <script>        
    	function fwrite_submit(f) {
        	var wr_content_editor = document.getElementById('wr_content');        	
        	
			if (!wr_content_editor.value) { 
				alert("내용을 입력해 주십시오."); 
				wr_content_editor.focus(); 
				return false;
			}        	
        
	        document.getElementById("btn_submit").disabled = true;
        	return true;
    	}
    </script>
</section>
</div>
</div>
</body>
</html>