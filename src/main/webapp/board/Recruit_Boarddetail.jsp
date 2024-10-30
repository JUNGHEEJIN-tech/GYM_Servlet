<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>RECRUIT_BOARD LIST DETAIL</title>
</head>
<body>

<h3>채용공고 상세 보기</h3>

<form action="update" method="post">
    <input type="hidden" name="id" value="${board.id}">
    인덱스: <input type="text" value="${board.id}" disabled="disabled"/><br/>
    제목: <input type="text" name="title" value="${board.title}" /><br/>
    내용: <input type="text" name="content" value="${board.content}" /><br/>
    작성자: <input type="text" name="writer" value="${board.writer}" /><br/>
    채용날짜: <input type="text" name="regist_Date" value="${board.registDate}" disabled="disabled"/><br/>
    조회수: <input type="text" name="views" value="${board.views}" disabled="disabled"/><br/>

    <input type="submit" value="수정" onclick="return confirm('입력 내용으로 수정하시겠습니까?');">
</form>

<form action="delete" method="post" style="display:inline;">
    <input type="hidden" name="id" value="${board.id}">
    <input type="submit" value="삭제" onclick="return confirm('정말 삭제하시겠습니까?');">
</form>


<a href = "${conPath }/board/recruitList">목록으로</a>

</body>
</html>
