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
<title>QnA 글 등록</title>
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
		$("#qnaWriteComplete").click(function() {
			if (!chkSubmit($('#memberId'), "작성자를")) {
				return;
			} else if (!chkSubmit($('#qnaTitle'), "제목을")) {
				return;
			} else if (!chkSubmit($('#qnaContent'), "내용을")) {
				return;
			} else if (!chkSubmit($('#qnaWritePwd'), "비밀번호를")) {
				return;
			} else if (!($("#checkPw").html() == "입력 완료")) {
				alert("비밀번호를 4자리만 입력해 주세요.");
				$("#qnaWritePwd").val("");
				$("#qnaWritePwd").focus();
				return;
			} else {
				$("#qnaWriteForm").attr({
					"method" : "POST",
					"action" : "/qnaBoard/qnaBoardInsert.do"
				});
				$("#qnaWriteForm").submit();
			}
		});

		/* 비밀번호 입력 조건 */
		var qnaWritePwd = $("#qnaWritePwd");
		qnaWritePwd.keyup(function() {
			var onlyNumber = /^[0-9]{4}/;

			if (onlyNumber.test(qnaWritePwd.val()) != true) {
				$("#checkPw").html("숫자 4글자를 입력해주세요.");
				$("#checkPw").css("color", "red");
				qnaWritePwd.focus();
				return false;
			} else {
				$("#checkPw").html("입력 완료");
				$("#checkPw").css("color", "blue");
				return true;
			}
		});

		/* 목록보기 버튼 클릭 시 처리 이벤트 */
		$("#goQnaMemberReplyMain").click(function() {
			location.href = "/qnaBoard/qnaBoardMemberReplyMain.do";
		});

		/* 취소 버튼 클릭 시 처리 이벤트 */
		$("#qnaWriteCancel").click(function() {
			location.href = "/qnaBoard/qnaBoardMemberReplyMain.do";
		});
	});
</script>
</head>
<body>
	<div id="wrapper">
		<section style="margin-left: 20%; margin-right: 20%;">
			<!-- qna 글 등록 페이지 출력 -->
			<div id="qnaBoardWriteContainer">
				<div id="qnaWriteTitle">
					<h2>
						<a href="/qnaBoard/qnaBoardMemberReplyMain.do"
							style="text-decoration: none; color: black;">QnA</a>
					</h2>
				</div>
				<div id="qnaWriteContent">
					<form id="qnaWriteForm" name="qnaWriteForm">
						<input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
						<table
							class="table table-striped table-bordered table-hover table-responsive">
							<tr>
								<td id="qnaWriteMenu" style="width: 20%; text-align: center"><b>작성자</b></td>
								<td><input type="text" id="memberId" name="memberId"
									value="${sessionScope.memberId}" readonly="readonly" /></td>
							</tr>
							<tr>
								<td id="qnaWriteMenu" style="width: 20%; text-align: center"><b>제목</b></td>
								<td><input type="text" id="qnaTitle" name="qnaTitle"
									placeholder="제목 입력 (40글자까지만 입력 가능)" style="width: 100%;"
									maxlength="40" /></td>
							</tr>
							<tr>
								<td id="qnaWriteMenu" style="width: 20%; text-align: center"><b>내용</b></td>
								<td style="height: auto;"><textarea id="qnaContent"
										name="qnaContent" placeholder="내용 입력"
										style="resize: none; width: 100%;" rows="9"></textarea></td>
							</tr>
							<tr>
								<td id="qnaWriteMenu" style="width: 20%; text-align: center"><b>글
										등록 비밀번호</b></td>
								<td><input type="password" maxlength="4" id="qnaWritePwd"
									name="qnaWritePwd" placeholder="비밀번호 입력 (숫자 4자리)" /><span
									id="checkPw"></span></td>
							</tr>
						</table>
					</form>
				</div>
				<div id="qnaWriteFooterDiv">
					<input type="button" value="목록보기" id="goQnaMemberReplyMain"
						name="goQnaMemberReplyMain" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" />
					<input type="button" value="등록" id="qnaWriteComplete"
						name="qnaWriteComplete" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt; margin-left: 2pt;" />
					<input type="button" id="qnaWriteCancel" value="취소"
						name="qnaWriteCancel" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt; margin-left: 2pt;" />
				</div>
			</div>
		</section>
	</div>
</body>
</html>