<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항 게시판</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<section>
		<div id="noticeBoardMainContainer">
			<div id="noticeBoardMainTitle">
				<h2>공지사항</h2>
			</div>
			<div id="noticeBoardMainContent">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty noticeBoardList}">
								<c:forEach var="noticeBoardList" items="${noticeBoardList}"
									varStatus="status">
									<tr>
										<td>${noticeBoardList.noticenum}</td>
										<td><span class="noticeBoardDetail">${noticeBoardList.noticetitle}</span></td>
										<td>${noticeBoardList.noticewritedate}</td>
										<td>${noticeBoardList.noticecount}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>