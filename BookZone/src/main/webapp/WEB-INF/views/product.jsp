<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%! String baseUrl="http://localhost:8080/BookZone/resources/";%>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 addProductForm">
		<form:form action="AddProduct" modelAttribute="product" enctype="multipart/form-data">
			<div class="clear spaces10"></div>
				<b class="formTitle">Add Product</b>
			<div class="clear spaces10"></div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="form-group">
				    <label>Product Id:</label>
					<form:input path="productId" class="form-control" placeholder="Product Id" />
				</div>
				<div class="form-group">
				    <label>Product Name:</label>
					<form:input path="productName" class="form-control" placeholder="Product Name" />
				</div>
				<div class="form-group">
				    <label>Product Price:</label>
					<form:input path="price" class="form-control" placeholder="Product Price" />
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="form-group">
				    <label>Product Stock:</label>
					<form:input path="stock" class="form-control" placeholder="Product Stock" />
				</div>
				<div class="form-group">
				    <label>Category Id:</label>
					<form:select path="catId" class="form-control">
						<form:option value="0" label="----- Select Category -----"></form:option>
						<form:options items="${categoryList}"/>
					</form:select>
				</div>
				<div class="form-group">
				    <label>Supplier Id:</label>
					<form:select path="supplierId" class="form-control">
						<form:option value="0" label="----- Select Supplier -----"></form:option>
						<form:options items="${supplierList}"/>
					</form:select>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="form-group">
				    <label>Product Description:</label>
					<form:textarea path="productDesc" rows="5" class="form-control" placeholder="Product Description" />
				</div>
				<div class="form-group">
				    <label>Product Image:</label>
					<form:input type="file" path="pimage" />
				</div>
				<div class="form-group">	
				    <input type="submit" value="Add Product" class="btn btn-primary" />
				</div>
			</div>
			<div class="clear spaces5"></div>
		</form:form>
		<hr>
	</div>
	<div class="clear spaces5"></div>
	
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
		<input type="button" class="btn btn-primary" value="Add Product" />
	</div>
	<div class="clear spaces10"></div>
	
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-responsive">
		<table class="table table-hover" align="center">
			<tr class="tableHead">
				<th>Product Id</th>
				<th>Product Name</th>
				<th>Price</th>
				<th>Stock</th>
				<th>Operation</th>
			</tr>
			<c:forEach items="${productList}" var="product">
				<tr class="tableContent">
					<td>${product.productId}</td>
					<td>${product.productName}</td>
					<td>${product.price}</td>
					<td>${product.stock}</td>
					<td>
						<a href="<c:url value="updateProduct/${product.productId}"/>">
							<img src="<%= baseUrl%>images/editIcon.png" class="iconStyle" />
						</a>
						&nbsp;&nbsp;&nbsp;
						<a href="<c:url value="deleteProduct/${product.productId}"/>">
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