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
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#pwdChk").hide();

		/* 삭제 버튼 클릭 시 처리 이벤트 */
		$("#qnaDetailDelete").click(function() {
			$("#pwdChk").show();
			$("#msg").text("글 등록시 입력한 비밀번호를 입력해 주세요.").css("color", "#000099");
			$("#msg").css("font-size", "8pt");
			$("#qnaDetailDelete").hide();
		});

		/* 비밀번호 확인 버튼 클릭 시 처리 이벤트 */
		$("#pwdBut").click(function() {
			pwdConfirm();
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
			location.href = "/qnaBoard/qnaBoardMemberReplyMain.do";
		});
	});

	/* 비밀번호 클릭 시 실질적인 처리 함수 */
	function pwdConfirm() {
		if (!chkSubmit($('#qnaWritePwd'), "비밀번호를"))
			return;
		else {
			$.ajax({
				url : "/qnaBoard/pwdConfirm.do", // 전송 url
				type : "POST", // 전송 시 method 방식
				data : $("#qnaDetailPwdForm").serialize(), // 폼 전체 데이터 전송
				error : function() { // 실행 시 오류가 발생하였을 경우
					alert('시스템 오류 입니다. 관리자에게 문의하세요.');
				}, // 정상적으로 실행이 되었을 경우
				success : function(resultData) {
					var goUrl = ""; // 이동할 경로를 저장할 변수
					if (resultData == 0) { // 일치하지 않는 경우
						$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color",
								"red");
						$("#qnaWritePwd").select();
						return;
					} else if (resultData == 1) { // 일치할 경우
						$("#msg").text("");
						goUrl = "/qnaBoard/qnaBoardDelete.do";
					}
					$("#qnaBoardDetailForm").attr("action", goUrl);
					$("#qnaBoardDetailForm").submit();
				}
			});
		}
	}
</script>
</head>
<body>
	<div id="wrapper">
		<section style="margin-left: 25%; margin-right: 25%;">
			<div id="qnaBoardDetailContainer">
				<div id="qnaBoardDetailTitle">
					<h1>
						<a href="/qnaBoard/qnaBoardMemberReplyMain.do"
							style="text-decoration: none; color: black;">QnA</a>
					</h1>
				</div>

				<!-- qna 글 상세보기 페이지 출력 -->
				<div id="qnaBoardDetailContent">
					<form id="qnaBoardDetailForm" name="qnaBoardDetailForm"
						method="POST">
						<input type="hidden" name="qnaNum" id="qnaNum"
							value="${detail.qnaNum}" />
					</form>
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<td id="qnaWriteMenu" style="width: 10%; text-align: center"><b>제목</b></td>
							<td>${detail.qnaTitle}</td>
						</tr>
						<tr>
							<td id="qnaWriteMenu" style="width: 10%; text-align: center"><b>작성자</b></td>
							<td>${detail.memberId}</td>
						</tr>
						<tr>
							<td id="qnaWriteMenu" style="width: 10%; text-align: center"><b>등록일</b></td>
							<td>${detail.qnaWriteDate}</td>
						</tr>
						<tr>
							<td id="qnaWriteMenu" style="width: 10%; text-align: center"><b>내용</b></td>
							<td>${detail.qnaContent}</td>
						</tr>
						<tr>
					</table>
					<!-- qna 글 상세보기 페이지 출력 종료 -->
					<table>
						<tr>
							<td id="btd1"><input type="button" value="목록보기"
								id="goQnaMemberReplyMain" name="goQnaMemberReplyMain"
								class="btn btn-default"
								style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" />&nbsp;&nbsp;</td>
							<td>
								<div id="pwdChk">
									<form id="qnaDetailPwdForm" name="qnaDetailPwdForm">
										<input type="hidden" id="qnaNum" name="qnaNum"
											value="${detail.qnaNum}" /> <label for="qnaPwd" id="qnaPwd">글
											등록 비밀번호 :&nbsp;</label><input type="password" maxlength="4"
											id="qnaWritePwd" name="qnaWritePwd" style="width: 10%;" /><input
											type="button" id="pwdBut" name="pwdBut" value="확인"
											class="btn btn-default"
											style="font-size: 10pt; font-weight: bold; margin-left: 2pt; margin-bottom: 2pt; height: 21pt; margin-right: 5px;" /><span
											id="msg"></span>
									</form>
								</div>
							</td>
							<td id="btd2"><input type="button" value="삭제"
								id="qnaDetailDelete" name="qnaDetailDelete"
								class="btn btn-default"
								style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" /></td>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</div>
</body>
</html>