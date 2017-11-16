
<%@ page language="java" contentType="text/html" import="com.model.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<style>
.btn {
	border-radius: 100px !important;
	border: 6px solid transparent !important;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>

	<div id="box1" style="width: 50%; float: left;margin-bottom:10%;">
		<table class="table"
			style="width: 80%; margin-top: 100px; margin-left: auto; margin-right: auto;">
			<h1 align="center">Cart</h1>
			<thead class="blue-grey lighten-5">
				<tr bgcolor="black">
					<td style="color: white;">Product Name</td>
					<td style="color: white;">Product Image</td>
					<td style="color: white;">Price</td>

					<td style="color: white;">Action</td>
				</tr>
			</thead>
			<c:if test="${empty userCartList}">
				<tr>
					<td align="center">No Record Exist</td>
				</tr>
			</c:if>
			<c:if test="${!empty userCartList}">
				<c:forEach items="${userCartList}" var="cart">
					<tr bgcolor="#EEEEEE">
						<td>${cart.product.productName}</td>

						<td><img
							src="<c:url value="/resources/${cart.product.productId}.jpg"/>"
							width=100px;height=100px; /></td>
						<td><i class="fa fa-inr" aria-hidden="true"></i>
							${cart.cartPrice}</td>

						<td><a style="padding-left: 25px; color: red;"
							href="<c:url value="/user/deleteCart/${cart.cartId}"/>"><i
								class="glyphicon glyphicon-trash"></i></a></td>


					</tr>
				</c:forEach>
			</c:if>


		</table>
	</div>
	<h1>Price Details</h1>
	<div id="box2"
		style="width: 50%; float: left; padding-top: 100px; padding-right: 20px; padding-left: 50px;">

		<c:if test="${empty userCartList}">
			<tr>
				<td align="center">No Record Exist</td>
			</tr>
		</c:if>
		<c:if test="${!empty userCartList}">
			<c:forEach items="${userCartList}" var="cart">

				<h3 style="width: 30%; float: left;">Quantity</h3>
				<h3 style="width: 50%; float: left;">${cart.cartQuantity}</h3>
				<h3 style="width: 30%; float: left;">Total amount</h3>


				<h3 style="width: 50%; float: left;">
					<i class="fa fa-inr" aria-hidden="true"></i>${cart.cartQuantity * cart.cartPrice}</h3>
				<c:set var="grandtotal"
					value="${grandtotal + (cart.cartPrice * cart.cartQuantity)}"></c:set>
				<div
					style="width: 100%; height: 1px; margin-top: 120px; margin-bottom: 10px; background: black;"></div>
			</c:forEach>
		</c:if>
	</div>

	<h3 style="width: 15%; padding-left: 50px; float: left;">
		<label>Grand Total=</label>
	</h3>
	<h3 style="width: 10%; float: left; padding-left: 30px;">
		<i class="fa fa-inr" aria-hidden="true"></i>
		<c:out value="${grandtotal}"></c:out>
	</h3>


	<c:if test="${!empty userCartList}">
		<td><a href="${pageContext.request.contextPath}/user/checkout"
			class="btn btn-success btn-outline">Checkout</a></td>
	</c:if>
	<td><a href="${pageContext.request.contextPath}/user/int"
		class="btn btn-warning">Continue Shopping</a></td>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
