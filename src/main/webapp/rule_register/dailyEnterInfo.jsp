<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일일입장 안내</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div class = "sub_visual">
		<div class = "bg_vis">
			<ul class = "list_init">
				<li class = "vis01" style = "background: url(&quot;${conPath}/resources/img/sub_vis02.jpg&quot;) 50% 50% / auto 100% no-repeat; width: 1904px; display: list-item;">
				<div class = "txt_vis in_1200">
					<span>일일입장 안내</span>
					<strong>Space GYM</strong>
				</div>
				</li>
			</ul>
		</div>
	</div>		
	<jsp:include page = "../rule_register/introduce_header.jsp"/>
		<div class="sub_contents">
			<h1 class="page_title">일일입장 안내</h1>		
			<div class="page">
				<article id="ctt" class="ctt_03_04">    				
    				<div id="ctt_con">
        				<h2 class="stit mgt0">일일입장</h2>
      				<div class="tbl_scroll">
        				<table class="tbl01">
          					<colgroup>
          						<col width="18%">
          						<col>
          						<col>
          						<col>
          						<col>
          						<col>
          					</colgroup>
          					<tbody>
            					<tr>
              						<th>시간</th>
              						<th colspan="2">프로그램</th>
              						<th>요일</th>
              						<th>참가비</th>
              						<th>준비물</th>
            					</tr>
            					<tr>
              						<td>08:00~09:50</td>
              						<td>수 영</td>
              						<td>1회</td>
              						<td>토요일</td>
              						<td>성인 : 5,000<br>
                						청소년 : 4,000<br>
				    	            	어린이 : 3,000</td>
              						<td>수영복, 수모, 수경<br>
                						샤워도구, 수건</td>
            					</tr>
            					<tr>
              						<td>06:00~21:30</td>
              						<td rowspan="2">헬 스</td>
              						<td rowspan="2">1회</td>
              						<td>월 ~ 금</td>
              						<td rowspan="2">성인 : 5,000<br>
                						청소년 : 4,000</td>
              						<td rowspan="2">운동복, 실내운동화<br>
                						샤워도구, 수건</td>
            					</tr>
            					<tr>
              						<td>08:00~12:50</td>
              						<td class="bor_r">토요일</td>
            					</tr>
          					</tbody>
        				</table>
      				</div>
      				<ul class="list_init ul01 mgt30">
        				<li>일일입장 인원이 많을 시 입장이 제한될 수 있습니다.</li>
        				<li>주말 수영일일입장은 10시~13시 까지는 정규수업 관계로 입장 불가합니다.</li>
      				</ul>
      			</div>
			</article>                        
        </div>
        <!-- } 내용 끝 -->
    </div>
    <!-- } 서브 콘텐츠 끝 -->
	<jsp:include page="../footer.jsp"/>	
</body>
</html>