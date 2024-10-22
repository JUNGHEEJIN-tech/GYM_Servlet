<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> RECRUIT_BOARD LIST </h3>
<form action="search" method="get" >
        <label for="filter">검색 분류:</label>
        <select name="f" id="filter">
            <option value="title">제목</option>
            <option value="writer">작성자</option>
        </select>
        <label for="query">검색어:</label>
        <input type="text" name="query" id="query" placeholder="검색어를 입력하세요" required>
        <input type="submit" id="submit" value="검색">
    </form>
<c:if test="${!empty boards}">

	<table>
		<tr>
			<th>아이디</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		
		<c:forEach var = "board" items="${boards}">
			<tr>
				<td>${board.id}</td>
				<td><a href = "Recruit_Board/detail?id=${board.id}">${board.title}</td>
				<td>${board.writer}</td>
				<td>${board.regist_Date}</td>
				<td>${board.views}</td>		
			</tr>
		</c:forEach>
	</table>
</c:if>
<c:if test="${empty boards}">작성 내용이 없습니다.</c:if>

<a href="input"> 글쓰기 </a>
</body>
</html>