<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link rel="stylesheet" href="${conPath }/default.css">
<link rel="stylesheet" href="${conPath }/global.css">
<link rel="stylesheet" href="${conPath }/font-awesome.min.css">
<link rel="stylesheet" href="${conPath }/style_board.css">
<link rel="stylesheet" href="${conPath }/style.css">

<script src="${conPath }/jquery-1.12.4.min.js"></script>
<script src="${conPath }/jquery-migrate-1.4.1.min.js"></script>
<script src="${conPath }/jquery.menu.js"></script>
<script src="${conPath }/common.js"></script>
<script src="${conPath }/wrest.js"></script>
<script src="${conPath }/placeholders.min.js"></script>
<script src="${conPath }/global.js"></script>
<script src="${conPath }/viewimageresize.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<jsp:include page = "../board/board_header.jsp"/>
	<div class="sub_contents">
		<h1 class="page_title">자유게시판</h1>
			<div class="page"><!-- 게시물 읽기 시작 { -->
				<article id="bo_v" style="width:100%">
    			<header>
        			<h2 id="bo_v_title">
                        <span class="bo_v_tit">
            				손나나 강사님 수업 후기.
            			</span>
        			</h2>
    			</header>
    			<section id="bo_v_info">
        			<h2>페이지 정보</h2>
        				<div class="profile_info">            				
            				<div class="profile_info_ct">
                				<span class="sound_only">작성자</span> 
                				<strong><span class="sv_member">입수핑</span></strong><br>
                				<span class="sound_only">댓글</span>
                				<strong><a href="#bo_vc">
 		               				<i class="fa fa-commenting-o" aria-hidden="true"></i> 0건</a>
 		               			</strong>
                				<span class="sound_only">조회</span><strong>
                					<i class="fa fa-eye" aria-hidden="true"></i> 23회</strong>
                					<strong class="if_date"><i class="fa fa-clock-o" aria-hidden="true"></i> 24-10-18 10:30</strong>
            				</div>
        				</div>
        				
        				<!-- 게시물 상단 버튼 영역 -->
        				<div id="bo_v_top">
	                        <ul class="btn_bo_user bo_v_com">
    				            <li><a href="${conPath }/board/freeBoardList.jsp" class="btn_b01 btn">
    				            	<i class="fa fa-list" aria-hidden="true"></i> 목록</a>
    				            </li>
    				        </ul>
           
                    	</div>
        				
        				<!-- 게시물 상단 버튼 종료 -->
    					</section>

    					<section id="bo_v_atc">
        					<h2 id="bo_v_atc_title">본문</h2>
        						<div id="bo_v_share">
	                            </div>

    						    <div id="bo_v_img">
								</div>

        				<!-- 본문 내용 시작 { -->
        				<div id="bo_v_con">안녕하세요 아침 수영을 등록해서 손나나 강사님께 수영을 배우고 있는 수린이입니다.
<br>저는 수영장 물 맛있게 시식하는 수영 초보인데 강사님께서 동작 하나하나 열심히 가르쳐 주시고 잡아주셔서
<br>제 이상한 수영실력이 점점 나아지는 것 같아요 (제 생각~^.^)
<br>강사님이 수영도 잘하시고 수업시간마다 하나하나 열심히 잡아주시고 영법도 잘 가르쳐 주셔서 수영이 점점 재밌어지는 중입니다.
<br>하루하루 달라지는 나~ 아직 고칠 부분이 많은 나~ 
<br>수영장 물 먹고 배부르지 않는 그날이 올 때까지 강사님 밑에서 천천히 열심히 배워보겠습니다~
<br>강사님 짱! 다음달도 잘부탁드립니당! ^.^</div>
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
<script src="${conPath }/resources/js/md5.js"></script>
</article>
<!-- } 게시판 읽기 끝 -->

<script>

function board_move(href)
{
    window.open(href, "boardmove", "left=50, top=50, width=500, height=550, scrollbars=1");
}
</script>

<script>
$(function() {
    $("a.view_image").click(function() {
        window.open(this.href, "large_image", "location=yes,links=no,toolbar=no,top=10,left=10,width=10,height=10,resizable=yes,scrollbars=no,status=no");
        return false;
    });

      // 이미지 리사이즈
    $("#bo_v_atc").viewimageresize();
});

</script>
<!-- } 게시글 읽기 끝 -->
                        
        </div>
        <!-- } 내용 끝 -->
    </div>
    <!-- } 서브 콘텐츠 끝 -->
<jsp:include page = "../footer.jsp"/>
</body>
</html>