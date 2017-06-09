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
	function chkSubmit(v_item, v_name) {
		if (v_item.val().replace(/\s/g, "") == "") {
			alert(v_name + "확인해 주세요.");
			v_item.val("");
			v_item.focus();
			return false;
		} else {
			return true;
		}
	}

	$(document).ready(function() {

		$("#qnaWriteComplete").click(function() {
			$("#qnaWriteForm").attr({
				"method" : "POST",
				"action" : "/qnaBoard/qnaBoardInsert.do"
			});
			$("#qnaWriteForm").submit();
		});

		/* 비밀번호 입력 조건 */
		$("#qnaWritePwd").keyup(function(event) {
			var val = $(this).val();
			var onlyNumber = /[0-9]/;

			if (!onlyNumber.test(val)) {
				alert("숫자만 입력하세요.");
				$(this).val('');
				$(this).focus;
			} else {
				return;
			}
		});

		/* 목록보기 버튼 클릭 시 처리 이벤트 */
		$("#goQnaMemberReplyMain").click(function() {
			location.href = "/qnaBoard/qnaMemberReplyMain.do";
		});

		/* 취소 버튼 클릭 시 처리 이벤트 */
		$("#qnaWriteCancel").click(function() {
			location.href = "/qnaBoard/qnaMemberReplyMain.do";
		});
	});
</script>
</head>
<body>
	<section>
		<div id="qnaBoardWriteContainer">
			<div id="qnaTitle">
				<h2>QnA</h2>
			</div>
			<div id="qnaContent">
				<form id="qnaWriteForm" name="qnaWriteForm">
					<div id="qnaWriteTitleDiv">
						<input type="text" id="qnaWriteTitle" name="qnaWriteTitle" />
					</div>
					<hr>
					<div id="qnaWriteContentDiv">
						<textarea id="qnaWriteContent" name="qnaWriteContent"></textarea>
					</div>
					<div id="qnaWriteFooterDiv">
						<input type="button" id="goQnaMemberReplyMain"
							name="goQnaMemberReplyMain" onclick="" /> <span><b>글
								등록 비밀번호</b></span> <input type="text" maxlength="4" id="qnaWritePwd"
							name="qnaWritePwd" /> <input type="button" id="qnaWriteComplete"
							name="qnaWriteComplete" onclick="" /> <input type="button"
							id="qnaWriteCancel" name="qnaWriteCancel" onclick="" />
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>