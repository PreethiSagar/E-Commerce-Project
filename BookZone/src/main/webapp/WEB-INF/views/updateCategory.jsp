<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%! String baseUrl="http://localhost:8080/BookZone/resources/";%>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">
<form:form action="UpdateCategory" modelAttribute="category" method="post">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 addCategoryForm">
<table>
<tr>
<td colspan="2"><b>Update Category Form</b></td>
</tr>
<tr>
<td>Category Id</td>
<td><form:input path="catId"/></td>
</tr>
<tr>
<td>Category Name</td>
<td><form:input path="catName"/></td>
</tr>
<tr>
<td>Category Desc</td>
<td><form:input path="catDesc"/></td>
</tr>
<tr>
<td colspan="2">
<center><input type="submit" value="Update"/></center>
</td>
</tr>
</table>
</form:form>
</div>
<div class="clear spaces10"></div>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
<input type="button" class="btn btn-primary" value="Add Category" />
</div>
<div class="clear spaces10"></div>

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