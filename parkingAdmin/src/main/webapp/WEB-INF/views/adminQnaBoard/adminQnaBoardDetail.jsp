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
<title>qna 글 상세보기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css?var=2222" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/* 목록보기 버튼 클릭 시 처리 이벤트 */
						$("#goQnaBoardAdminReplyMain")
								.click(
										function() {
											location.href = "/admin/adminQnaBoard/qnaBoardAdminReplyMain.do?page=${param.page}&pageSize=${param.pageSize}";
										});
					});
</script>
<style type="text/css">
#qnaBoardDetailMenu {
	background-color: #8FD3E8;
}

#qnaBoardDetailMain {
	padding-top: 10%;
}
</style>
</head>
<body>
	<header><jsp:include page="../header.jsp" /></header>
	<div class="container-fluid" id="qnaBoardDetailMain">
		<section style="margin-left: 25%; margin-right: 25%;">
			<div id="qnaBoardDetailTitle" class="page-header">
				<h1 style="font-weight: bold;">공지사항</h1>
			</div>
			<div id="adminQnaBoardDetailContainer">
				<!-- qna 글 상세보기 페이지 출력 -->
				<div id="adminQnaBoardDetailContent">
					<form id="adminQnaBoardDetailForm" name="adminQnaBoardDetailForm"
						method="POST">
						<input type="hidden" name="qnaNum" id="qnaNum"
							value="${detail.qnaNum}" />
					</form>
					<table class="table table-bordered table-hover">
						<tr>
							<td id="qnaBoardDetailMenu"
								style="width: 10%; text-align: center"><b>제목</b></td>
							<td>${detail.qnaTitle}</td>
						</tr>
						<tr>
							<td id="qnaBoardDetailMenu"
								style="width: 10%; text-align: center"><b>작성자</b></td>
							<td>${detail.memberId}</td>
						</tr>
						<tr>
							<td id="qnaBoardDetailMenu"
								style="width: 10%; text-align: center"><b>등록일</b></td>
							<td>${detail.qnaWriteDate}</td>
						</tr>
						<tr>
							<td id="qnaBoardDetailMenu"
								style="width: 10%; text-align: center"><b>내용</b></td>
							<td>${detail.qnaContent}</td>
						</tr>
						<tr>
					</table>
					<!-- qna 글 상세보기 페이지 출력 종료 -->

					<!-- qna 답글 입력 폼 -->
					<jsp:include page="adminQnaReply.jsp"></jsp:include>
				</div>
			</div>
		</section>
	</div>
	<footer><jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>