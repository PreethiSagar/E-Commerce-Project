<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	
		<c:forEach items="${productList}" var="product">
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="view overlay hm-orange-light">
    			<a href="${pageContext.request.contextPath}/viewProduct/${product.productId}">
    				<img src="${pageContext.request.contextPath}/resources/images/products/${product.productId}.jpg" class="center-block productImageStyle" alt="">
    			</a>
    			<div class="mask flex-center">
        			<p class="white-text"></p>
    			</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 spaces10 bottom20" align="center">
				<a href="${pageContext.request.contextPath}/viewProduct/${product.productId}">
					<span class="bookHeadContentStyle">${product.productName}</span>
				</a>
				</br>
				<span class="bookContentStyle">&#8377;${product.price}</span>
			</div>
			<div class="clear spaces20"></div>
		</div>
		</c:forEach>
		
	</div>
</div>
<div class="clear spaces10"></div>
<jsp:include page="footer.jsp"></jsp:include>