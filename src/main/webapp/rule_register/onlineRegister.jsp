<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인접수 안내</title>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<div class = "sub_visual">
		<div class = "bg_vis">
			<ul class = "list_init">
				<li class = "vis01" style = "background: url(&quot;${conPath}/resources/img/sub_vis02.jpg&quot;) 50% 50% / auto 100% no-repeat; width: 1904px; display: list-item;">
				<div class = "txt_vis in_1200">
					<span>온라인접수 안내</span>
					<strong>Space GYM</strong>
				</div>
				</li>
			</ul>
		</div>
	</div>		
	<jsp:include page = "../rule_register/introduce_header.jsp"/>	
	<div class="sub_contents">
		<h1 class="page_title">온라인접수 안내</h1>		
		<div class="page">
			<article id="ctt" class="ctt_03_03">
    			<header>
        			<h1>온라인접수 안내</h1>
    			</header>

    		<div id="ctt_con">
        		<div class="box_txt">
        			<p>프로그램 접수시 프로그램 참가자의 명의로 등록하셔야 타명의로 인한 불이익을 받지 않습니다.<br>
					수강기간 1개월 수강기간은 매월 1일부터 말일까지입니다.</p>
      			</div>
      			<h2 class="stit"> 접수기간</h2>
      			<ul class="list_init ul01">
        			<li>기존회원 : 매월 18일 오전 05시30분~마감시까지 선착순 마감(18일이 토,일요일/공휴일인 경우 돌아오는 평일 접수)</li>
      			</ul>
      			<p class="txt_c col_b"> ※ 접수기간중 휴일이 포함된 경우 하루씩 연기하며, 별도 안내문을 참고바랍니다.</p>
      
      			<h2 class="stit">신규접수 안내</h2>
      			<ul class="list_init ul01">
        				<li>프로그램 참가신청서에 참가프로그램명, 성명, 주소, 전화번호를 정확하게 기입하여 주십시오.</li>
        				<li>온라인접수는 신규등록일 오전 05시30분 이후부터 마감되지 않은 프로그램에 대해 수강이 가능합니다.<span style="color:rgb(255,0,0);">(잠정 중단)</span></li>
        				<li>신규회원 온라인 접수시 임시회원번호 또는 영수증 출력물 등으로 본인 확인 후 회원카드를 발급합니다.</li>
        				<li>회원카드는 최초 발급시에는 무료이나 이후 <span class="col_r">분실로 인한 재발급의 경우에는 제작비 2,000원이 부과</span>되오니 보관에 유의하여 주시기 바랍니다.</li>
      				</ul>
      			<p class="txt_c col_b"> ※ 회원카드는 입장시 반드시 제시하여 주시기 바랍니다.</p>
      			<h2 class="stit">환불, 연기, 반변경 제도 안내</h2>
		        <ul class="list_init ul01">
        			<li>연기 : 연기신청서를 작성 연기사유(질병, 출장, 사고 등)에 해당되는 증명서를 개강 5일이내에 제출하시면 1개월 범위내 1회에 한하여 연기(연기하신 달은 반변경 및 환불 불가)</li>
        			<li>환불 : 환불신청서를 작성
          			<ul class="list_init">
            			<li>개강 이전 신청 : 환불 수수료 회비의 10%공제 및 카드수수료</li>
            			<li>개강 이후 신청 : 환불 수수료 회비의 10%공제, 취소일까지의 일수(결석일 포함)공제 후 환불</li>
          			</ul>
          			<p class="col_b">※ 현금 환불의 경우 회계의 투명성을 위해 환불금은 신청인의 통장으로 입금</p>
        			</li>
        			<li>반변경 : 기존반 이외 다른 반으로 변경하실 경우 등록일(18일)부터 등록을 하셔야 합니다.<br>
          				※ 환불/연기/반변경 신청 환불, 연기, 프로그램변경 <span class="col_r">신청은 온라인으로 불가능합니다.</span></li>
        		</ul>
        		<p class="txt_c">온라인 신청 후 환불, 연기, 반변경시에는 <span class="col_r">방문신청</span>하여 주시기 바랍니다.<br>
          		※프로그램 연기/변경 신청후에는 프로그램 <span class="col_r">재연기 또는 재변경, 환불이 불가능</span>하므로 신중히 선택하셔야 합니다.</p>
      
		        <h2 class="stit">할인대상</h2>
      			<ul class="list_init ul01">
        			<li>할인대상자로서 사용료 할인을 받고자 하는 경우에는 <span class="col_r">방문접수</span>만 가능합니다.<span class="col_b">(신분증 및 증빙서류 지참)</span><br>
          				단, 기존회원이 기존에 할인받았던 프로그램으로 접수할 경우에는 온라인 접수로 사용료 할인이 가능합니다.</li>
      			</ul>
      			<p class="txt_c">※ 감면 증빙서류 인정기간 경과시 방문하셔서 다시 증빙서류를 제출하셔야 합니다.<br>
        		※ 자세한 할인 내용은 공지사항 내 '송도스포츠센터 할인 대상 안내' 게시물을 참고하시기 바랍니다.</p>
      			<h2 class="stit">프로그램별 준비물</h2>
      			<ul class="list_init ul01">
        			<li>수영 : 수영복, 수모, 수경, 샤워도구, 수건</li>
        			<li>헬스 : 운동복, 실내운동화(외부운동화 입장불가), 샤워도구, 수건</li>
        			<li>생활체육 : 운동복, 실내운동화(댄스), 샤워도구, 수건</li>
      			</ul>
      		</div>
		</article>
    </div>
</div>
</body>
</html>