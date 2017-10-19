<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%! String baseUrl="http://localhost:8080/BookZone/resources/";%>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 addCategoryForm">
		<form:form action="AddCategory" modelAttribute="category">
			<div class="clear spaces10"></div>
				<b class="formTitle">Add Category</b>
			<div class="clear spaces10"></div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
				<div class="form-group">
				    <label>Category Id:</label>
					<form:input path="catId" class="form-control" placeholder="Category Id" />
				</div>
				<div class="form-group">
				    <label>Category Name:</label>
					<form:input path="catName" class="form-control" placeholder="Category Name" />
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
				<div class="form-group">
				    <label>Category Description:</label>
					<form:textarea path="catDesc" class="form-control" placeholder="Category Description" />
				</div>
				<div class="form-group formButtonTop">	
				    <input type="submit" value="Add Category" class="btn btn-primary" />
				</div>
			</div>
			<div class="clear spaces10"></div>
		</form:form>
		<hr>
	</div>
	<div class="clear spaces5"></div>

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
		<input type="button" class="btn btn-primary" value="Add Category" />
	</div>
	<div class="clear spaces5"></div>

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-responsive">
		<table class="table table-hover" align="center">
			<tr class="tableHead">
				<th>Category Id</th>
				<th>Category Name</th>
				<th>Category Description</th>
				<th>Operation</th>
			</tr>
			<c:forEach items="${categoryList}" var="category">
				<tr class="tableContent">
					<td>${category.catId }</td>
					<td>${category.catName }</td>
					<td>${category.catDesc }</td>
					<td>
						<a href="<c:url value="updateCategory/${category.catId}"/>">
							<img src="<%= baseUrl%>images/editIcon.png" class="iconStyle" />
						</a>
						&nbsp;&nbsp;&nbsp;
						<a href="<c:url value="deleteCategory/${category.catId}"/>">
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