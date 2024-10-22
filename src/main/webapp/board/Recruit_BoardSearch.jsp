<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>검색 결과</title>
</head>
<body>
    <form action="search" method="get">
        <label for="filter">검색 분류:</label>
        <select name="f" id="filter">
            <option value="title">제목</option>
            <option value="writer">작성자</option>
        </select>
        <label for="query">검색어:</label>
        <input type="text" name="query" id="query" placeholder="검색어를 입력하세요" required>
        <input type="submit" id="submit" value="검색">
    </form>
    
    <h3>검색 결과: "${param.query}"로 검색한 결과입니다.</h3>
    <ul>
        <c:forEach var="board" items="${boards}">
            <li>
                <strong>${board.id}</strong>: 
                <a href="Recruit_Board/detail?id=${board.id}">${board.title}</a> 
                - ${board.writer} - ${board.regist_Date}
            </li>
        </c:forEach>
    </ul>
<a href ="list">목록으로</a>
</body>
</html>
