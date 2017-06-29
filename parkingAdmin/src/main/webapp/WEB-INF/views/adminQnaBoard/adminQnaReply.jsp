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
<title>관리자 QnA 댓글</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css?var=223" />
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/* 기본 댓글 목록 불러오기 */
						var qnaNum = "<c:out value='${detail.qnaNum}' />";
						listAll(qnaNum);

						/* 댓글 내용 저장 이벤트 */
						$("#adminQnaReplyInsert")
								.click(
										function() {
											if (!chkSubmit($("#adminId"),
													"작성자를")) {
												return;
											} else if (!chkSubmit(
													$("#replyContent"),
													"댓글 내용을")) {
												return;
											} else {
												var insertUrl = "/admin/adminQnaReply/adminQnaReplyInsert.do";
												/* 글 저장을 위한 POST 방식의 Ajax 연동 처리 */
												$
														.ajax({
															url : insertUrl, // 전송 url
															type : "POST", // 전송 시 method 방식
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "POST"
															},
															dataType : "text",
															data : JSON
																	.stringify({
																		qnaNum : qnaNum,
																		adminId : $(
																				"#adminId")
																				.val(),
																		replyContent : $(
																				"#replyContent")
																				.val()
																	}),
															error : function() { // 실행 시 오류가 발생하였을 경우
																alert('시스템 오류입니다. 관리자에게 문의하세요.');
															},
															success : function(
																	resultData) {
																if (resultData == "SUCCESS") {
																	alert('댓글 등록이 완료되었습니다.');
																	dataReset();
																	listAll(qnaNum);
																}
															}
														});
											}
										});

						/* 수정 버튼 클릭 시 수정폼 출력 */
						$(document)
								.on(
										"click",
										".update_form",
										function() {
											$(".reset_btn").click();
											var conText = $(this).parents("li")
													.children().eq(1).html();
											$(this).parents("li").find(
													"input[type='button']")
													.hide();
											$(this).parents("li").children()
													.eq(0).html();
											var conArea = $(this).parents("li")
													.children().eq(1);

											conArea.html("");
											var data = "<textarea name='content' id='content' style='width: 74%; resize: none;' rows='3'>"
													+ conText + "</textarea>";
											data += "<input type='button' id='update_btn' value='수정완료' class='btn btn-default' style='font-size: 10pt; font-weight: bold; height: 21pt;'>";
											data += "<input type='button' id='reset_btn' value='수정취소' class='btn btn-default' style='font-size: 10pt; font-weight: bold; height: 21pt;'>";
											conArea.html(data);
										});

						/* 수정 취소 버튼 */
						$(document).on(
								"click",
								"#reset_btn",
								function() {
									var conText = $(this).parents("li").find(
											"textarea").html();
									$(this).parents("li").find(
											"input[type='button']").show();
									var conArea = $(this).parents("li")
											.children().eq(1);
									conArea.html(conText);
								});

						/* 댓글 수정을 위한 Ajax 연동 처리 */
						$(document)
								.on(
										"click",
										"#update_btn",
										function() {
											var replyNum = $(this)
													.parents("li").attr(
															"data-num");
											var replyContent = $("#content")
													.val();
											if (!chkSubmit($("#content"),
													"댓글 내용을")) {
												return;
											} else {
												$
														.ajax({
															url : '/admin/adminQnaReply/'
																	+ replyNum
																	+ ".do",
															type : 'PUT',
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "PUT"
															},
															data : JSON
																	.stringify({
																		replyContent : replyContent
																	}),
															dataType : 'text',
															success : function(
																	result) {
																if (result == 'SUCCESS') {
																	alert("수정 되었습니다.");
																	listAll(qnaNum);
																}
															}
														});
											}
										});

						/* 댓글 삭제를 위한 Ajax 연동 처리 */
						$(document)
								.on(
										"click",
										".delete_btn",
										function() {
											var replyNum = $(this)
													.parents("li").attr(
															"data-num");

											if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
												$
														.ajax({
															type : 'delete',
															url : '/admin/adminQnaReply/'
																	+ replyNum
																	+ ".do",
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "DELETE"
															},
															dataType : 'text',
															success : function(
																	result) {
																if (result == 'SUCCESS') {
																	alert("삭제 되었습니다.");
																	listAll(qnaNum);
																}
															}
														});
											}
										});
					});

	/* 리스트 요청 함수 */
	function listAll(qnaNum) {
		$("#adminQnaReplyList").html("");
		var url = "/admin/adminQnaReply/all/" + qnaNum + ".do";
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var replyNum = this.replyNum;
				var adminId = this.adminId;
				var replyContent = this.replyContent;
				var replyWriteDate = this.replyWriteDate;
				addNewItem(replyNum, adminId, replyContent, replyWriteDate);
			});
		}).fail(function() {

		});
	}

	/* 새로운 댓글을 화면에 추가하기 위한 함수 */
	function addNewItem(replyNum, adminId, replyContent, replyWriteDate) {
		/* 새로운 글이 추가될 li태그 객체 */
		var new_li = $("<li>");
		new_li.attr("data-num", replyNum);
		new_li.addClass("comment-item");

		/* 작성자 정보가 지정될 <p>태그 */
		var writer_p = $("<p>");
		writer_p.addClass("writer");

		/* 작성자 정보의 이름 */
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(adminId + " (관리자)");

		/* 내용 */
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(replyContent);

		/* 작성일시 */
		var date_span = $("<span>");
		date_span.html(" / " + replyWriteDate + " ");

		/* 수정하기 버튼 */
		var up_input = $("<input>");
		up_input
				.attr({
					"type" : "button",
					"class" : "btn btn-default",
					"value" : "댓글수정",
					"style" : "font-size: 10pt; font-weight: bold; height: 21pt; float: right;"
				});
		up_input.addClass("update_form");

		/* 삭제하기 버튼 */
		var del_input = $("<input>");
		del_input
				.attr({
					"type" : "button",
					"class" : "btn btn-default",
					"value" : "댓글삭제",
					"style" : "font-size: 10pt; font-weight: bold; height: 21pt; float: right;"
				});
		del_input.addClass("delete_btn");

		/* 조립하기 */
		writer_p.append(name_span).append(date_span).append(up_input).append(
				del_input)
		new_li.append(writer_p).append(content_p);
		$("#adminQnaReplyList").append(new_li);
	}

	function dataReset() {
		$("#replyContent").val("");
	}
</script>
<style type="text/css">
#qnaBoardReplyMenu {
	background-color: #8FD3E8;
}
</style>
</head>
<body>
	<div id="qnaBoardReplyMain">
		<div id="adminQnaReplyContent">
			<form id="adminQnaReplyForm" name="adminQnaReplyForm">
				<input type="hidden" id="qnaNum" name="qnaNum" />
				<table class="table table-bordered table-hover">
					<tr>
						<td id="qnaBoardReplyMenu"
							style="width: 10%; vertical-align: middle; text-align: center;"><b>작성자</b></td>
						<td><input type="text" name="adminId" id="adminId"
							value="관리자" readonly="readonly"
							style="width: 15%; text-align: center;" /></td>
					</tr>
					<tr>
						<td id="qnaBoardReplyMenu"
							style="width: 10%; vertical-align: middle; text-align: center;"><b>댓글</b></td>
						<td><textarea id="replyContent" name="replyContent" rows="9"
								placeholder="댓글 입력" style="resize: none; width: 100%;"></textarea></td>
					</tr>
				</table>
				<div>
					<input type="button" value="목록보기" id="goQnaBoardAdminReplyMain"
						name="goQnaBoardAdminReplyMain" class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 11pt; height: 21pt;" />&nbsp;&nbsp;
					<input type="button" id="adminQnaReplyInsert" value="댓글저장"
						class="btn btn-default"
						style="font-size: 10pt; font-weight: bold; margin-bottom: 11pt; height: 21pt;" />
					<hr style="margin-bottom: 15pt;">
				</div>
			</form>
		</div>
		<ul id="adminQnaReplyList" class="list-unstyled">
			<!-- 동적 생성 요소 -->
		</ul>
	</div>
</body>
</html>