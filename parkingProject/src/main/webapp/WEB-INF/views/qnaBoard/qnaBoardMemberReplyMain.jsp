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
<title>QnA 게시판</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 글 등록 버튼 클릭 시 처리 이벤트 */
		$("#qnaBoardMemberReplyMainInsertBtn").click(function() {
			location.href = "/qnaBoard/qnaBoardWrite.do";
		});
	});

	/* qna 글 상세보기 페이지 이동 함수 */
	function goQnaBoardDetail(qnaNum) {
		location.href = "/qnaBoard/qnaBoardDetail.do?qnaNum=" + qnaNum;
	}
</script>
</head>
<body>
	<section>
		<!-- qna 게시판 글 리스트 출력 -->
		<div id="qnaBoardMemberReplyMainContainer">
			<div id="qnaBoardMemberReplyMainTitle">
				<h2>
					<a href="qnaBoard/qnaBoardMemberReplyMain.do">QnA</a>
				</h2>
			</div>
			<div id="qnaBoardMemberReplyMainContent">
				<form id="qnaBoardList" name="qnaBoardList">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty qnaBoardList}">
									<c:forEach var="qnaBoardMemberReplyMain"
										items="${qnaBoardList}">
										<tr>
											<td>${qnaBoardMemberReplyMain.qnaNum}</td>
											<td><a
												href="javascript:goQnaBoardDetail(${qnaBoardMemberReplyMain.qnaNum})">${qnaBoardMemberReplyMain.qnaTitle}</a></td>
											<td>${qnaBoardMemberReplyMain.qnaWriteDate}</td>
											<td>${qnaBoardMemberReplyMain.qnaWriter}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="4">등록된 게시물이 존재하지 않습니다.</td>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<!-- qna 게시판 글 리스트 출력 종료 -->

		<!-- 글 등록 버튼 출력 -->
		<div id="qnaBoardMemberReplyMainWriteBtn">
			<input type="button" value="글 등록"
				id="qnaBoardMemberReplyMainInsertBtn" />
		</div>
		<!-- 글 등록 버튼 출력 종료 -->
	</section>
</body>
</html>