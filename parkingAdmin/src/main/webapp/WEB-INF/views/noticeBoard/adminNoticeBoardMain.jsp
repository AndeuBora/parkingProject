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
<title>관리자 공지사항 게시판</title>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});

		/* 글 등록 버튼 클릭 시 처리 이벤트 */
		$("#adminNoticeBoardMainInsertBtn").click(function() {
			location.href = "/admin/noticeBoard/adminNoticeBoardInsertForm.do";
		});
	});

	function goPage(page) {
		$("#page").val(page);
		$("#adminNoticeBoardList").attr("method", "POST");
		$("#adminNoticeBoardList").attr("action",
				"/admin/noticeBoard/adminNoticeBoardMain.do");
		$("#adminNoticeBoardList").submit();
	}

	/* 상세 페이지 이동 함수(location 객체로 이동 url은 한라인으로 작성한다.) */
	function goAdminNoticeBoardDetail(noticeNum, page, pageSize) {
		location.href = "/admin/noticeBoard/adminNoticeBoardDetail.do?noticeNum="
				+ noticeNum + "&page=" + page + "&pageSize=" + pageSize;
	}
</script>
<style type="text/css">
#noticeBoardMenuMain {
	background-color: #8FD3E8;
}

#noticeBoardDetailTitle {
	text-decoration: none;
}
</style>
</head>
<body>
<header><jsp:include page="../header.jsp" /></header>
	<div class="container-fluid" id="noticeBoardReplyMain">
		<section style="margin-left: 20%; margin-right: 20%;">
			<div id="noticeBoardMainTitle" class="page-header">
				<h1 style="font-weight: bold;">공지사항</h1>
			</div>
			<!-- 공지사항 게시판 글 리스트 출력 -->
			<div id="adminNoticeBoardMainContainer">
				<div id="adminNoticeBoardMainContent">
					<form id="adminNoticeBoardList" name="adminNoticeBoardList">
						<input type="hidden" id="page" name="page" value="${data.page}" />
						<input type="hidden" id="pageSize" name="pageSize"
							value="${data.pageSize}" />
						<table class="table table-bordered table-hover table-responsive">
							<thead>
								<tr>
									<th style="text-align: center; width: 8%;"
										id="noticeBoardMenuMain">번호</th>
									<th style="text-align: center; width: 62%;"
										id="noticeBoardMenuMain">제목</th>
									<th style="text-align: center; width: 15%;"
										id="noticeBoardMenuMain">등록일</th>
									<th style="text-align: center; width: 15%;"
										id="noticeBoardMenuMain">작성자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty adminNoticeBoardList}">
										<c:forEach var="adminNoticeBoardMain"
											items="${adminNoticeBoardList}" varStatus="status">
											<tr>
												<td align="center">${count-(status.count-1)}</td>
												<td><a
													href="javascript:goAdminNoticeBoardDetail(${adminNoticeBoardMain.noticeNum},${data.page},${data.pageSize})"
													id="noticeBoardDetailTitle">${adminNoticeBoardMain.noticeTitle}</a></td>
												<td align="center">${adminNoticeBoardMain.noticeWriteDate}</td>
												<td align="center">${adminNoticeBoardMain.adminId}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="4" align="center">등록된 게시물이 존재하지 않습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<!-- 공지사항 게시판 글 리스트 출력 종료 -->

			<!-- 공지사항 게시판 글 등록 버튼 출력 -->
			<div id="adminNoticeBoardMainInsertDiv" align="right">
				<input type="button" value="글 등록" id="adminNoticeBoardMainInsertBtn"
					class="btn btn-default"
					style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" />
			</div>
			<!-- 공지사항 게시판 글 등록 버튼 출력 종료 -->

			<!-- 페이지 네비게이션 시작 -->
			<div id="adminNoticeBoardPage" align="center">
				<tag:paging page="${param.page}" total="${total}"
					list_size="${data.pageSize}" />
			</div>
			<!-- 페이지 네비게이션 종료 -->
		</section>
	</div>
	<footer><jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>