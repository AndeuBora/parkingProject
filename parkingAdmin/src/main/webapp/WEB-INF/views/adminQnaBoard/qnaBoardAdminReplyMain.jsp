<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/board_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>QnA 게시판</title>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 한 페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}' />");
		}

		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});

		/* 상세 페이지 이동 함수(location 객체로 이동 url은 한라인으로 작성한다.) */
		$(".goQnaBoardAdminDetail").click(function() {
			var qnaNum = $(this).parents("tr").attr("data-num");
			$("#qnaNum").val(qnaNum);
			$("#adminQnaBoardList").attr({
				"method" : "GET",
				"action" : "/admin/adminQnaBoard/adminQnaBoardDetail.do"
			});
			$("#adminQnaBoardList").submit();
		});
	});

	function goPage(page) {
		$("#page").val(page);
		$("#qnaNum").val(0);
		$("#adminQnaBoardList").attr("method", "POST");
		$("#adminQnaBoardList").attr("action",
				"/admin/adminQnaBoard/qnaBoardAdminReplyMain.do");
		$("#adminQnaBoardList").submit();
	}
</script>
<style type="text/css">
#qnaBoardMenuMain {
	background-color: #8FD3E8;
}
</style>
</head>
<body>
	<header><jsp:include page="../header.jsp" /></header>
	<div class="container-fluid" class="qnaBoardReplyMain">
		<section style="margin-left: 20%; margin-right: 20%;">
			<div id="qnaBoardMainTitle" class="page-header">
				<h1 style="font-weight: bold;">QnA</h1>
			</div>
			<!-- qna 게시판 글 리스트 출력 -->
			<div id="qnaBoardAdminReplyMainContainer">
				<div id="qnaBoardAdminReplyMainContent">
					<form id="adminQnaBoardList" name="adminQnaBoardList">
						<input type="hidden" id="qnaNum" name="qnaNum" /> <input
							type="hidden" id="page" name="page" value="${data.page}" /> <input
							type="hidden" id="pageSize" name="pageSize"
							value="${data.pageSize}" />
					</form>
					<table class="table table-bordered table-hover table-responsive">
						<thead>
							<tr>
								<th style="text-align: center; width: 8%;" id="qnaBoardMenuMain">번호</th>
								<th style="text-align: center; width: 62%;"
									id="qnaBoardMenuMain">제목</th>
								<th style="text-align: center; width: 15%;"
									id="qnaBoardMenuMain">등록일</th>
								<th style="text-align: center; width: 15%;"
									id="qnaBoardMenuMain">작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty adminQnaBoardList}">
									<c:forEach var="qnaBoardAdminReplyMain"
										items="${adminQnaBoardList}" varStatus="status">
										<tr data-num="${qnaBoardAdminReplyMain.qnaNum}">
											<td align="center">${count-(status.count-1)}</td>
											<td><span class="goQnaBoardAdminDetail">${qnaBoardAdminReplyMain.qnaTitle}</span>
											</td>
											<td align="center">${qnaBoardAdminReplyMain.qnaWriteDate}</td>
											<td align="center">${qnaBoardAdminReplyMain.memberId}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="5" align="center">등록된 게시물이 존재하지 않습니다.</td>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<!-- qna 게시판 글 리스트 출력 종료 -->

			<!-- 페이지 네비게이션 시작 -->
			<div id="qnaBoardPage" align="center">
				<tag:paging page="${param.page}" total="${total}"
					list_size="${data.pageSize}"></tag:paging>
			</div>
			<!-- 페이지 네비게이션 종료 -->
		</section>
	</div>
	<footer><jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>