<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 일정 등록 페이지</title>
<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
</head>
<body>
<c:if test = "${empty trainer }">
	<script>
		alert('현재 로그인 상태가 아닙니다. 메인 페이지로 이동합니다.');
		location.href='${conPath}/main/home';
	</script>
</c:if>
	<jsp:include page="../header.jsp"/>
	<div class = "sub_visual">
		<div class = "bg_vis">
			<ul class = "list_init">
				<li class = "vis01" style = "background: url(&quot;${conPath}/resources/img/sub_vis02.jpg&quot;) 50% 50% / auto 100% no-repeat; width: 1904px; display: list-item;">
				<div class = "txt_vis in_1200">
					<span>트레이너 일정 등록</span>
					<strong>Space GYM</strong>
				</div>
				</li>
			</ul>
		</div>
	</div>	
	<div id = "wrap_content" class = "wrap_sub">
		<div class = "sub_contents">
			<div class = "page">
				<div class = "register">
					<form id = "fregisterform" action = "${conPath }/rule_register/registerResult" method = "post" onsubmit = "return fregisterform_submit(this);">
						<div id = "register_form" class = "form_01">
							<ul>
								<li>
									<label for = "reg_at_title">
										수업명 입력
									</label>
									<input type = "text" name = "at_title" id = "reg_at_title" class = "frm_input full_input required" placeholder = "수업명을 입력해주세요.">
								</li>
								<li>
									<label for = "reg_at_content">
										수업에 대한 간단한 소개를 입력해주세요.
									</label>
									<textarea name = "at_content" id = "reg_at_content" class = "frm_input full_input required" placeholder = "수업 내용을 입력해주세요. (최대 255자)" maxlength = "255"></textarea>
								</li>
								<li>
									<label for = "reg_at_trainer">
										담당할 트레이너를 선택해주세요.
									</label>
									<select name="trainer_idx" id = "reg_at_trainer">
										<c:forEach items="${trainerList }" var="trainer">
											<option value="${trainer.trainer_idx }">${trainer.name }</option>											
										</c:forEach>
									</select>
								</li>
								<li>
									<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
									<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
									<script type="text/javascript">
										$(function() {
											$(".datetimepicker").datetimepicker({ 
												format: "Y-m-d H:i",
											});
										});
									</script>	
									시작일시 : <input type="text" class="datetimepicker" name="prog_time" style="width:140px;"> 
									종료일시 : <input type="text" class="datetimepicker" name="end_time" style="width:140px; padding-left:10px;">
								</li>
								<li>
									<label for = "reg_at_period">
										기간 (개월 수) 선택
									</label>
									<input type = "number" id= "reg_at_period" name = "period" class = "frm_input full_input required">							
								</li>
							</ul>
						</div>
						<div class="btn_confirm">
	        				<a href="${conPath }/main/home" class="btn_close" style = "line-height: 70px !important;">취소</a>
        					<button type="submit" id="btn_submit" class="btn_submit" accesskey="s">정보수정</button>
    					</div>			 
					</form>
				</div>
			</div>		
		</div>
	</div>		
</body>
</html>