<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<img src="${pageContext.request.contextPath}/resources/images/banner1.png" class="img-rounded img-responsive bannerImgStyle" />
	</div>
	<div class="clear spaces10"></div>
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		<img src="${pageContext.request.contextPath}/resources/images/add1.jpg" class="img-rounded img-responsive addImgStyle" />
	</div>
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 loginContent">
		<form:form action="${pageContext.request.contextPath}/login" modelAttribute="user">
			<div class="clear spaces20"></div>
			<div class="form-group" align="center">
				<b class="formTitle">Login</b>
			</div>
			<div class="clear spaces20"></div>
			<div class="form-group">
				<label>Your Username:</label>
				<form:input path="username" class="form-control" placeholder="Your Username" />
			</div>
			<div class="clear spaces20"></div>
			<div class="form-group">
				<label>Password:</label>
				<form:input type="password" path="password" class="form-control" minlength="5" placeholder="Atleast 5 Characters" />
			</div>
			<div class="clear spaces20"></div>
			<div class="form-group" align="center">	
				<input type="submit" value="Login" class="btn btn-primary" />
			</div>
			<div class="clear spaces20"></div>
		</form:form>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		<img src="${pageContext.request.contextPath}/resources/images/add2.jpg" class="img-rounded img-responsive addImgStyle" />
	</div>
	<div class="clear spaces10"></div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<img src="${pageContext.request.contextPath}/resources/images/banner2.jpg" class="img-rounded img-responsive bannerImgStyle" />
	</div>

</div>

<div class="clear spaces10"></div>
<jsp:include page="footer.jsp"></jsp:include>