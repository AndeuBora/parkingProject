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
<script>
	$(function() {
		//datepicker
		$("#startDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
		//datepicker
		$("#endDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
		//startDate>endDate
		$("#endDate").change(function() {
			if ($("#startDate").val() > $("#endDate").val()) {
				alert("신청조회날짜 설정이 잘못됬습니다. \n다시설정하세요");
				$("#startDate").val("");
				$("#endDate").val("");
				$("#startDate").focus();
			}
		});

		//예약사용목록
		//사용여부 = 0일경우(미사용)
		$(".bookingState:contains(0)").html(
				"미사용<button onclick='bookingCancle()'>예약취소</button>");
		$(".bookingState:contains(0)").css("color", "red");
		//사용여부 = 1일경우(사용)
		$(".bookingState:contains(1)").html("사용완료");
		$(".bookingState:contains(1)").css("color", "green");
		//사용여부 = 2일경우(사용)
		$(".bookingState:contains(2)").html("취소완료");
		$(".bookingState:contains(2)").css("color", "gray");

		/* // 몇개씩보기 수정
		$("#pageSize").change(function() {
			goPage(1);
		}) */
	});

	//날짜별 예약목록 조회
	function bookingDateSelet() {
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		//값 설정안됬을 경우
		if (startDate == "" || endDate == "") {
			alert("날짜먼저 선택 후 클릭해주세요.");
			$("#startDate").focus();
			return;
		}
		//값 확인
		alert("start=" + startDate)
		alert("endDate=" + endDate)

		$("#f_mybooking").attr("action", "myBooking.do");
		$("#f_mybooking").submit();
	}

	//예약취소버튼 클릭 시,
	function bookingCancle() {
		if (confirm("예약취소 시, 기간에따라 수수료가 부과됩니다.\n예약취소하시겠습니까?")) {
			location.href = "myBookingCancle.do";
		}
	}
</script>
<title>나의 예약관리</title>
</head>
<body>
	<form id="f_mybooking">
		<div id="myBooking_1">
			<h3>나의 예약관리</h3>

			<p>
				기간별 조회 : <input type="text" id="startDate" name="startDate">
				~ <input type="text" id="endDate" name="endDate"> <input
					type="button" onclick="bookingDateSelet()" value="조회">
			</p>

			<p>
				<select id="pageSize" name="pageSize">
					<option value="3" selected>3개씩보기</option>
					<option value="5">5개씩보기</option>
					<option value="10">10개씩보기</option>
				</select>
			</p>
			<!-- 여기에 for문 예약목록 -->
			<c:forEach var="list" items="${myBooking }">
				<div class="myBookinglist">
					<p>
						No. <span>${list.bookingNum }</span>
					</p>
					<table border="1">
						<colgroup>
							<col width="150">
							<col width="200">
							<col width="150">
							<col width="200">
						</colgroup>
						<tr>
							<th>사용여부</th>
							<td><span class="bookingState">${list.bookingState }</span></td>
							<th>예약자리번호</th>
							<td>${list.bookingSpot }</td>
						</tr>
						<tr>
							<th>예약자 이름</th>
							<td>${list.bookingName }</td>
							<th>예약자 연락처</th>
							<td>${list.bookingPhone }</td>
						</tr>
						<tr>
							<th>사용자 이름</th>
							<td></td>
							<th>사용자 아이디</th>
							<td></td>
						</tr>
						<tr>
							<th>신청 일자</th>
							<td>${list.applicationDate }</td>
							<th>예약 일자</th>
							<td>${list.bookingDate }</td>
						</tr>
						<tr>
							<th>예약금액</th>
							<td>${list.bookingMoney }</td>
							<th>감면혜택 종류</th>
							<td>${list.bookingDiscount }</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			<!-- 여기에 for문 예약목록 끝-->
		</div>
		<!-- 페이지네비게이션 시작  -->
		<div id="Page">
			<tag:paging page="${param.page }" total="${total }"
				list_size="${mybooking.pageSize }" />
		</div>
	</form>
</body>
</html>