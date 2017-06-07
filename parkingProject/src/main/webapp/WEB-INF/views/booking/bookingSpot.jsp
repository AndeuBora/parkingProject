<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$("#datepicker").datepicker({
			minDate : +1,
			maxDate : "+1M",
			dateFormat : "yy-mm-dd"
		});
		//datepicker값 변경
		$("#datepicker").change(function() {
			alert("값변경");
			var date = $("#datepicker").val();
			$("#selectdate").val(date);
		});
		//자리값 얻어오기
		$("button").click(function() {
			var date = $("#datepicker").val();
			var date1 = $("#selectdate").val();
			if (date1 == "****-**-**") {
				alert("날짜먼저 선택 후 자리선택해주세요");
				$("#datepicker").focus();
				return;
			}
			var s = $(this).val();
			alert("자리값변경");
			$("#selectspot").val(s);
			$("#selectmoney").val("30,000");
		});
	});
</script>
<title>예약날짜/자리 선택</title>
</head>
<body>
	<section>
		<div id="choiceDate">
			<h3>
				1.날짜선택 <img src="/resources/img/booking/calendar.png" alt="날짜선택"
					id="deteimg" height="20px" width="20px">
			</h3>
			<p>
				Date: <input type="text" id="datepicker">
			</p>
		</div>
		<div id="choiceSpot">
			<h3>2. 자리선택</h3>
			<div id="spot">
				<div id="spot1">
					<button id="A1" value="A1">A1</button>
					<button id="A2" value="A2">A2</button>
					<button id="A3" value="A3">A3</button>
					<button id="A4" value="A4">A4</button>
					<button id="A5" value="A5">A5</button>
					<button id="A6" value="A6">A6</button>
					<button id="A7" value="A7">A7</button>
					<button id="A8" value="A8">A8</button>
					<button id="A9" value="A9">A9</button>
					<button id="A10" value="A10">A10</button>
				</div>
				<div id="spot2">
					<button id="B1" value="B1">B1</button>
					<button id="B2" value="B2">B2</button>
					<button id="B3" value="B3">B3</button>
					<button id="B4" value="B4">B4</button>
					<button id="B5" value="B5">B5</button>
					<button id="B6" value="B6">B6</button>
					<button id="B7" value="B7">B7</button>
					<button id="B8" value="B8">B8</button>
					<button id="B9" value="B9">B9</button>
					<button id="B10" value="B10">B10</button>
				</div>
				<div id="spot3">
					<button id="C1" value="C1">C1</button>
					<button id="C2" value="C2">C2</button>
					<button id="C3" value="C3">C3</button>
					<button id="C4" value="C4">C4</button>
					<button id="C5" value="C5">C5</button>
					<button id="C6" value="C6">C6</button>
					<button id="C7" value="C7">C7</button>
					<button id="C8" value="C8">C8</button>
					<button id="C9" value="C9">C9</button>
					<button id="C10" value="C10">C10</button>
				</div>
				<div id="spot4">
					<button id="D1" value="D1">D1</button>
					<button id="D2" value="D2">D2</button>
					<button id="D3" value="D3">D3</button>
					<button id="D4" value="D4">D4</button>
					<button id="D5" value="D5">D5</button>
					<button id="D6" value="D6">D6</button>
					<button id="D7" value="D7">D7</button>
					<button id="D8" value="D8">D8</button>
					<button id="D9" value="D9">D9</button>
					<button id="D10" value="D10">D10</button>
				</div>
				<div id="spot5">
					<button id="E1" value="E1">E1</button>
					<button id="E2" value="E2">E2</button>
					<button id="E3" value="E3">E3</button>
					<button id="E4" value="E4">E4</button>
					<button id="E5" value="E5">E5</button>
					<button id="E6" value="E6">E6</button>
					<button id="E7" value="E7">E7</button>
					<button id="E8" value="E8">E8</button>
					<button id="E9" value="E9">E9</button>
					<button id="E10" value="E10">E10</button>
				</div>
				<div id="spot6">
					<button id="F1" value="F1">F1</button>
					<button id="F2" value="F2">F2</button>
					<button id="F3" value="F3">F3</button>
					<button id="F4" value="F4">F4</button>
					<button id="F5" value="F5">F5</button>
					<button id="F6" value="F6">F6</button>
					<button id="F7" value="F7">F7</button>
					<button id="F8" value="F8">F8</button>
					<button id="F9" value="F9">F9</button>
					<button id="F10" value="F10">F10</button>
				</div>
				<div id="spot7">
					<button id="G1" value="G1">G1</button>
					<button id="G2" value="G2">G2</button>
					<button id="G3" value="G3">G3</button>
					<button id="G4" value="G4">G4</button>
					<button id="G5" value="G5">G5</button>
					<button id="G6" value="G6">G6</button>
					<button id="G7" value="G7">G7</button>
					<button id="G8" value="G8">G8</button>
					<button id="G9" value="G9">G9</button>
					<button id="G10" value="G10">G10</button>
				</div>
				<div id="spot8">
					<button id="H1" value="H1">H1</button>
					<button id="H2" value="H2">H2</button>
					<button id="H3" value="H3">H3</button>
					<button id="H4" value="H4">H4</button>
					<button id="H5" value="H5">H5</button>
					<button id="H6" value="H6">H6</button>
					<button id="H7" value="H7">H7</button>
					<button id="H8" value="H8">H8</button>
					<button id="H9" value="H9">H9</button>
					<button id="H10" value="H10">H10</button>
				</div>
				<div id="spot9">
					<button id="I1" value="I1">I1</button>
					<button id="I2" value="I2">I2</button>
					<button id="I3" value="I3">I3</button>
					<button id="I4" value="I4">I4</button>
					<button id="I5" value="I5">I5</button>
					<button id="I6" value="I6">I6</button>
					<button id="I7" value="I7">I7</button>
					<button id="I8" value="I8">I8</button>
					<button id="I9" value="I9">I9</button>
					<button id="I10" value="I10">I10</button>
				</div>
				<div id="spot10">
					<button id="J1" value="J1">J1</button>
					<button id="J2" value="J2">J2</button>
					<button id="J3" value="J3">J3</button>
					<button id="J4" value="J4">J4</button>
					<button id="J5" value="J5">J5</button>
					<button id="J6" value="J6">J6</button>
					<button id="J7" value="J7">J7</button>
					<button id="J8" value="J8">J8</button>
					<button id="J9" value="J9">J9</button>
					<button id="J10" value="J10">J10</button>
				</div>
			</div>
			<div id="description">
				■ 선택불가<br> □ 선택가능<br> <span class="redtext">■</span> 선택불가<br>
			</div>
			<div id="info">
				<label>선택한 날짜 <input value="****-**-**" class="redtext only"
					id="selectdate" name="selectdate" type="text" readonly="readonly">
				</label><br> <label>선택한 자리 <input value="**"
					class="redtext only" id="selectspot" name="selectspot" type="text"
					readonly="readonly"> 석
				</label><br> <label>가격 <input value="0" class="redtext only"
					id="selectmoney" name="selectmoney" type="text" readonly="readonly">
					원
				</label>
			</div>
		</div>
	</section>
</body>
</html>