 <jsp:include page="header.jsp"></jsp:include>
 <%@ page language="java" contentType="text/html" import="com.model.Product"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<title>Product Smartkart</title>
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

<form:form action="${pageContext.request.contextPath}/admin/InsertProduct" id="productForm" modelAttribute="product" enctype="multipart/form-data" method="post">
<table  class="table" style=width:30%;margin:auto;>
	<tr>
		<h1 align="center">Product Module</h1>
	</tr>
	<tr> 
		<td>Product ID</td>
		<td><form:input class="form-control" path="productId"/></td> 
	</tr>
	<tr> 
		<td>Product Name</td>
		<td><form:input class="form-control" path="productName"/></td>
	</tr>
	<tr>
		<td>Product Description</td>
		<td><form:textarea class="form-control" style="height:150px;"  path="productDes"/></td>
	</tr>
	<tr>
		<td>Product Stock</td>
		<td><form:input class="form-control" path="stock"/></td>
	</tr>
	<tr>
		<td>Product Price</td>
		<td><form:input  class="form-control" path="price"/></td>
	</tr>
	<tr>
		<td>Category</td>
		<td><form:select  class="form-control" path="catname">
		<form:option value="0" label="---Select--"/>
		<form:options items="${categoryList}"/>
		</form:select>
		</td>
	
	</tr>
	
	<tr>
		<td>Supplier</td>
		
		<td><form:select class="form-control" path="supplierName">
		<form:option value="0" label="---select---"/>
		<form:options items="${supplierList}"/>
		</form:select>
		</td>
	</tr>
	<tr>
		<td>Product Image</td>
		<td><form:input class="form-control" type="file" path="pimage"/></td>
	</tr>
	
	<tr style="width:100%;">
		<td>
			<button style="width:100px;margin-left:60px;"  class="btn btn-success btn-outline" type="submit" class="submitbtn">Insert</button>
		</td>
		<td>
			<button style="width:50%;" class="btn btn-default btn-outline" type="reset" class="erasebtn">Erase</button>
	</td>
	</tr>
	
</table>
</form:form>
</div>

<div  style=width:100%;height:2px;margin-top:850px;background:black;></div>


<jsp:include page="footer.jsp"></jsp:include>
