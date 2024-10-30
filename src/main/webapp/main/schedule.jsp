<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의 일정</title>
<script src='../resources/fullcalendar/dist/index.global.js'></script>
<style>	
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 10px auto;    
    padding: 5px;
    
  }
  
  h2.thisMonth{
  	text-align: center;
  }  

</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class = "sub_visual">
		<div class = "bg_vis">
			<ul class = "list_init">
				<li class = "vis01" style = "background: url(&quot;${conPath}/resources/img/sub_vis02.jpg&quot;) 50% 50% / auto 100% no-repeat; width: 1904px; display: list-item;">
				<div class = "txt_vis in_1200">
					<span>이달의 일정 확인하기</span>
					<strong>Space GYM</strong>
				</div>
				</li>
			</ul>
		</div>
</div>
<jsp:include page ="../board/board_header.jsp"/>
<script type = "text/javascript">
	var jsonList = '${scheduleList}'	
</script>
<script>
  
  document.addEventListener('DOMContentLoaded', function() {
	let jsonData = jsonList.replace(/&quot;/g,'"');	
	let jsonConvertList = JSON.parse(jsonData);	
    var calendarEl = document.getElementById('calendar');
    var currentDate = new Date().toISOString().split('T')[0];
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      initialDate: currentDate,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      locale: 'ko',
      hiddenDays: [ 0, 6 ],
      events: jsonConvertList.item,      
    });    
    calendar.render();
  });
</script>
  <div id='calendar'></div>

</body>
</html>