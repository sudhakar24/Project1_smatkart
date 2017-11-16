
<%@ page language="java" contentType="text/html"
	import="com.model.Product"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<title>Product Details</title>
<style>
h1 {
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}
</style>
</head>

<jsp:include page="header.jsp"></jsp:include>

<h1 align="center" style="background-color: #E0E0E0;">Product
	Details</h1>
<div id="box" style="width: 100%; margin-bottom: 10%;">
	<div id="innerbox1"
		style="width: 50%; height: 100%; float: left; padding-left: 10%; padding-top: 100px; background-color: #FAFAFA">
		<img src="<c:url value="/resources/${product.productId}.jpg"/>"
			width=400px; height=400px; />
	</div>
	<div id="innerbox2"
		style="width: 50%; height: 100%; float: left; padding-top: 80px; padding-right: 10%; background-color: #FAFAFA">

		<h2 style="color: #3F51B5;">${product.productName}</h2>
		<h5>Category-${product.catname}</h5>

		<h5>Supplier-${product.supplierName}</h5>

		<h3 style="color: brown;">
			<i class="fa fa-inr" aria-hidden="true"></i>${product.price}</h3>
		<h3>${product.productDes}</h3>

		<form action="${pageContext.request.contextPath}/user/addToCart" id="cartvalidator"
			method="post">
			<input type="hidden" value="${product.productId}"
				name="cartProductId" /> <input type="number" style="width: 30%;"
				class="form-control" name="quant" required /><br> <i
				class="fa fa-shopping-cart" aria-hidden="true" style="color: green;"></i>
			<input style="width: 20%;" class="btn btn-success btn-outline"
				type="submit" value="Add to cart">

		</form>


	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
