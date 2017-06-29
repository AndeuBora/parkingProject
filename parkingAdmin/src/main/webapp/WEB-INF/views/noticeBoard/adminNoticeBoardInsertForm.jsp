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
<title>관리자 공지사항 글 등록</title>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 글 등록 완료 버튼 클릭 시 처리 이벤트 */
		$("#adminNoticeInsertComplete").click(function() {
			if (!chkSubmit($('#adminId'), "작성자를")) {
				return;
			} else if (!chkSubmit($('#noticeTitle'), "제목을")) {
				return;
			} else if (!chkSubmit($('#noticeContent'), "내용을")) {
				return;
			} else {
				$("#adminNoticeBoardInsertForm").attr({
					"method" : "POST",
					"action" : "/admin/noticeBoard/adminNoticeBoardInsert.do"
				});
				$("#adminNoticeBoardInsertForm").submit();
			}
		});

		/* 목록보기 버튼 클릭 시 처리 이벤트 */
		$("#goAdminNoticeBoardMain").click(function() {
			location.href = "/admin/noticeBoard/adminNoticeBoardMain.do";
		});

		/* 취소 버튼 클릭 시 처리 이벤트 */
		$("#adminNoticeInsertCancel").click(function() {
			location.href = "/admin/noticeBoard/adminNoticeBoardMain.do";
		});
	});
</script>
<style type="text/css">
#noticeBoardInsertMenu {
	background-color: #8FD3E8;
}

#noticeBoardInsertMain {
	padding-top: 10%;
}
</style>
</head>
<body>
	<header><jsp:include page="../header.jsp" /></header>
	<div class="container-fluid" id="noticeBoardInsertMain">
		<section style="margin-left: 20%; margin-right: 20%;">
			<div id="noticeBoardInsertTitle" class="page-header">
				<h1 style="font-weight: bold;">공지사항</h1>
			</div>
			<!-- 공지사항 글 등록 페이지 구현 -->
			<div id="adminNoticeBoardInsertContainer">
				<div id="adminNoticeInsertContent">
					<form id="adminNoticeBoardInsertForm"
						name="adminNoticeBoardInsertForm">
						<input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
						<table class="table table-bordered table-hover table-responsive">
							<tr>
								<td id="noticeBoardInsertMenu"
									style="width: 20%; text-align: center; vertical-align: middle;"><b>작성자</b></td>
								<td><input type="text" id="adminId" name="adminId"
									value="admin" readonly="readonly" /></td>
							</tr>
							<tr>
								<td id="noticeBoardInsertMenu"
									style="width: 20%; text-align: center; vertical-align: middle;"><b>제목</b></td>
								<td><input type="text" id="noticeTitle" name="noticeTitle"
									placeholder="제목 입력 (40글자까지만 입력 가능)" style="width: 100%;"
									maxlength="40" /></td>
							</tr>
							<tr>
								<td id="noticeBoardInsertMenu"
									style="width: 20%; text-align: center; vertical-align: middle;"><b>내용</b></td>
								<td><textarea id="noticeContent" name="noticeContent"
										placeholder="내용 입력" style="resize: none; width: 100%;"
										rows="9"></textarea></td>
							</tr>
						</table>
					</form>
				</div>
				<div id="adminNoticeInsertFooterDiv">
					<input type="button" value="목록보기" id="goAdminNoticeBoardMain"
						name="goAdminNoticeBoardMain" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" />
					<input type="button" value="등록 완료" id="adminNoticeInsertComplete"
						name="adminNoticeInsertComplete" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt; margin-left: 2pt;" />
					<input type="button" value="취소" id="adminNoticeInsertCancel"
						name="adminNoticeInsertCancel" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt; margin-left: 2pt;" />
				</div>
			</div>
		</section>
	</div>
	<footer><jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>