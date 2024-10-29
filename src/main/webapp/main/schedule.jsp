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
<script>
  document.addEventListener('DOMContentLoaded', function() {
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
      events: [    	  
        {
          title: '무슨무슨프로그램',
          start: '2024-10-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: '무슨무슨회의',
          start: '2024-10-29T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: '무슨무슨전시',
          start: '2024-10-30',
          end: '2024-10-31'
        },
        {
          title: '뭔가파티',
          start: '2024-10-1T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2023-01-11T10:00:00',
          end: '2023-01-11T16:00:00',
          display: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2023-01-13T10:00:00',
          end: '2023-01-13T16:00:00',
          display: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2023-01-24',
          end: '2023-01-28',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        },
        {
          start: '2023-01-06',
          end: '2023-01-08',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        }
      ]
    });

    calendar.render();
  });
</script>
	<h2 class = "thisMonth">이달의 일정</h2>
  <div id='calendar'></div>

</body>
</html>