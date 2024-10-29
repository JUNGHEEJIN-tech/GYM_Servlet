<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link rel="stylesheet" href="${conPath}/resources/css/default.css">
<link rel="stylesheet" href="${conPath}/resources/css/global.css">
<link rel="stylesheet" href="${conPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${conPath}/resources/css/style_board.css">
<link rel="stylesheet" href="${conPath}/resources/css/style.css">

<script src="${conPath}/resources/js/jquery-1.12.4.min.js"></script>
<script src="${conPath}/resources/js/jquery-migrate-1.4.1.min.js"></script>
<script src="${conPath}/resources/js/jquery.menu.js"></script>
<script src="${conPath}/resources/js/common.js"></script>
<script src="${conPath}/resources/js/wrest.js"></script>
<script src="${conPath}/resources/js/placeholders.min.js"></script>
<script src="${conPath}/resources/js/global.js"></script>
<script src="${conPath}/resources/js/viewimageresize.js"></script>
</head>
<body>
    <jsp:include page="../header.jsp"/>
    <jsp:include page="../board/board_header.jsp"/>
    <div class="sub_contents">
        <h1 class="page_title">공지사항 상세보기</h1>
        <div class="page"><!-- 게시물 읽기 시작 { -->
            <article id="bo_v" style="width:100%">
                <header>
                    <h2 id="bo_v_title">
                        <span class="bo_v_tit">
                            ${noticeBoardDetail.title }
                        </span>
                    </h2>
                </header>
                <section id="bo_v_info">
                    <h2>페이지 정보</h2>
                    <div class="profile_info">            				
                        <div class="profile_info_ct">                				 
                            <strong><span class="sv_member">${noticeBoardDetail.writer }</span></strong><br>                				
                            <strong> 댓글 0건 </strong>   
                            <script>
                            alert('${noticeBoardDetail.views}');
                            </script>             				
                            <strong>조회수 ${noticeBoardDetail.views }회</strong>
                            <strong class="if_date">${noticeBoardDetail.registDate }</strong>
                        </div>
                    </div>
                    
                    <!-- 게시물 상단 버튼 영역 -->
                    <div id="bo_v_top">
                        <ul class="btn_bo_user bo_v_com">
                            <li><a href="${conPath}/board/noticeBoardList" class="btn_b01 btn">목록</a></li>
                            <li><a href="${conPath}/board/noticeBoardWrite" class="btn_b02 btn">글쓰기</a></li>
                        </ul>
                    </div>
                    
                    <!-- 게시물 상단 버튼 종료 -->
                </section>

                <section id="bo_v_atc">
                    <h2 id="bo_v_atc_title">본문</h2>
                    <div id="bo_v_share"></div>
                    <div id="bo_v_img"></div>

                    <!-- 본문 내용 시작 { -->
                    <div id="bo_v_con">${noticeBoardDetail.content }</div>
                    <!-- } 본문 내용 끝 -->
                </section>
                <script>
                jQuery(function($) {            
                    //댓글열기
                    $(".cmt_btn").click(function(e){
                        e.preventDefault();
                        $(this).toggleClass("cmt_btn_op");
                        $("#bo_vc").toggle();
                    });
                });
                </script>
                <script src="${conPath}/resources/js/md5.js"></script>
            </article>
            <!-- } 게시판 읽기 끝 -->

            <script>
            function board_move(href) {
                window.open(href, "boardmove", "left=50, top=50, width=500, height=550, scrollbars=1");
            }
            </script>

            <script>
            $(function() {
                $("a.view_image").click(function() {
                    window.open(this.href, "large_image", "location=yes,links=no,toolbar=no,top=10,left=10,width=10,height=10,resizable=yes,scrollbars=no,status=no");
                    return false;
                });
            });
            </script>
            <!-- } 게시글 읽기 끝 -->
        </div>
        <!-- } 내용 끝 -->
    </div>
    <!-- } 서브 콘텐츠 끝 -->
    <jsp:include page="../footer.jsp"/>
</body>
</html>
