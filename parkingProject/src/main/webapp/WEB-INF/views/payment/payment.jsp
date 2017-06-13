<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/payment.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
   $(function() {
      var name = /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //사용자 이름
      var cardNumber = /[^0-9]/; //카드 숫자
      var validDateM = /[^0-9]/; //유효기간 -월
      var validDateY = /[^0-9]/; //유효기간 -년
      var cvcNumber = /[^0-9]/; //cvc
      // 이름 입력
      $("#paymentName").focusout(function() {

         var val = $(this).val();

         if (name.test(val)) {

            alert("한글 이름을 입력하시오.");

         }

      });
      //  카드 번호
      $("#cardNumber1").focusout(function() {
         var val = $(this).val();
         if (cardNumber.test(val)) {
            alert("정확한 카드숫자를 입력하시오.");
         }

      });
      $("#cardNumber2").focusout(function() {

         var val = $(this).val();
         if (cardNumber.test(val)) {
            alert("정확한 카드숫자를 입력하시오.");
         }

      });
      $("#cardNumber3").focusout(function() {

         var val = $(this).val();
         if (cardNumber.test(val)) {
            alert("정확한 카드숫자를 입력하시오.");
         }

      });
      $("#cardNumber4").focusout(function() {

         var val = $(this).val();
         if (cardNumber.test(val)) {
            alert("정확한 카드숫자를 입력하시오.");
         }

      });

      // 유효기간 
      $("#month").focusout(function() {

         var val = $(this).val();
         if (validDateM.test(val)) {
            alert("정확한 달을 입력하시오.");
         }

      });

      $("#years").focusout(function() {

         var val = $(this).val();
         if (validDateY.test(val)) {
            alert(" 정확한 연도를 입력하시오.");
         }

      });
      // cvc 
      $("#cvc").focusout(function() {

         var val = $(this).val();
         if (cvcNumber.test(val)) {
            alert("정확한 cvc 숫자를 입력하시오.");
         }

      });

   });//$(function() 종료 ㅋ
</script>
<script type="text/javascript">
   $(function() {
      $("#cancleButton").click(function() {
         location.href = "/booking/bookingCheckAgain.do";
      });

   });
</script>
</head>
<body>

<form action="paymentComplete.do" method="get">
<table>
<tr>
<td>
<label>카드사<select id=cardCompany name="cardCompany">
							<option value="gookminBank" label="국민은행"></option>
							<option value="sinhanBank" label="신한은행"></option>
							<option value="ooriBank" label="우리은행"></option>
							<option value="giupBank" label="기업은행"></option>
							<option value="nonghyubBank" label="농협은행"></option>
							<option value="soohyubBank" label="수협은행"></option>
							<option value="seamaeulBank" label="새마을은행"></option>
							<option value="oneBank" label="하나은행"></option>
							<option value="matherBank" label="엄마은행"></option>
					</select></label>

</td>
</tr>

<tr>
<td>
         <label for="paymentName">이름  <input
						name="paymentName" id="paymentName" type="text"
						required="required"></label>
</td>
</tr>

<tr>
<td>
              
					<label for="cardNum1">카드 번호 <input id="cardNum1"
						name="cardNum1" type="text" size="4" maxlength="4" min="4"
						required="required">- <input id="cardNum2" name="cardNum2"
						type="text" size="4" maxlength="4" min="4" required="required">-
						<input id="cardNum3" name="cardNum3" type="password" size="4"
						maxlength="4" min="4" required="required">- <input
						id="cardNum4" name="cardNum4" type="password" size="4"
						maxlength="4" min="4" required="required"></label>

</td>
</tr>

<tr>
<td>
            <label for="cardValid1">유효기간(월/년) <input
						id="cardValid1" name="cardValid1" type="text" maxlength="2"
						min="2" required="required"> / <input id="cardValid2"
						name="cardValid2" type="text" maxlength="2" min="2"
						required="required"></label>

</td>
</tr>

<tr>
<td>
        <label for="cardCvc">cvc번호 <input id="cardCvc"
						name="cardCvc" type="text" min="3" maxlength="3"
						required="required"></label>

</td>
</tr>

<tr>
<td>

              <label>카드 결제 이용약관</label> <br /> <textarea rows="10"
							cols="20"></textarea> <br /> 	
						
							<label>약관에 동의</label><input value="1"
						id="paymentPolicy" name="paymentPolicy" type="checkbox"
						required="required">

</td>
</tr>

<tr>
<td>
<button type="submit">결제</button>
<button id="cancleButton" >취소</button>
</td>
</tr>
</table>
 <%-- <input type="hidden" id="paymentNum" name="paymentNum" value="${paymentNum}"> --%>
 
</form>

</body>
</html>