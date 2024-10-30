<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    margin: 0 auto;
  }
  
  h2.thisMonth{
  	text-align: center;
  }

</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
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
      events: jsonConvertList.item,      
    });    
    calendar.render();
  });
</script>
	<h2 class = "thisMonth">이달의 일정</h2>
  <div id='calendar'></div>

</body>
</html>