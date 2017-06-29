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
<title>관리자 게시판 글 수정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 글 수정 완료 버튼 클릭 시 처리 이벤트 */
		$("#adminNoticeUpdateComplete").click(function() {
			if (!chkSubmit($('#noticeTitle'), "수정할 제목을")) {
				return;
			} else if (!chkSubmit($('#noticeContent'), '수정할 내용을')) {
				return;
			} else {
				$("#adminNoticeBoardUpdateForm").attr({
					"method" : "POST",
					"action" : "/admin/noticeBoard/adminNoticeBoardUpdate.do"
				});
				$("#adminNoticeBoardUpdateForm").submit();
			}
		});

		/* 목록보기 버튼 클릭 시 처리 이벤트 */
		$("#goAdminNoticeBoardMain").click(function() {
			location.href = "/admin/noticeBoard/adminNoticeBoardMain.do";
		});

		/* 취소 버튼 클릭 시 처리 이벤트 */
		$("#adminNoticeUpdateCancel").click(function() {
			location.href = "/admin/noticeBoard/adminNoticeBoardMain.do";
		});
	});
</script>
<style type="text/css">
#noticeBoardUpdateMenu {
	background-color: #8FD3E8;
}

#noticeBoardUpdateMain {
	padding-top: 10%;
}
</style>
</head>
<body>
	<header><jsp:include page="../header.jsp" /></header>
	<div id="container-fluid" id="noticeBoardUpdateMain">
		<section style="margin-left: 25%; margin-right: 25%;">
			<div id="noticeBoardUpdateTitle" class="page-header">
				<h1 style="font-weight: bold;">공지사항</h1>
			</div>
			<div id="adminNoticeBoardUpdateContainer">
				<!-- 공지사항 글 수정하기 페이지 출력 -->
				<div id="adminNoticeBoardUpdateContent">
					<form id="adminNoticeBoardUpdateForm"
						name="adminNoticeBoardUpdateForm">
						<input type="hidden" id="noticeNum" name="noticeNum"
							value="${updateData.noticeNum}" />
						<table class="table table-bordered table-hover">
							<tr>
								<td id="noticeBoardUpdateMenu"
									style="width: 10%; text-align: center; vertical-align: middle;"><b>제목</b></td>
								<td><input type="text" id="noticeTitle" name="noticeTitle"
									value="${updateData.noticeTitle}"
									placeholder="제목 입력 (40글자까지만 입력 가능)" style="width: 100%;"
									maxlength="40" /></td>
							</tr>
							<tr>
								<td id="noticeBoardUpdateMenu"
									style="width: 10%; text-align: center; vertical-align: middle;"><b>내용</b></td>
								<td><textarea id="noticeContent" name="noticeContent"
										placeholder="내용 입력" style="resize: none; width: 100%;"
										rows="9">${updateData.noticeContent}</textarea></td>
							</tr>
						</table>
					</form>
				</div>
				<div id="adminNoticeUpdateFooterDiv">
					<input type="button" value="목록보기" id="goAdminNoticeBoardMain"
						name="goAdminNoticeBoardMain" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" />
					<input type="button" value="수정 완료" id="adminNoticeUpdateComplete"
						name="adminNoticeUpdateComplete" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" />
					<input type="button" value="취소" id="adminNoticeUpdateCancel"
						name="adminNoticeUpdateCancel" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" />
				</div>
			</div>
		</section>
	</div>
	<footer><jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>