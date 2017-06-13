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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				/* 글 등록 완료 버튼 클릭 시 처리 이벤트 */
				$("#qnaWriteComplete").click(
						function() {
							if ($("#qnaWriter").val() == null
									|| $("#qnaWriter").val() == "") {
								alert("작성자를 입력해주세요.");
								$("#qnaWriter").focus();
								return;
							} else if ($("#qnaTitle").val() == null
									|| $("#qnaTitle").val() == "") {
								alert("제목을 입력해주세요.");
								$("#qnaTitle").focus();
								return;
							} else if ($("#qnaContent").val() == null
									|| $("#qnaContent").val() == "") {
								alert("내용을 입력해주세요.");
								$("#qnaContent").focus();
								return;
							} else if ($("#qnaWritePwd").val() == null
									|| $("#qnaWritePwd").val() == "") {
								alert("비밀번호를 입력해주세요.");
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
				$("#qnaWritePwd").keyup(function(event) {
					var val = $(this).val();
					var onlyNumber = /[0-9]/;
					var firstAlphabet = /[a-zA-Z].{0,1}/;

					if (!onlyNumber.test(val)) {
						alert("숫자만 입력");
						$(this).val('');
						$(this).focus;
					} else if (firstAlphabet.test(val)) {
						alert("숫자만 입력하세요.");
						$(this).val('');
						$(this).focus();
					} else {
						return;
					}
				});

				/* 목록보기 버튼 클릭 시 처리 이벤트 */
				$("#goQnaMemberReplyMain").click(function() {
					location.href = "qnaBoard/qnaBoardMemberReplyMain.do";
				});

				/* 취소 버튼 클릭 시 처리 이벤트 */
				$("#qnaWriteCancel").click(function() {
					location.href = "qnaBoard/qnaBoardMemberReplyMain.do";
				});
			});
</script>
</head>
<body>
	<section>
		<!-- qna 글 등록 페이지 출력 -->
		<div id="qnaBoardWriteContainer">
			<div id="qnaWriteTitle">
				<h2>
					<a href="qnaBoard/qnaBoardMemberReplyMain.do">QnA</a>
				</h2>
			</div>
			<div id="qnaWriteContent">
				<form id="qnaWriteForm" name="qnaWriteForm">
					<input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
					<div id="qnaWriterDiv">
						<span><b>작성자</b></span>&nbsp;<input type="text" id="qnaWriter"
							name="qnaWriter" placeholder="작성자 입력" />
					</div>
					<div id="qnaWriteTitleDiv">
						<span><b>제목</b></span>&nbsp;<input type="text" id="qnaTitle"
							name="qnaTitle" placeholder="제목 입력" />
					</div>
					<hr>
					<div id="qnaWriteContentDiv">
						<span><b>내용</b></span>&nbsp;
						<textarea id="qnaContent" name="qnaContent" placeholder="내용 입력"></textarea>
					</div>
					<div id="qnaWriteFooterDiv">
						<input type="button" value="목록보기" id="goQnaMemberReplyMain"
							name="goQnaMemberReplyMain" /> <span><b>글 등록 비밀번호</b></span> <input
							type="password" maxlength="4" id="qnaWritePwd" name="qnaWritePwd"
							placeholder="비밀번호 입력" /> <input type="button" value="등록"
							id="qnaWriteComplete" name="qnaWriteComplete" /> <input
							type="button" id="qnaWriteCancel" value="취소"
							name="qnaWriteCancel" />
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>