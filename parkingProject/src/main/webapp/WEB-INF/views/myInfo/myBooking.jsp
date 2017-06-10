<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			dateFormat : "yy-mm-dd";
		});
		//datepicker
		$("#endDate").datepicker({
			dateFormat : "yy-mm-dd";
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
	});
	//기간별 조회
	function selectApplicationDate() {
		var startDate =$("#startDate").val();
		var endDate =$("#endDate").val();
		   var Data = {
		            "startDate":startDate,
		            "endDate":endDate
		      }
		      $.ajax({
		           url:"bookingCheckAgain.do",
		              type:'GET',
		              data: Data,
		              success:function(data){
		                  alert("완료!");
		                  window.opener.location.reload();
		                  self.close();
		              },
		              error:function(jqXHR, textStatus, errorThrown){
		                  alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		                  self.close();
		              }
		      });
	}
</script>
<title>나의 예약관리</title>
</head>
<body>
	<div id="myBooking_1">
		<h3>나의 예약관리</h3>
		<form id="selectdate_f">
			<p>
				기간별 조회 : <input type="text" id="startDate"> ~ <input
					type="text" id="endDate"> <input type="button"
					onclick="selectApplicationDate()" value="조회">
			</p>
		</form>
		<form id="selectview_f">
			<p>
				<select id="selectViewCount">
					<option value="3" selected>3개씩보기</option>
					<option value="5">5개씩보기</option>
					<option value="10">10개씩보기</option>
				</select>
			</p>
		</form>
		<!-- 여기에 for문 예약목록 -->
		<div class="myBookinglist">
			<p>
				No. <span></span>
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
					<td></td>
					<th>예약자리번호</th>
					<td></td>
				</tr>
				<tr>
					<th>예약자 이름</th>
					<td></td>
					<th>예약자 연락처</th>
					<td></td>
				</tr>
				<tr>
					<th>사용자 이름</th>
					<td></td>
					<th>사용자 아이디</th>
					<td></td>
				</tr>
				<tr>
					<th>신청 일자</th>
					<td></td>
					<th>예약 일자</th>
					<td></td>
				</tr>
				<tr>
					<th>예약금액</th>
					<td></td>
					<th>감면혜택 종류</th>
					<td></td>
				</tr>
			</table>
		</div>
		<!-- 여기에 for문 예약목록 끝-->
	</div>
</body>
</html>