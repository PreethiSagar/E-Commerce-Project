<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
		<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
			<form:form action="${pageContext.request.contextPath}/ContactFormSubmit" modelAttribute="contact">
				<div class="clear spaces10"></div>
				<div class="form-group" align="center">
					<b class="formTitle">Contact Us</b>
				</div>
				<div class="clear spaces10"></div>
				<div class="form-group">
					<label>Contact Name:</label>
					<form:input path="contactName" class="form-control" placeholder="Your Name" />
				</div>
				<div class="form-group">
					<label>Contact Email:</label>
					<form:input path="contactEmail" class="form-control" placeholder="Your Email" />
				</div>
				<div class="form-group">
					<label>Contact Phone:</label>
					<form:input path="contactNumber" class="form-control" placeholder="Your Phone" />
				</div>
				<div class="form-group">
					<label>Query Title:</label>
					<form:input path="queryTitle" class="form-control" placeholder="Your Query Title" />
				</div>
				<div class="form-group">
					<label>Query Message:</label>
					<form:textarea path="queryMessage" rows="3" class="form-control" placeholder="Your Query Message" />
				</div>
				<div class="form-group" align="center">	
					<input type="submit" value="Contact Us" class="btn btn-primary" />
				</div>
				<div class="clear spaces10"></div>
			</form:form>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
	</div>
</div>
<div class="clear spaces10"></div>
<jsp:include page="footer.jsp"></jsp:include>