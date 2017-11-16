<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Login</title>
<style>
.form-signin {
	max-width: 380px;
	padding: 15px 35px 5px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.5);
}

.form-signin-heading {
	margin-bottom: 30px;
}

.btn {
	border-radius: 100px !important;
	border: 6px solid transparent !important;
}
</style>
<div id=mar
	style="padding-top: 70px; background-image: url(https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/EhSkd2EFgik04s2h7/magical-ocean-waves-video-animation-with-blinking-lights-loop-hd-1080p_4ffc_5vyx__F0000.png) !important; height: 600px;">
	<div class="container">
		<form class="form-signin"
			action="${pageContext.request.contextPath}/check" id="loginForm"
			method="post">
			<h2 class="form-signin-heading">Login</h2>
			<br> <label><b>Email</b></label> <input class="form-control"
				type="text" placeholder="Enter Email Id" name="email"> <br>
			<br> <label><b>Password</b></label> <input class="form-control"
				type="password" placeholder="Enter Password" name="password"
				required> <br> <br>

			<button style="width: 100px; margin-left: 90px;"
				class="btn btn-success btn-outline" type="submit" class="submitbtn">Login</button>
			<div id="inner">
				<h5 style="text-decoration: inherit !important;">
					Not a member? <a href="${pageContext.request.contextPath}/register">Create
						a new Account</a>
				</h5>
			</div>
		</form>

	</div>

</div>


<div
	style="width: 100%; height: 2px; margin-top: 0px; background: black;"></div>

<jsp:include page="footer.jsp"></jsp:include>