<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/booking.css" type="text/css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- jQuery UI CSS파일  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!-- jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
					id="deteimg" height="25px" width="25px">
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