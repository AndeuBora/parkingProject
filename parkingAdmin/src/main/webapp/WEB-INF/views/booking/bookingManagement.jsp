<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/booking.css" type="text/css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/booking.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 부트스트랩 -->
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<!-- 부트스트랩 -->
<script>
	$(function() {
		//datepicker
		$("#s_startDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
		//datepicker값 변경
		$("#s_startDate").change(function() {
			var date = $("#s_startDate").val();
			$("#startDate").val(date);
		});
		//datepicker
		$("#s_endDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
		//datepicker값 변경
		$("#s_endDate").change(function() {
			var date = $("#s_endDate").val();
			$("#endDate").val(date);
		});
		//pageSize값 변경
		$("#s_pageSize").change(function() {
			var pageSize = $("#s_pageSize").val();
			$("#pageSize").val(pageSize);
			goPage(1);
		});
		//bookingState값 변경
		$("#s_bookingState").change(function() {
			var bookingState = $("#s_bookingState").val();
			$("#bookingState").val(bookingState);
			goPage(1);
		});
		//startDate>endDate
		$("#s_endDate").change(function() {
			if ($("#s_startDate").val() > $("#s_endDate").val()) {
				alert("신청조회날짜 설정이 잘못됬습니다. \n다시설정하세요");
				$("#s_startDate").val("");
				$("#s_endDate").val("");
				$("#s_startDate").focus();
			}
		});
		//사용여부 = 0일경우(미사용)
		$(".state:contains(0)").html("미사용");
		//사용여부 = 1일경우(사용)
		$(".state:contains(1)").html("사용완료");
		//사용여부 = 2일경우(취소)
		$(".state:contains(2)").html("취소완료");
	});

	//페이징처리 처리함수
	function goPage(page) {
		$("#page").val(page);
		$("#f_bookingManagement").attr("action", "bookingManagement.do");
		$("#f_bookingManagement").submit();
	}

	//페이징처리 처리함수(전체목록)
	function goPageAll(page) {
		$("#startDate").val("2017-01-01");
		$("#endDate").val("2017-12-31");
		goPage(1);
	}

	//날짜별 예약목록 조회
	function bookingDateSelet() {
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		//값 설정안됬을 경우
		if (startDate == "" || endDate == "") {
			alert("날짜먼저 선택 후 클릭해주세요.");
			$("#s_startDate").focus();
			return;
		}
	}
</script>
<title>관리자) 예약관리</title>
</head>
<body>
	<header><jsp:include page="../header.jsp" /></header>
	<hr>
	<div class="container">
		<div id="myBooking_1">
			<h3>예약관리</h3>
		</div>
		<div id="myBooking_2">
			<p>
				기간별 조회 : <input type="text" id="s_startDate" name="s_startDate"
					readonly> ~ <input type="text" id="s_endDate"
					name="s_endDate" readonly> <input type="button"
					onclick="goPage()" value="조회"> <input type="button"
					onclick="goPageAll()" value="전체">
			</p>
		</div>
		<form id="f_bookingManagement">
			<div>
				<p>
					<select id="s_pageSize" name="s_pageSize">
						<option value="5" ${data.pageSize eq "5" ? "selected" : ""}>5개씩보기</option>
						<option value="10" ${data.pageSize eq "10" ? "selected" : ""}>10개씩보기</option>
						<option value="20" ${data.pageSize eq "20" ? "selected" : ""}>20개씩보기</option>
						<option value="30" ${data.pageSize eq "30" ? "selected" : ""}>30개씩보기</option>
						<option value="40" ${data.pageSize eq "40" ? "selected" : ""}>40개씩보기</option>
					</select>
				</p>
			</div>
			<div>
				<p>
					예약일자 기준 : <input type="text" id="startDate" name="startDate"
						value="${data.startDate }" readonly="readonly"> ~ <input
						type="text" id="endDate" name="endDate" value="${data.endDate }"
						readonly="readonly">
				</p>
			</div>
			<div>
				<p>
					예약코드 번호 : <input type="text" id="bookingNum" name="bookingNum"><input
						type="button" onclick="goPage()" value="조회">
				</p>
			</div>
			<div>
				<p>
					<select id="s_bookingState" name="s_bookingState">
						<option value="3" ${data.bookingState eq "3" ? "selected" : ""}>전체</option>
						<option value="0" ${data.bookingState eq "0" ? "selected" : ""}>미사용</option>
						<option value="1" ${data.bookingState eq "1" ? "selected" : ""}>사용</option>
						<option value="2" ${data.bookingState eq "2" ? "selected" : ""}>취소</option>
					</select>
				</p>
			</div>
			<div>
				<!-- 12개칼럼 -->
				<table class="table">
					<colgroup>
						<col width="50">
						<col width="100">
						<col width="100">
						<col width="100">
						<col width="100">
						<col width="130">
						<col width="130">
						<col width="100">
						<col width="100">
						<col width="100">
						<col width="150">
						<col width="100">
						<col width="130">
						<col width="130">
					</colgroup>
					<tr>
						<td></td>
						<td>예약상황</td>
						<td>예약 번호</td>
						<td>회원 번호</td>
						<td>결제 번호</td>
						<td>예약자 이름</td>
						<td>예약자 <br>전화번호
						</td>
						<td>예약자리</td>
						<td>감면종류</td>
						<td>금액</td>
						<td>신청 날짜</td>
						<td>예약 날짜</td>
					</tr>
					<c:if test="${empty BookingList}">
						<tr>
							<td colspan="12" align="center">조건에 해당하는 예약목록이 존재하지않습니다.<br>
								조건검색을 재차 확인 후 다시 검색바랍니다.
							</td>
						</tr>

					</c:if>
					<!-- for문시작 -->
					<c:forEach var="list" items="${BookingList }" varStatus="status">

						<tr>
							<td>${list.rnum}</td>
							<td class="state">${list.bookingState }</td>
							<td>${list.bookingNum }</td>
							<td>${list.memberNum }</td>
							<td>${list.paymentNum }</td>
							<td>${list.bookingNum }</td>
							<td>${list.bookingName }</td>
							<td>${list.bookingSpot }</td>
							<td>${list.bookingDiscount }</td>
							<td>${list.bookingMoney }</td>
							<td>${list.applicationDate }</td>
							<td>${list.bookingDate }</td>
						</tr>
					</c:forEach>
					<!-- for문끝 -->
				</table>
			</div>
			<!-- 히든값 -->
			<input type="hidden" id="page" name="page" value="${data.page}">
			<input type="hidden" id="pageSize" name="pageSize"
				value="${data.pageSize }"> <input type="hidden"
				id="bookingState" name="bookingState" value="${data.bookingState }">
			<!-- 페이지네비게이션 시작  -->
			<div id="Page">
				<tag:paging page="${param.page }" total="${total }"
					list_size="${data.pageSize }" />
			</div>
		</form>
	</div>
	<hr>
	<footer><jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>