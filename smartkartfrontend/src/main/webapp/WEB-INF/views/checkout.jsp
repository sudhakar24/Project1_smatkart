 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checkout</title></head>
<style>
.btn {
	border-radius: 100px !important;
	border: 6px solid transparent !important;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>

<div class="container" style="margin-bottom:10%;">
<div class="row">
	<div class="col-sm-9 jumbotron">
	<div class="head">
	<h2><p class="myText">Customer Shipping Details</p></h2>
	</div>
	
	<div class="outer">
	<div class="well" style="width:100%">
	<form action="${pageContext.request.contextPath}/user/invoice" method="post">
	
	 <c:set var="gtot" value="0"></c:set>
	 
	 
	 <c:forEach var="c" items="${userCartList}">
	<c:set var="gtot" value="${gtot + (c.cartPrice * c.cartQuantity)}">
	</c:set>
	</c:forEach>
	
	<div class="well">
	<table>
	<tr>
	<td colspan="3"><b>Name:</b></td>
	<td>${user.getFirstname()}</td>
	</tr>
	
	<tr>
	<td colspan="3"><b>Email:</b></td>
	<td>${user.getEmail()}</td>
	</tr>
	
	<tr>
	<td colspan="3"><b>Customer Address:</b></td>
	<td>${user.getAddress()}</td>
	</tr>
	
	
	<tr>
	<td colspan="3"><b>Total amount payable:</b></td>
	<td><i class="fa fa-inr" aria-hidden="true"> ${gtot}</td>
	</tr>
	
	</table>
	
	</div>
	
	<br><br> <hr>
	
	<div style="margin-top:15px">
	
	<h3><strong>Enter Card Details</strong></h3>
	
	</div>
	
	<input type="hidden" name="total" value="${gtot}">
	<br>
	<h4>Payment method</h4>
	<select name="payment">
	
	<option value="NB">Net Banking</option>
	<option value="DrCr">Debit or Credit Card</option>
	</select>
	
	<br><br>
	<h4>Card Number</h4>
	<input type="number" min="10000" max="99999" name="cardnum" placeholder="Enter card number" style="width:20%"; required>
	<input type="text" name="cardname" placeholder="Enter card holder name" required>
	<br>
	<table>
	<tr>
		<th colspan="2">Expiry Date</th>
		<th>&nbsp;&nbsp;&nbsp;</th>
		<th>CVV</th>
	</tr>
	<br>
	<tr><td colspan="2"><input type="number" min="1" max="12" name="month" placeholder="MM" required></td></tr>
	<tr><td colspan="2"><input type="number" min="00" max="99" name="YY" placeholder="YY" required></td></tr>
	<th>&nbsp;&nbsp;&nbsp;</th>
	<tr><td colspan="2"><input type="password" min="00" max="999" name="CVV" placeholder="Enter PIN" style="width:60%"; required></td></tr>
	
	</table>
	<br>
	<input type="submit" value="PROCEED" class="btn btn-success btn-outline">
	</form>
	
	</div>
	
	
	</div>
</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>