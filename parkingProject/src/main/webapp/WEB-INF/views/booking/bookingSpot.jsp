<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/booking.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 추가 -->
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker({
			minDate : +1D,
			maxDate : "+1M"
		});
	});
</script>
<title>예약날짜/자리 선택</title>
</head>
<body>
	<section>
		<div id="choiceDate">
			<h3>
				1.날짜선택<img src="/resources/img/booking/calendar.png" alt="날짜선택"
					id="deteimg">
			</h3>
		</div>
		<div id="choiceSpot">
			<h3>2. 자리선택</h3>
			<p>
				Date: <input type="text" id="datepicker">
			</p>
		</div>
	</section>
</body>
</html>