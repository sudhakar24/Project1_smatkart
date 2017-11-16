<%@ page language="java" contentType="text/html"
	import="com.model.Product"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE>
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
<title>Product Details</title>
<style>
 h1 {
    margin-top: 0px !important;
    margin-bottom: 0px !important;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<h1 align="center" style="background-color:#E0E0E0;">Product List</h1>
	<div id="continer" style="width: 100%; float: left; margin: auto;margin-bottom:10%;">
		<c:forEach items="${productList}" var="product">
			<div id="box1" style="width: 50%; height: 400px; float: left;background-color:#FAFAFA">
				<div id="innerbox1" style="margin-left: 30%; margin-top: 100px;background-color:#FAFAFA">
					<img src="<c:url value="/resources/${product.productId}.jpg"/>"
						height=300px; />
				</div>
			</div>
			<div id="box2" style="width: 50%; height: 400px; float: left;background-color:#FAFAFA">
				<table style="width: 90%; margin-top: 200px;">
					<thead class="blue-grey lighten-5">
						<tr bgcolor="black">
							<td style="color: white;">Product Id</td>
							<td style="color: white;">Product Name</td>
							<td style="color: white;">Category</td>
							<td style="color: white;">Supplier</td>
							<td style="color: white;">Price</td>
							<td style="color: white;">View Details</td>
							<br>
						</tr>
					</thead>
					<td style="padding-top: 10px;">${product.productId}</td>
					<td style="padding-top: 10px;">${product.productName}</td>
					<td style="padding-top: 10px;">${product.catname}</td>
					<td style="padding-top: 10px;">${product.supplierName}</td>

					<td style="padding-top: 10px;"><i class="fa fa-inr" aria-hidden="true"></i>${product.price}</td>


					<td style="padding-top: 10px;">
					<c:if test="${pageContext.request.userPrincipal.name!=null}">
					<security:authorize access="hasRole('ROLE_USER')">
					<a style="padding-left: 10px;class="btn btn-success
						btn-outline" href="<c:url value="../user/customerproductdetails/${product.productId}"/>"><i class="fa fa-eye" aria-hidden="true" style="color:black;" ></i></a></td>
					</security:authorize>
					</c:if>
					<c:if test="${pageContext.request.userPrincipal.name==null}">
					
					<a style="padding-left: 10px;class="btn btn-success
						btn-outline" href="<c:url value="./customerproductdetails/${product.productId}"/>"><i class="fa fa-eye" aria-hidden="true" style="color:black;" ></i></a></td>
					</c:if>
				</table>
			</div>


		</c:forEach>
	</div>

</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>