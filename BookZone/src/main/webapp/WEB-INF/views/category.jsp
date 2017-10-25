<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">
	<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12"></div>
	<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
		<div class="panel with-nav-tabs panel-default">
			<div class="panel-heading">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab1category" data-toggle="tab">Add Category</a></li>
					<li><a href="#tab2category" data-toggle="tab">List Category</a></li>
				</ul>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab1category">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<form:form action="${pageContext.request.contextPath}/AddCategory" modelAttribute="category">
								<div class="clear spaces10"></div>
								<div class="form-group" align="center">
									<b class="formTitle">Add Category</b>
								</div>
								<div class="clear spaces10"></div>
								<div class="form-group">
									<label>Category Id:</label>
									<form:input path="catId" class="form-control" placeholder="Category Id" />
								</div>
								<div class="form-group">
									<label>Category Name:</label>
									<form:input path="catName" class="form-control" placeholder="Category Name" />
								</div>
								<div class="form-group">
									<label>Category Description:</label>
									<form:textarea path="catDesc" rows="3" class="form-control" placeholder="Category Description" />
								</div>
								<div class="form-group" align="center">	
									<input type="submit" value="Add Category" class="btn btn-primary" />
								</div>
								<div class="clear spaces10"></div>
							</form:form>
						</div>
					</div>
					<div class="tab-pane fade" id="tab2category">
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
											<a href="${pageContext.request.contextPath}/updateCategory/${category.catId}">
												<img src="${pageContext.request.contextPath}/resources/images/editIcon.png" class="iconStyle" />
											</a>
											&nbsp;&nbsp;&nbsp;
											<a href="${pageContext.request.contextPath}/deleteCategory/${category.catId}">
												<img src="${pageContext.request.contextPath}/resources/images/deleteIcon.png" class="iconStyle" />
											</a>
											&nbsp;&nbsp;&nbsp;
											<a href="${pageContext.request.contextPath}/viewCategory/${category.catId}">
												<img src="${pageContext.request.contextPath}/resources/images/viewIcon.png" class="iconStyle" />
											</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12"></div>
</div>
<div class="clear spaces10"></div>
<jsp:include page="footer.jsp"></jsp:include>