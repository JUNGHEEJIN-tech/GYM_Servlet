<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link rel="stylesheet" href="${conPath }/resources/css/style_board.css">
<link rel="stylesheet" href="${conPath }/resources/css/style.css">
</head>
<body>
<c:if test = "${not empty modifyResult }">
	<script>
		alert('${modifyResult eq 1? "게시글 수정이 완료되었습니다" : "게시글 수정 실패"}');
	</script>
</c:if>
<c:if test = "${not empty writeCommentResult}">
	<script>
		alert('댓글 등록이 완료되었습니다.');
	</script>
</c:if>
<c:if test = "${not empty commentDeleteResult }">
	<script>
		alert('댓글 등록 삭제가 완료되었습니다.'); 
	</script>
</c:if>
	<jsp:include page="../header.jsp"/>
	<jsp:include page = "../board/board_header.jsp"/>
	<div class="sub_contents">
		<h1 class="page_title">자유게시판 상세보기</h1>
			<div class="page"><!-- 게시물 읽기 시작 { -->
				<article id="bo_v" style="width:100%">
    			<header>
        			<h2 id="bo_v_title">
                        <span class="bo_v_tit">
            				${freeBoardDetail.title }
            			</span>
        			</h2>
    			</header>
    			<section id="bo_v_info">
        			<h2>페이지 정보</h2>
        				<div class="profile_info">            				
            				<div class="profile_info_ct">                				 
                				<strong><span class="sv_member">${freeBoardDetail.member.name }</span></strong><br>                				
                				<strong> 댓글 ${freeBoardDetail.commentCnt }건 </strong>                				
                					<strong>조회수 ${freeBoardDetail.views }회</strong>
                					<strong class="if_date">${freeBoardDetail.regist_date }</strong>
            				</div>
        				</div>
        				
        				<!-- 게시물 상단 버튼 영역 -->
        				<div id="bo_v_top">
	                        <ul class="btn_bo_user bo_v_com">
    				            <li><a href="${conPath }/board/freeBoardList" class="btn_b01 btn">
    				            	목록</a>
    				            </li>
    				            <c:if test="${not empty loginMember }">
    				            <li>
    				            	<a href="${conPath }/board/freeBoardWrite" class="btn_b02 btn">
    				            		글쓰기
    				            	</a>
    				            </li>
    				            <li>
    				            	<a href="${conPath }/board/freeBoardDelete?idx=${freeBoardDetail.idx}" class = "btn_b02 btn">
    				            		글삭제
    				            	</a>
    				            </li>
    				            </c:if>
    				            <c:if test = "${not empty loginMember and loginMember.idx eq freeBoardDetail.member.idx }">
    				            	<a href ="${conPath }/board/freeBoardModify?idx=${freeBoardDetail.idx}" class = "btn_b02 btn">
    				            		글수정
    				            	</a>
    				            </c:if>
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
        				<div id="bo_v_con">${freeBoardDetail.content }</div>
		                <!-- } 본문 내용 끝 -->
    					</section>
    					
    				<button type="button" class="cmt_btn"><span class="total"><b>댓글</b> ${freeBoardDetail.commentCnt }</span><span class="cmt_more"></span></button>
						<!-- 댓글 시작 { -->
						<section id="bo_vc">
    						<h2>댓글목록</h2>
    						<c:forEach items = "${comments }" var="comment">	    
							<article id="c_89">
        						<div class="cm_wrap">
            						<header style="z-index:${comment.commentIdx}">
	            							<span class="member">${comment.name }</span>            
	            							<span class="bo_vc_hdinfo">${comment.registDate}</span>
	            	        		</header>	
	        						<!-- 댓글 출력 -->
	        						<div class="cmt_contents">
	            						<p>${comment.content }</p>	                	                	            
	            	          		</div>
	        						<span id="edit_89" class="bo_vc_w"></span><!-- 수정 -->
	        						<input type="hidden" value="${comment.memberIdx }" id="secret_comment_89">
	        						<textarea id="save_comment_89" style="display:none">${comment.content }</textarea>
								</div>
        						<div class="bo_vl_opt">
            						<c:if test = "${loginMember.idx eq comment.memberIdx or trainer eq true}">
            							<button type="button" class="btn_cm_opt btn_b01 btn"><i class="fa fa-ellipsis-v" aria-hidden="true"></i><span class="sound_only">댓글 옵션</span></button>
            						</c:if>
        							<ul class="bo_vc_act" style="display: none;">
                						<li>
                						<c:if test = "${loginMember.idx eq comment.memberIdx or trainer eq true}">
                							<a href="#" onclick="verifyDelete(${comment.commentIdx});">삭제</a>                							
                						</c:if>	
                						</li>
                						                                            
                					</ul>
       			 				</div>
                				<script>
								$(function() {			    
		    					// 댓글 옵션창 열기
		    						$(".btn_cm_opt").on("click", function(){
		        					$(this).parent("div").children(".bo_vc_act").show();
		    						
		    						});
				
		    					// 댓글 옵션창 닫기
		    						$(document).mouseup(function (e){
		        						var container = $(".bo_vc_act");
		        						if( container.has(e.target).length === 0)
		        							container.hide();
		    						});
								});
								</script>
								<script>
									function verifyDelete(idx){
										let verify = confirm('정말 댓글을 삭제하시겠습니까?');
										if (verify){
											location.href='${conPath }/board/freeBoardCommentDelete?freeBoardIdx=${freeBoardDetail.idx}&commentIdx='+idx;
										}
									}
								</script>
    						</article>
    						</c:forEach>        
						</section>    		
						<!--  댓글작성 영역 -->
						
						<aside id="bo_vc_w" class="bo_vc_w">
       			 			<form name="fviewcomment" id="fviewcomment" action="${conPath }/board/freeBoardCommentWrite" method="post" autocomplete="off">
    							<input type="hidden" name="memberIdx" value="${loginMember.idx }">
    							<input type="hidden" name="freeBoardIdx" value = "${freeBoardDetail.idx }">
        						<textarea id="wr_content" name="content" maxlength="10000" required class="required" title="내용" placeholder="댓글내용을 입력해주세요"></textarea>
        						<div class="btn_confirm">
        							<c:if test = "${not empty loginMember }">
            							<button type="submit" id="btn_submit" class="btn_submit">댓글등록</button>
            						</c:if>
            						<c:if test = "${empty loginMember }">
            							<button type="button" class="btn_submit" onclick = "alert('로그인 후 댓글 등록이 가능합니다.')">댓글등록</button>
            						</c:if>            						
        						</div>    								
    						</form>			
    					</aside>	
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