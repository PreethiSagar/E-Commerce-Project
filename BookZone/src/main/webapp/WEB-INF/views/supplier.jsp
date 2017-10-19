<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%! String baseUrl="http://localhost:8080/BookZone/resources/"; %>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 addSupplierForm">
		<form:form action="AddSupplier" modelAttribute="supplier">
			<div class="clear spaces10"></div>
				<b class="formTitle">Add Supplier</b>
			<div class="clear spaces10"></div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
				<div class="form-group">
				    <label>Supplier Id:</label>
					<form:input path="supplierId" class="form-control" placeholder="Supplier Id" />
				</div>
				<div class="form-group">
				    <label>Supplier Name:</label>
					<form:input path="supplierName" class="form-control" placeholder="Supplier Name" />
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
				<div class="form-group">
				    <label>Supplier Address:</label>
					<form:input path="supplierAddress" class="form-control" placeholder="Supplier Address" />
				</div>
				<div class="form-group">
				    <label>Supplier Email:</label>
					<form:input path="supplierEmail" class="form-control" placeholder="Supplier Email" />
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
				<div class="form-group">	
				    <input type="submit" value="Add Supplier" class="btn btn-primary" />
				</div>
			</div>
			<div class="clear spaces5"></div>
		</form:form>
		<hr>
	</div>
	<div class="clear spaces5"></div>
	
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
		<input type="button" class="btn btn-primary" value="Add Supplier" />
	</div>
	<div class="clear spaces10"></div>
	
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-responsive">
		<table class="table table-hover" align="center">
			<tr class="tableHead">
				<th>Supplier Id</th>
				<th>Supplier Name</th>
				<th>Supplier Address</th>
				<th>Supplier Email</th>
				<th>Operation</th>
			</tr>
			<c:forEach items="${supplierList}" var="supplier">
				<tr class="tableContent">
					<td>${supplier.supplierId}</td>
					<td>${supplier.supplierName}</td>
					<td>${supplier.supplierAddress}</td>
					<td>${supplier.supplierEmail}</td>
					<td>
						<a href="<c:url value="updateSupplier/${supplier.supplierId}"/>">
							<img src="<%= baseUrl%>images/editIcon.png" class="iconStyle" />
						</a>
						&nbsp;&nbsp;&nbsp;
						<a href="<c:url value="deleteSupplier/${supplier.supplierId}"/>">
							<img src="<%= baseUrl%>images/deleteIcon.png" class="iconStyle" />
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</div>
<div class="clear spaces10"></div>
<jsp:include page="footer.jsp"></jsp:include>