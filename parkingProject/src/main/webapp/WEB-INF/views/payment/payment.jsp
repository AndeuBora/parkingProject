<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(function(){
	
  
	var nameCheck = /[^가-힣]{2,5}/;
	var userName = $("#paymentName").val();
	
	$("#paymentName").dblclick(function(){
		alert(userName);		
		var userName = $("#paymentName").val();
	});

	   if(nameCheck.test(userName)){
		   
		   
		   alert("한글을 입력 해주세요");
		    
		    $("#paymentName").focus();
		     
		     return false;
	   } 
		
	
			 
		 
		 
		
		
	});
	
	

	




</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form>
<label for="cardType">카드사</label>
<select id="cardType">
<option value="gookminBank" label="국민은행"></option>
<option value="sinhanBank" label="신한은행"></option>
<option value="ooriBank" label="우리은행"></option>
<option value="giupBank" label="기업은행"></option>
<option value="nonghyubBank" label="농협은행"></option>
<option value="soohyubBank" label="수협은행"></option>
<option value="seamaeulBank" label="새마을은행"></option>
<option value="oneBank" label="하나은행"></option>
<option value="matherBank" label="엄마은행"></option>
</select>
<br/>
<label for="paymentName">이름</label> <input name="paymentName" id="paymentName" type="text" >
<br/>
<label for="cardNumber1">카드 번호</label> <input id="cardNumber1" type="text" >-<input id="cardNumber2" type="text" >
-<input id="cardNumber3" type="password" >-<input id="cardNumber4" type="password" >
<br/>
<label for="term">유효기간(월/년)</label> <input id="term" type="text" > / <input type="text">
<br/>
<label for="cvc">cvc번호</label> <input id="cvc" type="text">
<br/>
<label>카드 결제 이용약관</label>
<br/>
<textarea rows="10" cols="20"></textarea>
<br/>
<label>약관에 동의</label><input type="checkbox">
<br/>
<button id="paymentButton">결제</button>
<button id="paymentCancle">취소</button>



</form>
</body>
</html>