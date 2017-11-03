<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<div class="clear spaces10"></div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 container containerMinHeight">
	<div class="clear spaces10"></div>
	<form action="${pageContext.request.contextPath}/AddCart" method="post">
	<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
		<img src="${pageContext.request.contextPath}/resources/images/products/${product.getProductId()}.jpg" class="productDetailImg detailBorderDtyle center-block" alt="">
	</div>
	<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12 spacingWidth"></div>
	<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12" align="left">
		<span>${product.getProductName()}</span>
		</br>		
		<span>${product.getProductDesc()}</span>
		</br>		
		<span>${product.getPrice()}</span>
		</br>
		<span>${category.getCatName()}</span>
		</br>
		<span>${supplier.getSupplierName()}</span>
		</br>
		<c:if test="${sessionScope.roleName == 'user'}">
			<input type="hidden" name="cartProductId" value="${product.getProductId()}" />
			<input type="hidden" name="cartUserId" value="${sessionScope.userId}" />
			<div class="form-group">
				<input name="cartQuantity" class="form-control" placeholder="Quantity" />
			</div>
			<div class="form-group" align="center">	
					<input type="submit" value="Add to Cart" class="btn btn-primary" />
			</div>
		</c:if>
	</div>
	</form>
	<div class="clear spaces10"></div>
</div>
<div class="clear spaces10"></div>
<jsp:include page="footer.jsp"></jsp:include>