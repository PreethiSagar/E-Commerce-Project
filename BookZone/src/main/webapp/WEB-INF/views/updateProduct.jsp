<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">
	<form:form action="${pageContext.request.contextPath}/UpdateProduct" modelAttribute="product" method="post" enctype="multipart/form-data">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12"></div>
			<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 updateFormStyle">
				<div class="clear spaces10"></div>
				<b class="formTitle" align="center">Update Product</b>
				<div class="clear spaces10"></div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
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
					<div class="form-group">
						<label>Product Stock:</label>
						<form:input path="stock" class="form-control" placeholder="Product Stock" />
					</div>
					<div class="form-group">
						<label>Product Image:</label>
						<form:input type="file" path="pimage" />
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
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
					<div class="form-group">
						<label>Product Description:</label>
						<form:textarea path="productDesc" rows="7" class="form-control" placeholder="Product Description" />
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
					<div class="form-group">	
						<input type="submit" value="Update Product" class="btn btn-primary" />
					</div>
				</div>
				<div class="clear spaces5"></div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12"></div>
		</div>
	</form:form>
	<div class="clear spaces10"></div>
</div>
<div class="clear spaces10"></div>
<jsp:include page="footer.jsp"></jsp:include>