<%@page import="space.jdbc.JdbcRecruit_BoardDao"%>
<%@page import="space.jdbc.Recruit_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" id="meta_viewport"
    content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Space GYM</title>
    <script>
	// 자바스크립트에서 사용하는 전역변수 선언
	var g5_url       = "${conPath}";
	var g5_bbs_url   = "${conPath}/board";
	var g5_is_member = "";
	var g5_is_admin  = "";
	var g5_is_mobile = "";
	var g5_bo_table  = "";
	var g5_sca       = "";
	var g5_editor    = "";
	var g5_cookie_domain = "";
	</script>	
	<script>
		var snum = "menu_9999";
	</script>
</head>
<body>
<c:if test = "${not empty loginSuccessMessage }">
	<script>
		alert('${loginSuccessMessage}');
	</script>
</c:if>
<c:if test = "${not empty logoutMessage }">
	<script>
		alert('${logoutMessage}');
	</script>
</c:if>
	<jsp:include page="./header.jsp"/>
    <div class="visual">
        <div class="bg_vis">
            <ul class="list_init">
                <li class="vis01"
                    style="background: url(&quot;${conPath}/resources/img/main_vis01.jpg&quot;) 50% 50% / cover no-repeat rgb(0, 0, 0); width: 1160px; display: list-item;">
                    <div class="txt_vis in_1200">
                        <span>스페이스씨엘 교육생 누구나 무료로 이용가능!</span>
                        <strong>Space GYM</strong>
                    </div>
                </li>
                <li class="vis01"
                    style="background: url(&quot;${conPath}/resources/img/main_vis02.jpg&quot;) 50% 50% / cover no-repeat rgb(0, 0, 0); width: 1160px; display: none;">
                    <div class="txt_vis in_1200">
                        <span>스페이스씨엘 교육생 누구나 무료로 이용가능!</span>
                       <strong>Space GYM</strong>
                    </div>
                </li>
            </ul>
        </div>
        <div class="dot_vis">
            <ul class="list_init">
                <li class="selected"></li>
                <li class=""></li>
            </ul>
        </div>
        <div class="mc_btn">
            <ul class="list_init">
                <li class="mcbtn01"><a href="#" onclick = "alert('준비중입니다.');"><span>온라인 접수</span></a>
                </li>                               
            </ul>
        </div>
    </div>
    <!-- } 비주얼 끝 -->

    <!-- 메인 콘텐츠 시작 { -->
    <div id="wrap_content" class="wrap_main">
        <div class="main_contents in_1200">
            <div class="mc_wrap01">
                <div class="mc_club">
                    <h3>센터소개</h3>
                    <p>스페이스씨엘 학생들의 건강을 증진하기 위해 신설된 Space GYM입니다.</p>
                    <ul class="list_init">                        
                        <li class="clubb02"><a href="${conPath }/introduce/attractionInfo"><span>시설현황
                                    바로가기</span></a></li>
                        <li class="clubb03"><a href="${conPath }/introduce/locationInfo"><span>오시는길
                                    바로가기</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="mc_wrap02">
                <div class="boarda">
                    <div class="boarda_btn">
                        <ul class="list_init">
                            <li class="selected"><a href="javascript:;">
                                    <h3>공지사항</h3>
                                </a></li>                         
                            <li><a href="javascript:;">
                                    <h3>채용공고</h3>
                                </a></li>
                        </ul>
                    </div>
                    <div class="n_con tc1 tabsel">
                        <a class="more_bt" href="${conPath }/board/noticeBoardList">더보기</a>

                        <ul>
                        	<c:forEach items="${noticeList }" var="notice" begin="0" end="4">
                            <li>
                                <span class="txt"><a
                                        href="${conPath }/board/noticeBoardDetail?idx=${notice.boardIdx}">${notice.title }</a></span>                                        
                                <span class="date"><fmt:formatDate value = "${notice.registDate }" pattern="yyyy-MM-dd" /></span>
                            </li>                            
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="n_con tc2">                    	
                        <a class="more_bt" href="${conPath }/board/recruitList">더보기</a>
                        <c:if test = "${empty recruitList }">
                        	<ul>
                            	<li class="empty_list">게시물이 없습니다.</li>
                        	</ul>
                        </c:if>
                        <c:if test = "${not empty recruitList }">
                        	<c:forEach items="${recruitList }" var="recruit" begin="0" end="4">
                        		<ul>
                        			<li>
                                		<span class="txt">
                                		<a href="${conPath }/board/recruitDetail?id=${recruit.id}"> ${recruit.title }
                                        </a> </span>
                                		<span class="date">${recruit.registDate }</span>                                
                            		</li>
                        		</ul>
                        	</c:forEach>
                        </c:if>
                    </div>                   
                </div>
                <div class="mc_box mcb_program mc_consult">
                    <h3>고객센터</h3>
                    <h4>051-250-7330</h4>
                    <ul class="list_init mcc_li">
                        <li>평&nbsp;&nbsp;&nbsp;&nbsp;일 : 09:00 ~ 18:00</li>
                        <li>토요일 : 08:00 ~ 13:00</li>
                        <li>점&nbsp;&nbsp;&nbsp;&nbsp;심 : 12:00 ~ 13:00</li>
                    </ul>
                    <ul class="list_init mcc_btn">
                        <li><a href="${conPath }/board/qnaBoardList">묻고답하기</a></li>
                        <li><a href="${conPath }/board/freeBoardList">자유게시판</a></li>
                    </ul>
                </div>                
            </div>
            <div class="mc_wrap03">
                <div class="mc_box mcb_daily">
                    <a href="${conPath }/introduce/dailyEnterInfo">
                        <h3><span>일일입장 안내</span></h3>
                    </a>
                </div>
                <div class="mc_box mcb_bus">
                    <a href="${conPath }/introduce/onlineRegister">
                        <h3>온라인접수 안내</h3>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- } 메인 콘텐츠 끝 -->



    <!-- 푸터 시작 { -->
    <jsp:include page="./footer.jsp"/>
    <div id="blackback"></div>
</body>
</html>