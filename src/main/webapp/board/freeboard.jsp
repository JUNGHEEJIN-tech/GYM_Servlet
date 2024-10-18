<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space GYM | 자유게시판</title>
<link rel="stylesheet" href="../resources/css/default.css"/>
<link rel="stylesheet" href="../resources/css/global.css"/>
<link rel="stylesheet" href="../resources/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/style_board.css">
<link rel="stylesheet" href="../resources/css/style.css">

<script>
var g5_url       = "https://www.sdsports.or.kr";
var g5_bbs_url   = "https://www.sdsports.or.kr/bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "04_02";
var g5_sca       = "";
var g5_editor    = "smarteditor2";
var g5_cookie_domain = "";
</script>
<script src="../resources/js/jquery-1.12.4.min.js"></script>
<script src="../resources/js/jquery-migrate-1.4.1.min.js"></script>
<script src="../resources/js/jquery.menu.js"></script>
<script src="../resources/js/common.js"></script>
<script src="../resources/js/wrest.js"></script>
<script src="../resources/js/placeholders.min.js"></script>
<script src="../resources/js/global.js"></script>
</head>
<body>
	<script>
		var snum = "menu_0402";
	</script>
<jsp:include page="../header.jsp"/>
	
	<div class="hd_menu_bg" style="display: none; height: 2.22283px;"><div style="height: 241px;"></div></div>
<!-- } 헤더 끝 -->

<!-- 비주얼 시작 { -->
<div class="sub_visual">
	<div class="bg_vis">
		<ul class="list_init">
			<li class="vis01" style="background: url(&quot;https://www.sdsports.or.kr/theme/basic/images/sub/sub_vis01.jpg&quot;) 50% 50% / auto 100% no-repeat; width: 1904px; display: list-item;">
				<div class="txt_vis in_1200">
					<span>시민의 건강체육을 위한 도심속의</span>
					<strong>송도스포츠센터</strong>
				</div>
			</li>
		</ul>
	</div>
</div>
<!-- } 비주얼 끝 -->
<!-- 서브 콘텐츠 시작 { -->
<div id="wrap_content" class="wrap_sub">
    <div class="tab_menu">
<ul class="tabmenu04">
<li class="menu_0401"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_01" target="_self">공지사항</a></li>
<li class="menu_0402 selected"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02" target="_self">자유게시판</a></li>
<li class="menu_0403"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_03" target="_self">묻고답하기</a></li>
<li class="menu_0404"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_04" target="_self">이달의 일정</a></li>
<li class="menu_0407"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_07" target="_self">채용공고</a></li>
</ul>
</div>
	<div class="sub_contents">
		<h1 class="page_title">자유게시판</h1>
		<!-- 내용 시작 { -->
		<div class="page">

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">

    
    <!-- 게시판 검색 시작 { -->
    <div class="bo_sch_wrap">
        <fieldset class="bo_sch">
            <h3>검색</h3>
            <form name="fsearch" method="get">
            <input type="hidden" name="bo_table" value="04_02">
            <input type="hidden" name="sca" value="">
            <input type="hidden" name="sop" value="and">
            <label for="sfl" class="sound_only">검색대상</label>
            <select name="sfl" id="sfl">
                <option value="wr_subject">제목</option><option value="wr_content">내용</option><option value="wr_subject||wr_content">제목+내용</option><option value="wr_name,1">글쓴이</option><option value="wr_name,0">글쓴이(코)</option>            </select>
            <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
            <div class="sch_bar">
                <input type="text" name="stx" value="" required="" id="stx" class="sch_input" size="25" maxlength="20" placeholder="검색어를 입력해주세요">
                <button type="submit" value="검색" class="sch_btn">검색</button>
            </div>
            </form>
        </fieldset>
    </div>
    <!-- } 게시판 검색 끝 -->

    <form name="fboardlist" id="fboardlist" action="https://www.sdsports.or.kr/bbs/board_list_update.php" onsubmit="return fboardlist_submit(this);" method="post">
    <input type="hidden" name="bo_table" value="04_02">
    <input type="hidden" name="sfl" value="">
    <input type="hidden" name="stx" value="">
    <input type="hidden" name="spt" value="">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sst" value="wr_num, wr_reply">
    <input type="hidden" name="sod" value="">
    <input type="hidden" name="page" value="1">
    <input type="hidden" name="sw" value="">

    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
    <div id="bo_btn_top">
        <div id="bo_list_total">
            <span>Total 74건</span>
            1 페이지
        </div>

        <ul class="btn_bo_user">
                                                        </ul>
    </div>
    <!-- } 게시판 페이지 정보 및 버튼 끝 -->

    <div class="tbl_head01 tbl_wrap">
        <table>
        <caption>자유게시판 목록</caption>
        <thead>
        <tr>
                        <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;sop=and&amp;sst=wr_datetime&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">작성일</a></th>
            <th scope="col"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;sop=and&amp;sst=wr_hit&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">조회</a></th>
                                </tr>
        </thead>
        <tbody>
                <tr class="bo_notice even">
                        <td class="td_num2">
            <strong class="notice_icon"><img src="../resources/img/icon_notice.svg" class="title_icon" alt="공지"></strong>            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=58">
                                                                        건의사항이나 답변을 요하는 내용은 묻고 답하기 게시판을 이용해 주시기 바랍니다.                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">서구관리자</span></td>
            <td class="td_datetime">2024-01-10</td>
            <td class="td_num">234</td>
                                </tr>
                <tr class=" ">
                        <td class="td_num2">
            73            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=99">
                                                                        주종선 강사님 쵝오~                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">두둥둥</span></td>
            <td class="td_datetime">2024-10-08</td>
            <td class="td_num">47</td>
                                </tr>
                <tr class=" even">
                        <td class="td_num2">
            72            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=98">
                                                                        주종선  강사님  감사합니다.                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">맹구다</span></td>
            <td class="td_datetime">2024-10-02</td>
            <td class="td_num">73</td>
                                </tr>
                <tr class=" ">
                        <td class="td_num2">
            71            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=97">
                                                                        주종선 강사님   칭찬합니다.  2                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">맹구네</span></td>
            <td class="td_datetime">2024-10-02</td>
            <td class="td_num">70</td>
                                </tr>
                <tr class=" even">
                        <td class="td_num2">
            70            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=96">
                                                                        주종선선생님 친찬합니다                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">감천</span></td>
            <td class="td_datetime">2024-10-01</td>
            <td class="td_num">57</td>
                                </tr>
                <tr class=" ">
                        <td class="td_num2">
            69            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=94">
                                                                        주종선강사님 감사합니다                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">꼬리</span></td>
            <td class="td_datetime">2024-09-11</td>
            <td class="td_num">150</td>
                                </tr>
                <tr class=" even">
                        <td class="td_num2">
            68            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=93">
                                                                        수영장 이용시 안씻고 들어가는분 너무 많아요.                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">ariel</span></td>
            <td class="td_datetime">2024-08-20</td>
            <td class="td_num">257</td>
                                </tr>
                <tr class=" ">
                        <td class="td_num2">
            67            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=92">
                                                <i class="fa fa-lock" aria-hidden="true"></i>                        수영관련                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">아이스아메리카노</span></td>
            <td class="td_datetime">2024-08-09</td>
            <td class="td_num">7</td>
                                </tr>
                <tr class=" even">
                        <td class="td_num2">
            66            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=91">
                                                <i class="fa fa-lock" aria-hidden="true"></i>                        레인 반 배정건에 대하여                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">깔끔하게살자</span></td>
            <td class="td_datetime">2024-08-02</td>
            <td class="td_num">13</td>
                                </tr>
                <tr class=" ">
                        <td class="td_num2">
            65            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=90">
                                                                        코어요가 신설건                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">jkjk</span></td>
            <td class="td_datetime">2024-06-29</td>
            <td class="td_num">220</td>
                                </tr>
                <tr class=" even">
                        <td class="td_num2">
            64            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=88">
                                                                        저도 백지훈쌤을 칭찬합니다!♡                    </a>
                                        <span class="sound_only">댓글</span><span class="cnt_cmt">1</span><span class="sound_only">개</span>                </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">이콩님</span></td>
            <td class="td_datetime">2024-06-28</td>
            <td class="td_num">383</td>
                                </tr>
                <tr class=" ">
                        <td class="td_num2">
            63            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=85">
                                                                        백지훈 쌤 덕분에 즐거워요 ^^                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">양갱</span></td>
            <td class="td_datetime">2024-06-28</td>
            <td class="td_num">209</td>
                                </tr>
                <tr class=" even">
                        <td class="td_num2">
            62            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=84">
                                                                        백지훈 강사님 강습 후기                    </a>
                                        <span class="sound_only">댓글</span><span class="cnt_cmt">1</span><span class="sound_only">개</span>                </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">ariel</span></td>
            <td class="td_datetime">2024-06-27</td>
            <td class="td_num">341</td>
                                </tr>
                <tr class=" ">
                        <td class="td_num2">
            61            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=83">
                                                                        백선생님  감사합니다.                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">arabesque</span></td>
            <td class="td_datetime">2024-06-27</td>
            <td class="td_num">164</td>
                                </tr>
                <tr class=" even">
                        <td class="td_num2">
            60            </td>
            <td class="td_subject">
                                <div class="bo_tit">
                    <a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;wr_id=82">
                                                                        백지훈  강사님   감사합니다                    </a>
                                                        </div>
            </td>
            <td class="td_name sv_use"><span class="sv_member">물찬제비일까</span></td>
            <td class="td_datetime">2024-06-27</td>
            <td class="td_num">161</td>
                                </tr>
                        </tbody>
        </table>
    </div>

    
    <!-- 페이지 -->
    <nav class="pg_wrap"><span class="pg"><span class="sound_only">열린</span><strong class="pg_current">1</strong><span class="sound_only">페이지</span>
<a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;page=2" class="pg_page">2<span class="sound_only">페이지</span></a>
<a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;page=3" class="pg_page">3<span class="sound_only">페이지</span></a>
<a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;page=4" class="pg_page">4<span class="sound_only">페이지</span></a>
<a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;page=5" class="pg_page">5<span class="sound_only">페이지</span></a>
<a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_02&amp;page=5" class="pg_page pg_end">맨끝</a>
</span></nav>    <!-- 페이지 -->
    </form>
</div>


<!-- } 게시판 목록 끝 -->
                        
        </div>
        <!-- } 내용 끝 -->
    </div>
    <!-- } 서브 콘텐츠 끝 -->
</div>

<!-- 푸터 시작 { -->
<footer id="footer">
    <div class="in_1200">
        <div class="footer_top">
            <ul class="list_init">
                <li><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=01_01">센터소개</a></li>
                <li class="impor"><a href="https://www.sdsports.or.kr/sub/privacy.php">개인정보처리방침</a></li>
                <li><a href="https://www.sdsports.or.kr/sub/useterms.php">이용약관</a></li>			
            </ul>
        </div>
        <div class="footer_bot in_1200">
            <div class="copyright">
                <p>송도스포츠센터 &nbsp;/&nbsp; 대표 : 공한수 &nbsp;/&nbsp; 사업자등록번호 : 603-83-01058<br>주소 : 부산광역시 서구 송도해변로 121(암남동) &nbsp;/&nbsp; TEL. 051-250-7330 &nbsp;/&nbsp; FAX. 051-250-7329 &nbsp;/&nbsp; E-mail : ynh357@korea.kr</p>
                <p class="f_copy">COPYRIGHT © 2023 송도스포츠센터. &nbsp;ALL RIGHTS RESERVED.</p>
            </div>
        </div>
    </div>
</footer>

<div id="blackback"></div>


<!-- } 푸터 끝 -->

<script>
$(function() {
    // 폰트 리사이즈 쿠키있으면 실행
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
});
</script>
	
</body>
</html>