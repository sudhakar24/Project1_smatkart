<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">
	
</script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/validation.js"></script>
<style>
.navbar-default {
	background-color: white !important;
	margin-bottom: 0px !important;
	color: black !important;
}

/* .navbar-default {
	background-color:transparent !important;
	
	background-image:url(http://www.romanpichler.com/wp-content/uploads/2016/03/Beautiful-Wallpapers-14.jpg) !important;
	box-shadow:none;	
}
 */
.navbar-toggle {
	margin: 5px !important;
	background: black !important;
	color: #FFF !important;
}

.navbar-nav {
	margin: 5px !important;
}

.navbar-default .navbar-nav>li>a {
	color: #171717 !important;
	padding-top: 20px !important;
	padding-bottom: 20px !important;
	padding-left: 5px !important;
	text-decoration: underline !important;
	font-size: 20px !important;
}

.dropbtn {
	background-color: black;
	color: white;
	margin: 5px;
	padding-top: 20px;
	padding-bottom: 20px;
	font-size: 12px;
	border: none;
	cursor: pointer;
	padding-top: 20px;
}

.dropbtnn {
	background-color: white;
	color: black;
	margin: 5px;
	font-size: 20px;
	border: none;
	cursor: pointer;
	padding-top: 10px;
	padding-bottom: 10px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: black;
}
</style>
</head>
<body>
	<nav id="navbar-red" class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-nav">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</ul>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-nav">
		<ul class="nav navbar-nav navbar-left">
			<li><a href="${pageContext.request.contextPath}/index"><img
					src="${pageContext.request.contextPath}/resources/logo.JPG"
					style="width: 100px; height: 40px; margin-top: 0px;"></img></a></li>
			<li><a href="${pageContext.request.contextPath}/index"><i
					class="fa fa-home" aria-hidden="true"></i>Home</a></li>



		</ul>


		<c:if test="${pageContext.request.userPrincipal.name==null}">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="${pageContext.request.contextPath}/prolist"><i
						class="fa fa-list-alt" aria-hidden="true"></i>All Product</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/goToLogin"><i
						class="fa fa-sign-in" aria-hidden="true"></i> Log In</a></li>
				<li><a href="${pageContext.request.contextPath}/register"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>

			</ul>
		</c:if>

		<c:if test="${pageContext.request.userPrincipal.name!=null}">
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<ul class="nav navbar-nav navbar-left">
					<div class="dropdown">
						<button class="dropbtnn">
							<i class="fa fa-bars" aria-hidden="true"></i> Admin Control
							<div class="dropdown-content">
								<a href="${pageContext.request.contextPath}/admin/category"><i
									class="fa fa-list" aria-hidden="true"></i> Category</a> <a
									href="${pageContext.request.contextPath}/admin/supplier"><i
									class="fa fa-users" aria-hidden="true"></i> Supplier </a> <a
									href="${pageContext.request.contextPath}/admin/product"><i
									class="fa fa-product-hunt" aria-hidden="true"></i> Product </a> <a
									href="${pageContext.request.contextPath}/admin/productDetails"><i
									class="fa fa-list" aria-hidden="true"></i> Product List</a>
							</div>
						</button>
					</div>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<div class="dropdown">
						<button class="dropbtn">Welcome:${pageContext.request.userPrincipal.name}</button>
						<div class="dropdown-content">

							<a href="${pageContext.request.contextPath}/logout"><i
								class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
						</div>
					</div>
				</ul>
			</security:authorize>

			<security:authorize access="hasRole('ROLE_USER')">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="${pageContext.request.contextPath}/user/prolist"><i
							class="fa fa-list-alt" aria-hidden="true"></i>All Product</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<div class="dropdown">
						<button class="dropbtn">Welcome:${pageContext.request.userPrincipal.name}</button>
						<div class="dropdown-content">
							<a href="${pageContext.request.contextPath}/user/goToCart"><i
								class="fa fa-cart-plus" aria-hidden="true"> My Cart </i> </a> <a
								href="${pageContext.request.contextPath}/user/goToOrders"><i
								class="fa fa-cart-plus" aria-hidden="true"> My Orders </i> </a> <a
								href="${pageContext.request.contextPath}/logout"><i
								class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
						</div>
					</div>
				</ul>


			</security:authorize>
		</c:if>

	</div>
	</nav>