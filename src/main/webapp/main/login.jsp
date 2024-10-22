<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 페이지</title>

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
	<jsp:include page="../header.jsp"/>
	<div id="wrap_content" class="wrap_sub">
    	<div class="sub_contents">
		<h1 class="page_title">로그인</h1>
		<!-- 내용 시작 { -->
		<div class="page">	
			<div id="mb_login" class="mbskin">
    			<div class="mbskin_box">
        			<h1>로그인</h1>
        			<div class="mb_log_cate">            
            			<a href="${conPath }/main/join" class="join">회원가입</a>
        			</div>
        			<form name="flogin" action="${conPath }/main/loginCheck" method="post">
        				<input type="hidden" name="url" value="%2F">        
        				<fieldset id="login_fs">
            				<legend>회원로그인</legend>            
            				<input type="text" name="login_id" id="login_id" required="" class="frm_input required" size="20" maxlength="20" placeholder="아이디">            
            				<input type="password" name="login_pw" id="login_pw" required="" class="frm_input required" size="20" maxlength="20" placeholder="비밀번호">
            				<button type="submit" class="btn_submit">로그인</button>            
            				<div id="login_info">                
                				<div class="login_if_lpl">
                    				<a href="${conPath }/main/findAccount">ID/PW 찾기</a>  
                				</div>
            				</div>
        				</fieldset> 
        			</form>
    			</div>           
			</div>
		</div>
	</div>
</div>			
<!-- } 로그인 끝 -->
<jsp:include page="../footer.jsp"/>
</body>
</html>