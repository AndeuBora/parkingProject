<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
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
		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});

		/* 글 등록 버튼 클릭 시 처리 이벤트 */
		$("#qnaBoardMemberReplyMainInsertBtn").click(function() {
			var sessionId = ${empty sessionScope.memberId};
			if (sessionId) {
				alert("회원만 이용가능합니다.");
				location.href = "/login/loginForm.do";
			} else {
				location.href = "/qnaBoard/qnaBoardWrite.do";
			}
		});
	});

	function goPage(page) {
		$("#page").val(page);
		$("#qnaBoardList").attr("method", "POST");
		$("#qnaBoardList").attr("action",
				"/qnaBoard/qnaBoardMemberReplyMain.do");
		$("#qnaBoardList").submit();
	}

	/* 상세 페이지 이동 함수(location 객체로 이동 url은 한라인으로 작성한다.) */
	function goQnaBoardDetail(qnaNum, page, pageSize) {
		var memberId = "<%=(String) session.getAttribute("memberId")%>";
		
		if (memberId == "null") {
		alert("접근불가");
		} else {
			location.href = "/qnaBoard/qnaBoardDetail.do?qnaNum=" + qnanum
			+ "&page=" + page + "&pageSize=" + pageSize;
		}
	}
</script>
</head>
<body>
	<div id="wrapper">
		<section style="margin-left: 20%; margin-right: 20%;">
			<!-- qna 게시판 글 리스트 출력 -->
			<div id="qnaBoardMemberReplyMainContainer">
				<div id="qnaBoardMemberReplyMainTitle">
					<h1 align="center">QnA</h1>
				</div>
				<div id="qnaBoardMemberReplyMainContent">
					<form id="qnaBoardList" name="qnaBoardList">
						<input type="hidden" id="qnaNum" name="qnaNum" /> <input
							type="hidden" id="page" name="page" value="${data.page}" /> <input
							type="hidden" id="pageSize" name="pageSize"
							value="${data.pageSize}" /> <input type="hidden" id="memberId"
							name="memberId" value="${sessionScope.memberId}" />
						<table
							class="table table-striped table-bordered table-hover table-responsive">
							<thead>
								<tr>
									<th style="text-align: center; width: 6%;">번호</th>
									<th style="text-align: center; width: 64%;">제목</th>
									<th style="text-align: center; width: 15%;">등록일</th>
									<th style="text-align: center; width: 15%;">작성자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty qnaBoardList}">
										<c:forEach var="qnaBoardMemberReplyMain"
											items="${qnaBoardList}" varStatus="status">
											<tr align="center">
												<td>${count-(status.count-1)}</td>
												<td><a
													href="javascript:goQnaBoardDetail(${qnaBoardMemberReplyMain.qnaNum},${data.page},${data.pageSize})">${qnaBoardMemberReplyMain.qnaTitle}</a>
												</td>
												<td>${qnaBoardMemberReplyMain.qnaWriteDate}</td>
												<td>${qnaBoardMemberReplyMain.memberId}</td>
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
			<!-- qna 게시판 글 리스트 출력 종료 -->

			<!-- 글 등록 버튼 출력 -->
			<div id="qnaBoardMemberReplyMainWriteBtn" align="right">
				<input type="button" value="글 등록"
					id="qnaBoardMemberReplyMainInsertBtn" class="btn btn-default"
					style="font-size: 10pt; font-weight: bold; margin-bottom: 2pt; height: 21pt;" />
			</div>
			<!-- 글 등록 버튼 출력 종료 -->

			<!-- 페이지 네비게이션 시작 -->
			<div id="qnaBoardPage" align="center">
				<tag:paging page="${param.page}" total="${total}"
					list_size="${data.pageSize}" />
			</div>
			<!-- 페이지 네비게이션 종료 -->
		</section>
	</div>
</body>
</html>