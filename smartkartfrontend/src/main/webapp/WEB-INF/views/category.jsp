
<jsp:include page="header.jsp"></jsp:include>

<%@ page language="java" contentType="text/html" import="com.model.Category"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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


<div id="container" style=width:100%;float:left;margin-top:50px;margin-bottom:50px; align="center" >

<form action="${pageContext.request.contextPath}/admin/AddCategory" id="categoryForm" method="post">
<table  class="table" style=width:30%;margin:auto;>

	
	<tr>
		<h1 align="center">Category Module</h1>
	</tr>
	
	<tr>
		<td>Category ID</td>
		<td><input class="form-control"name="catId"/></td>
	</tr>
	
	<tr>
		<td>Category Name</td>
		<td><input class="form-control" type="text" name="catName"/></td>
	</tr>

	
	<tr style="width:100%;">
		<td>
			<button style="width:100px;margin-left:60px;" class="btn btn-success btn-outline" type="submit" class="submitbtn">Insert</button>
		</td>
		<td>
			<button style="width:50%;" class="btn btn-default btn-outline" type="reset" class="erasebtn">Erase</button>
	</td>
	</tr>

</table>

</form>
</div>
<table class="table" style=width:50%;margin:auto;>

    
    <thead class="blue-grey lighten-5"><tr bgcolor="black">
	<td style=color:white;>Category Id</td>
	<td style=color:white;>Category Name</td>
	
	<td style=color:white;>Operation</td>
</tr> 
</thead>
<c:forEach items="${categoryList}" var="category">
	<tr bgcolor="#EEEEEE">
	<td>${category.catId}</td>
	<td>${category.catName}</td>
	
	<td>
	
	
	<a style=padding-left:10px; href="<c:url value="/admin/updateCategory/${category.catId}"/>"><i class="glyphicon glyphicon-edit" style="color:green";></i></a>
	<a style=padding-left:25px; href="<c:url value="/admin/deleteCategory/${category.catId}"/>"><i class="glyphicon glyphicon-trash" style="color:red";></i></a>
	</td>
	</tr>

</c:forEach>
</table>

 
  <div  style=width:100%;height:2px;margin-top:150px;background:black;></div>

<jsp:include page="footer.jsp"></jsp:include>
 