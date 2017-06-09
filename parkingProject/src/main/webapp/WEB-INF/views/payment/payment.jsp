<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(function(){
 var name=/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //사용자 이름
 var cardNumber =/[^0-9]/; //카드 숫자

 var validDateM = /[^0-12]/;         //유효기간 -월
	var validDateY = /[^18-99]/;   //유효기간 -년
	var cvcNumber = /[^0-9]/; //cvc
	// 이름 입력
	 $("#paymentName").focusout(function(){
		 
	 var val= $(this).val();
	 
	 
	  
	 if(name.test(val)){
	
		 alert("한글 이름을 입력하시오.");
	
	 }
	 
	 });
	 //  카드 번호
	 $("#cardNumber1").focusout(function(){
	
		 var val= $(this).val();
		 if(cardNumber.test(val)){  alert("정확한 카드숫자를 입력하시오.");}
		 
});
	 $("#cardNumber2").focusout(function(){
			
		 var val= $(this).val();
		 if(cardNumber.test(val)){  alert("정확한 카드숫자를 입력하시오.");}
		 
});
	 $("#cardNumber3").focusout(function(){
			
		 var val= $(this).val();
		 if(cardNumber.test(val)){  alert("정확한 카드숫자를 입력하시오.");}
		 
});
	 $("#cardNumber4").focusout(function(){
			
		 var val= $(this).val();
		 if(cardNumber.test(val)){  alert("정확한 카드숫자를 입력하시오.");}
		 
});
	 
	 // 유효기간 
	 $("#month").focusout(function(){
			
		 var val= $(this).val();
		 if(validDateM.test(val)){  alert("정확한 달을 입력하시오.");}
		 
});
	
	 $("#years").focusout(function(){
			
		 var val= $(this).val();
		 if(validDateY.test(val)){  alert(" 정확한 연도를 입력하시오.");}
		 
});
	 // cvc 
	 $("#cvc").focusout(function(){
			
		 var val= $(this).val();
		 if(cvcNumber.test(val)){  alert("정확한 cvc 숫자를 입력하시오.");}
		 
});
	 
	 
});//$(function() 종료 ㅋ


	
</script>
<script type="text/javascript">
$(function(){
$("#cancleButton").click(function() {
	location.href = "/booking/bookingCheckAgain.do";
});

});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="paymentPage">
<form name="form">
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
<label for="paymentName">이름</label> <input name="paymentName" id="paymentName" type="text" required="required">
<br/>
<label for="cardNumber1">카드 번호</label> 
<input id="cardNumber1" type="text" size="4" maxlength="4"  min="4" required="required">-
<input id="cardNumber2" type="text" size="4" maxlength="4"  min="4" required="required">-
<input id="cardNumber3" type="password" size="4" maxlength="4"   min="4" required="required">-
<input id="cardNumber4" type="password" size="4" maxlength="4"  min="4" required="required">
<br/>
<label for="term">유효기간(월/년)</label> <input id="month" type="text" maxlength="2"  min="2" required="required"> / 
<input id="years" type="text" maxlength="2"  min="2" required="required">
<br/>
<label for="cvc">cvc번호</label> <input id="cvc" type="text" min="3"  maxlength="3" required="required">
<br/>
<label>카드 결제 이용약관</label>
<br/>
<textarea rows="10" cols="20"></textarea>
<br/>
<label>약관에 동의</label><input type="checkbox" required="required" >
<br/>
<input type="button" value="결제" id="paymentButton">
<input type="button" value="취소" id="cancleButton">



</form>
</section>
</body>
</html>