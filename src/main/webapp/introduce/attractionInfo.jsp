<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Gym 시설현황</title>
</head>
<body>
<script>
var snum = "menu_0103";
</script>
	<jsp:include page="../header.jsp"/>
	<div id="wrap_content" class="wrap_sub">
    	<jsp:include page="introduceHeader.jsp"/>
		<div class="sub_contents">
		<h1 class="page_title">시설현황</h1>
		<!-- 내용 시작 { -->
		<div class="page">
		<article id="ctt" class="ctt_01_03">
    		<div id="ctt_con">
        <div class="gall_wrap">
    <div class="gallery swiper-container swiper-container-initialized swiper-container-horizontal">
        <ul class="swiper-wrapper" style="transform: translate3d(-10800px, 0px, 0px); transition-duration: 0ms;">
            <li class="swiper-slide" data-swiper-slide-index="0"><img src="${conPath }/resources/img/gall03.jpg" alt=""></li>
            <li class="swiper-slide" data-swiper-slide-index="1"><img src="${conPath }/resources/img/gall04.jpg" alt=""></li>
            <li class="swiper-slide" data-swiper-slide-index="2"><img src="${conPath }/resources/img/gall05.jpg" alt=""></li>
            <li class="swiper-slide" data-swiper-slide-index="3"><img src="${conPath }/resources/img/gall06.jpg" alt=""></li>
            <li class="swiper-slide" data-swiper-slide-index="4"><img src="${conPath }/resources/img/gall07.jpg" alt=""></li>
            <li class="swiper-slide" data-swiper-slide-index="5"><img src="${conPath }/resources/img/gall08.jpg" alt=""></li>
                        
        	<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="0">
        		<img src="${conPath }/resources/img/gall03.jpg" alt="">
        	</li>
        	<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="1">
        		<img src="${conPath }/resources/img/gall04.jpg" alt="">
        	</li>
        	<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="2">
        		<img src="${conPath }/resources/img/gall05.jpg" alt="">
        	</li>
        	<li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3">
        		<img src="${conPath }/resources/img/gall06.jpg" alt="">
        	</li>
        	<li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4">
        		<img src="${conPath }/resources/img/gall07.jpg" alt="">
        	</li>
        	<li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5">
        		<img src="${conPath }/resources/img/gall08.jpg" alt="">
        	</li>        	
        </ul>
    	<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
    	<div class="gall_dot swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 1"></span><span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 2"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 3"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 4"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 5"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 6"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 7"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 8"></span></div>
    		<div class="gall_btn">
        		<button class="btn_prev" tabindex="0" role="button" aria-label="Previous slide"><i class="fa fa-angle-left"></i><span class="sound_only">이전 사진</span></button>
        		<button class="btn_next" tabindex="0" role="button" aria-label="Next slide"><i class="fa fa-angle-right"></i><span class="sound_only">다음 사진</span></button>
    		</div>
		</div>    
	</div>
</article>
       		<script>
            $(document).ready(function() {
                var swiper = new Swiper(".gall_wrap .gallery", {
                    speed: 1100,
                    loop: true,
                    slidesPerView: 'auto',
                    centeredSlides: true,
                    effect: "slide",
                    pagination: {
                        el: ".gall_wrap .gall_dot",
                        clickable: true,
                    },
                    navigation: {
                        nextEl: ".btn_next",
                        prevEl: ".btn_prev",
                    },
                    autoplay: {
                        delay: 4000,
                        disableOnInteraction: false
                    },                    
                });
            });
            </script>
			            
        </div>
        <!-- } 내용 끝 -->
    </div>
    <!-- } 서브 콘텐츠 끝 -->
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>