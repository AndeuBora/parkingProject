<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(function(){
	$("#okButton").click(function(){
		
		
  location.href="/";
	});
	
});

</script>
</head>

<body>
<section id="paymentComplete">
<form>
      <p> 결제가 완료되었습니다. </p>
<p>상세 내용은<a href="/myInfo/myBookingCancle.do">나의 예약관리</a>에서 확인 하실 수 있습니다.</p>

<input type="button" value="확인" id="okButton">
</form>
</section>
</body>
</html>