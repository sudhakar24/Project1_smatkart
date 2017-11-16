
<jsp:include page="header.jsp"></jsp:include>

<%@ page language="java" contentType="text/html"
	import="com.model.Supplier"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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




<div id="container"
	style="width: 100%; float: left; margin-top: 50px; margin-bottom: 50px;"
	align="center">

	<form action="${pageContext.request.contextPath}/admin/AddSupplier" id="supplierForm"
		method="post">
		<table class="table" style="width: 30%; margin: auto;">
			<tr>
				<h1 align="center">Supplier Module</h1>
			</tr>
			<tr>
				<td>Supplier ID</td>
				<td><input class="form-control" name="supplierId" /></td>
			</tr>
			<tr>
				<td>Supplier Name</td>
				<td><input class="form-control" type="text" name="supplierName" /></td>
			</tr>
			<tr>
				<td>Supplier Description</td>
				<td><textarea class="form-control" type="text"
						name="supplierDes"></textarea></td>
			</tr>
			<tr>
				<td>Supplier Email</td>
				<td><input class="form-control" type="text"
					name="supplierEmail" /></td>

			</tr>
			<tr style="width: 100%;">
				<td>

					<button style="width: 100px; margin-left: 60px;"
						class="btn btn-success btn-outline" type="submit"
						class="submitbtn">Insert</button>
				</td>
				<td>
					<button style="width: 50%;" class="btn btn-default btn-outline"
						type="reset" class="erasebtn">Erase</button>
				</td>
			</tr>

		</table>
	</form>
</div>
<table class="table" style="width: 50%; margin: auto;">


	<thead class="blue-grey lighten-5">
		<tr bgcolor="black">
			<td style="color: white">Supplier Id</td>
			<td style="color: white">Supplier Name</td>
			<td style="color: white">Supplier Description</td>
			<td style="color: white">Supplier Email</td>
			<td style="color: white">operation</td>
		</tr>
	</thead>
	<c:forEach items="${supplierList}" var="supplier">
		<tr bgcolor="#EEEEEE">
			<td>${supplier.supplierId}</td>
			<td>${supplier.supplierName}</td>
			<td>${supplier.supplierDes}</td>
			<td>${supplier.supplierEmail}</td>
			<td><a style="padding-left: 10px;"
				href="<c:url value="/admin/updateSupplier/${supplier.supplierId}"/>"><i
					class="glyphicon glyphicon-edit" style="color: green";></i></a> <a
				style="padding-left: 25px;"
				href="<c:url value="/admin/deleteSupplier/${supplier.supplierId}"/>"><i
					class="glyphicon glyphicon-trash" style="color: red";></i></a></td>
		</tr>

	</c:forEach>
</table>

<div
	style="width: 100%; height: 2px; margin-top: 150px; background: black;"></div>


<jsp:include page="footer.jsp"></jsp:include>
