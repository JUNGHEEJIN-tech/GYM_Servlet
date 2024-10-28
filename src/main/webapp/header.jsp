<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="${conPath }/resources/css/default.css">
    <link rel="stylesheet" href="${conPath }/resources/css/global.css">
    <link rel="stylesheet" href="${conPath }/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${conPath }/resources/css/swiper.min.css">
        
       
    <script src="${conPath }/resources/js/jquery-1.12.4.min.js"></script>
    <script src="${conPath }/resources/js/jquery-migrate-1.4.1.min.js"></script>
    <script src="${conPath }/resources/js/jquery.menu.js"></script>
    <script src="${conPath }/resources/js/common.js"></script>
    <script src="${conPath }/resources/js/wrest.js"></script>
    <script src="${conPath }/resources/js/placeholders.min.js"></script>
    <script src="${conPath }/resources/js/global.js"></script>
    
    <script src="${conPath }/resources/js/swiper.min.js"></script>	 	
</head>
<body>
<script>
var snum = "menu_9999";
</script>
	<header id="header">
        <div class="header_top">
            <div class="in_1200">
                <ul class="list_init fl">
                    <li class="ht_home"><a href="${conPath }/main/home"><span>홈으로</span></a></li>
                </ul>
                <ul class="list_init fr">
                	<c:if test = "${empty loginMember }">
                    	<li class="ht_login">
                    		<a href="${conPath }/main/loginForm"><span>로그인</span></a>
                    	</li>
                    	<li class="ht_join">
                    		<a href="${conPath }/join/joinForm"><span>회원가입</span></a>
                    	</li>
                    </c:if>
                    <c:if test = "${not empty loginMember }">
                    	<li class="adm_normal">
                    		<a href="${conPath }/main/logout">로그아웃</a>
                    	</li>
                		<li class="adm_normal">
                			<a href="${conPath }/join/mypage">마이페이지</a>
                		</li>                    
                    </c:if>	
                </ul>
                <div class="logo"><a href="${conPath }/main/home"><img src="${conPath }/resources/img/logo.png" alt="Space Gym"
                            class="img_fix" title=""></a></div>
                <div class="toggle_menu"><span class="tg01"></span><span class="tg02"></span><span class="tg03"></span>
                </div>
            </div>
        </div>
        <div class="container_menu">
            <!-- 메뉴 시작 { -->
            <nav id="hd_menu" class="in_1200 mob_menu">
                <ul class="main_menu">
                    <li class="menu1"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=01_01"
                            target="_self"><span>센터소개</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0101"><a href="${conPath }/introduce/intro"
                                        target="_self">인사말</a></li>
                                <li class="menu_0103"><a href="${conPath }/introduce/attractionInfo"
                                        target="_self">시설현황</a></li>
                                <li class="menu_0106"><a href="${conPath }/introduce/locationInfo"
                                        target="_self">오시는 길</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu2"><a href="#"
                            target="_self"><span>프로그램안내 및 접수</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0201"><a href="#"
                                        target="_self">이용자 준수사항</a></li>
                                <li class="menu_0202"><a href="#"
                                        target="_self">수영</a></li>
                                <li class="menu_0203"><a href="#"
                                        target="_self">헬스</a></li>
                                <li class="menu_0204"><a href="#"
                                        target="_self">생활체육</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu3"><a href="#"
                            target="_self"><span>이용안내</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0301"><a href="#"
                                        target="_self">이용수칙</a></li>
                                <li class="menu_0302"><a href="#"
                                        target="_self">방문접수 안내</a></li>
                                <li class="menu_0303"><a href="#"
                                        target="_self">온라인접수 안내</a></li>
                                <li class="menu_0304"><a href="#"
                                        target="_self">일일입장 안내</a></li>
                                <li class="menu_0305"><a href="#"
                                        target="_self">셔틀버스노선 안내</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu4"><a href="#" target="_self"><span>알림마당</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0401"><a href="${conPath }/board/noticeBoardList" target="_self">공지사항</a></li>
                                <li class="menu_0402"><a href="${conPath }/board/freeBoardList" target="_self">자유게시판</a></li>
                                <li class="menu_0403"><a href="${conPath }/board/qna" target="_self">묻고답하기</a></li>
                                <li class="menu_0404"><a href="${conPath }/main/schedule" target="_self">이달의 일정</a></li>
                                <li class="menu_0407"><a href="${conPath }/board/recruitList" target="_self">채용공고</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu5"><a href="#"
                            target="_self"><span>마이페이지</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0501"><a href="#"
                                        target="_self">접수현황</a></li>
                                <li class="menu_0502"><a href="#"
                                        target="_self">장바구니</a></li>
                                <li class="menu_0503"><a href="#"
                                        target="_self">회원정보</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- } 메뉴 끝 -->
        </div>
        <div class="hd_menu_bg" style="display: none;">
            <div style=""></div>
        </div>
    </header>
    <!-- } 헤더 끝 -->
</body>
</html>