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
<title>관리자 공지사항 글 상세보기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#adminNoticeBoardDetailUpdate").click(function() {
			adminNoticeUpdate();
		});

		/* 삭제 버튼 클릭 시 처리 이벤트 */
		$("#adminNoticeBoardDetailDelete").click(function() {
			adminNoticeDelete();
		});

		/* 목록보기 버튼 클릭 시 처리 이벤트 */
		$("#goAdminNoticeBoardMain").click(function() {
			location.href = "/admin/noticeBoard/adminNoticeBoardMain.do";
		});
	});

	/* 수정 버튼 클릭 시 실질적인 처리 함수 */
	function adminNoticeUpdate() {
		var state = 1;
		if (state == 1) {
			var goUrl = "/admin/noticeBoard/adminNoticeBoardUpdateForm.do"; // 이동할 경로를 저장할 변수
			$("#adminNoticeBoardDetailForm").attr("action", goUrl);
			$("#adminNoticeBoardDetailForm").submit();
			return;
		} else {
			return;
		}
	}

	/* 삭제 버튼 클릭 시 실질적인 처리 함수 */
	function adminNoticeDelete() {
		var deleteConfirmText = confirm("삭제하시겠습니까?");
		if (deleteConfirmText == true) {
			var goUrl = "/admin/noticeBoard/adminNoticeBoardDelete.do"; // 이동할 경로를 저장할 변수
			$("#adminNoticeBoardDetailForm").attr("action", goUrl);
			$("#adminNoticeBoardDetailForm").submit();
			return;
		} else {
			return;
		}
	}
</script>
<style type="text/css">
#noticeBoardDetailMenu {
	background-color: #8FD3E8;
}

#noticeBoardDetailMain {
	padding-top: 10%;
}
</style>
</head>
<body>
<header><jsp:include page="../header.jsp" /></header>
	<div class="container-fluid" id="noticeBoardDetailMain">
		<section style="margin-left: 25%; margin-right: 25%;">
			<div id="noticeBoardDetailTitle" class="page-header">
				<h1 style="font-weight: bold;">공지사항</h1>
			</div>
			<div id="adminNoticeBoardDetailContainer">
				<!-- 공지사항 글 상세보기 페이지 출력 -->
				<div id="adminNoticeBoardDetailContent">
					<form id="adminNoticeBoardDetailForm"
						name="adminNoticeBoardDetailForm" method="POST">
						<input type="hidden" name="noticeNum" id="noticeNum"
							value="${detail.noticeNum}" />
					</form>
					<table class="table table-bordered table-hover">
						<tr>
							<td id="noticeBoardDetailMenu"
								style="width: 10%; text-align: center"><b>제목</b></td>
							<td>${detail.noticeTitle}</td>
						</tr>
						<tr>
							<td id="noticeBoardDetailMenu"
								style="width: 10%; text-align: center"><b>작성자</b></td>
							<td>${detail.adminId}</td>
						</tr>
						<tr>
							<td id="noticeBoardDetailMenu"
								style="width: 10%; text-align: center"><b>등록일</b></td>
							<td>${detail.noticeWriteDate}</td>
						</tr>
						<tr>
							<td id="noticeBoardDetailMenu"
								style="width: 10%; text-align: center"><b>내용</b></td>
							<td>${detail.noticeContent}</td>
						</tr>
					</table>
					<!-- 공지사항 글 상세보기 페이지 출력 종료 -->

					<table>
						<tr>
							<td id="btd1"><input type="button" value="목록보기"
								id="goAdminNoticeBoardMain" name="goAdminNoticeBoardMain"
								class="btn btn-default"
								style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" />
							<td id="btd2"><input type="button" value="삭제"
								id="adminNoticeBoardDetailDelete"
								name="adminNoticeBoardDetailDelete" class="btn btn-default"
								style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" /></td>
							<td id="btd3"><input type="button" value="수정"
								id="adminNoticeBoardDetailUpdate"
								name="adminNoticeBoardDetailUpdate" class="btn btn-default"
								style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" /></td>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</div>
	<footer><jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>