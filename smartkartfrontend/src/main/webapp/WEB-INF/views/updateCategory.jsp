 <%@ page language="java" contentType="text/html" import="com.model.Category"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE> 
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Smartkart</title>
<style>
.btn {
	border-radius: 100px !important;
	border: 6px solid transparent !important;
}

.btn-default {
    color: #090909 !important;
    background-color: #bebebe !important;
    border-color: #ccc !important;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>

<body>
<div id="container" style=width:100%;float:left;margin-top:50px;margin-bottom:50px; align="center" >

<form:form action="${pageContext.request.contextPath}/admin/UpdateCategory" modelAttribute="category" method="post">
<table  class="table" style=width:30%;margin:auto;>

	<tr>
		<h1 align="center">Category Update Module</h1>
	</tr>
	<tr>
		<td>Category ID</td>
		<td><form:input class="form-control"  path="catId"/></td>
	</tr>
	<tr>
		<td>Category Name</td>
		<td><form:input class="form-control" path="catName"/></td>
	</tr>
	
		<tr>
		<td>
			<button style="width:100px;margin-left:60px;"  class="btn btn-success btn-outline" type="submit" class="submitbtn">Update</button>
		</td>
		<td>
			<button style="width:50%;" class="btn btn-default btn-outline" type="reset" class="erasebtn">Erase</button>
	</td>
	</tr>

</table>
</form:form>
</div>
 <table class="table" style=width:50%;margin:auto;>


    
    <thead class="blue-grey lighten-5"><tr bgcolor="black">
	<td style=color:white;>Category Id</td>
	<td style=color:white;>Category Name</td>
	
	
</tr> 
</thead>
<c:forEach items="${categoryList}" var="category">
	<tr bgcolor="#EEEEEE">
	<td>${category.catId}</td>
	<td>${category.catName}</td>
	
	</tr>

</c:forEach>
</table>
 <div  style=width:100%;height:2px;margin-top:150px;background:black;></div>
 
</body>
<jsp:include page="footer.jsp"></jsp:include>

</html>