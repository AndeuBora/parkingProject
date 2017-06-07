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
	});
	//자리클릭이벤트
	function clickSpot() {
		var value = $(this).val();
		alert("자리선택"+value);
		$("#selectspot").val(value);
	}
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
					<div id="A1" onclick="clickSpot()">A1</div>
					<div id="A2" onclick="clickSpot()">A2</div>
					<div id="A3" onclick="clickSpot()">A3</div>
					<div id="A4" onclick="clickSpot()">A4</div>
					<div id="A5" onclick="clickSpot()">A5</div>
					<div id="A6" onclick="clickSpot()">A6</div>
					<div id="A7" onclick="clickSpot()">A7</div>
					<div id="A8" onclick="clickSpot()">A8</div>
					<div id="A9" onclick="clickSpot()">A9</div>
					<div id="A10" onclick="clickSpot()">A10</div>
					<button value="A10" onclick="clickSpot()" id="A10">A10</button>
				</div>
				<div id="spot2">
					<div id="B1">B1</div>
					<div id="B2">B2</div>
					<div id="B3">B3</div>
					<div id="B4">B4</div>
					<div id="B5">B5</div>
					<div id="B6">B6</div>
					<div id="B7">B7</div>
					<div id="B8">B8</div>
					<div id="B9">B9</div>
					<div id="B10">B10</div>
				</div>
				<div id="spot3">
					<div id="C1">C1</div>
					<div id="C2">C2</div>
					<div id="C3">C3</div>
					<div id="C4">C4</div>
					<div id="C5">C5</div>
					<div id="C6">C6</div>
					<div id="C7">C7</div>
					<div id="C8">C8</div>
					<div id="C9">C9</div>
					<div id="C10">C10</div>
				</div>
				<div id="spot4">
					<div id="D1">D1</div>
					<div id="D2">D2</div>
					<div id="D3">D3</div>
					<div id="D4">D4</div>
					<div id="D5">D5</div>
					<div id="D6">D6</div>
					<div id="D7">D7</div>
					<div id="D8">D8</div>
					<div id="D9">D9</div>
					<div id="D10">D10</div>
				</div>
				<div id="spot5">
					<div id="E1">E1</div>
					<div id="E2">E2</div>
					<div id="E3">E3</div>
					<div id="E4">E4</div>
					<div id="E5">E5</div>
					<div id="E6">E6</div>
					<div id="E7">E7</div>
					<div id="E8">E8</div>
					<div id="E9">E9</div>
					<div id="E10">E10</div>
				</div>
				<div id="spot6">
					<div id="F1">F1</div>
					<div id="F2">F2</div>
					<div id="F3">F3</div>
					<div id="F4">F4</div>
					<div id="F5">F5</div>
					<div id="F6">F6</div>
					<div id="F7">F7</div>
					<div id="F8">F8</div>
					<div id="F9">F9</div>
					<div id="F10">F10</div>
				</div>
				<div id="spot7">
					<div id="G1">G1</div>
					<div id="G2">G2</div>
					<div id="G3">G3</div>
					<div id="G4">G4</div>
					<div id="G5">G5</div>
					<div id="G6">G6</div>
					<div id="G7">G7</div>
					<div id="G8">G8</div>
					<div id="G9">G9</div>
					<div id="G10">G10</div>
				</div>
				<div id="spot8">
					<div id="H1">H1</div>
					<div id="H2">H2</div>
					<div id="H3">H3</div>
					<div id="H4">H4</div>
					<div id="H5">H5</div>
					<div id="H6">H6</div>
					<div id="H7">H7</div>
					<div id="H8">H8</div>
					<div id="H9">H9</div>
					<div id="H10">H10</div>
				</div>
				<div id="spot9">
					<div id="I1">I1</div>
					<div id="I2">I2</div>
					<div id="I3">I3</div>
					<div id="I4">I4</div>
					<div id="I5">I5</div>
					<div id="I6">I6</div>
					<div id="I7">I7</div>
					<div id="I8">I8</div>
					<div id="I9">I9</div>
					<div id="I10">I10</div>
				</div>
				<div id="spot10">
					<div id="J1">J1</div>
					<div id="J2">J2</div>
					<div id="J3">J3</div>
					<div id="J4">J4</div>
					<div id="J5">J5</div>
					<div id="J6">J6</div>
					<div id="J7">J7</div>
					<div id="J8">J8</div>
					<div id="J9">J9</div>
					<div id="J10">J10</div>
				</div>
			</div>
			<div id="description">
				■ 선택불가<br> □ 선택가능<br> <span class="redtext">■</span> 선택불가<br>
			</div>
			<div id="info">
				<label>선택한 날짜 <input value="****-**-**" class="redtext"
					id="selectdate" name="selectdate" type="text" readonly="readonly">
				</label> <label>선택한 자리 <input value="**" class="redtext"
					id="selectspot" name="selectspot" type="text" readonly="readonly">
					석
				</label> <label>가격 <input value="0" class="redtext" id="selectmoney"
					name="selectmoney" type="text" readonly="readonly"> 원
				</label>
			</div>
		</div>
	</section>
</body>
</html>