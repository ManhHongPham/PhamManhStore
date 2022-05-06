
<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- TagLibs -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>PhamManhStore</title>
<jsp:include page="/WEB-INF/views/user/layout/variables.jsp"></jsp:include>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="user/assets/img/favicon.png">

<!-- all css here -->
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. 
            Please <a href="https://browsehappy.com/">upgrade your browser</a> 
            to improve your experience and security.</p>
        <![endif]-->

	<!-- Header Area Start -->
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<!-- Header Area End -->
	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-dark">
		<div class="container">
			<nav aria-label="breadcrumb">
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="/index">Trang chủ</a></li>
					<li class="breadcrumb-item active" aria-current="page">Chi
						tiết sản phẩm</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- Breadcrumb Area End -->
	<!-- Product Details Area Start -->
	<div class="product-details-area pt-80 pb-75">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 col-sm-12">
					<div class="single-product-image product-image-slider fix">
						<div class="p-image">
							<img id="zoom1" src="${base }/upload/${product.avatar}" alt="" />
						</div>
					</div>
					<div
						class="single-product-thumbnail product-thumbnail-slider float-left"
						id="gallery_01">

						<c:forEach items="${product.productImages}" var="image">
							<img style="width: 100px; height: 100px;"
								src="${base }/upload/${image.path}" alt="">
						</c:forEach>
					</div>
				</div>
				<div class="col-lg-7 col-md-7 col-sm-12">
					<div class="p-d-wrapper">
						<h1>${product.title }</h1>

						<span class="p-d-price">Giá gốc: <fmt:setLocale
								value="vi_VN" scope="session" /> <fmt:formatNumber
								value="${product.price }" type="currency" />
						</span> <span class="p-d-price">Sale: <fmt:setLocale value="vi_VN"
								scope="session" /> <fmt:formatNumber
								value="${product.price_sale }" type="currency" />
						</span> <span class="model-stock"> Loại: <span> <span>${product.categories1.nameCategory }</span>
						</span>
						</span>

						<div class="qty-cart-add">
							<label for="qty">Số lượng</label> <input type="number" value="1"
								id="sl_${product.id }">


						</div>
						<div class="p-d-buttons">

							<button type="button"
								onclick="Cart.addItemToCart(${product.id }, 'sl_${product.id }')">Thêm
								vào giỏ hàng</button>
						</div>

						<p>${product.short_description }</p>
					</div>
				</div>
			</div>
		</div>

		<div class="container scroll-area">
			<div class="p-d-tab-container">
				<div class="p-tab-btn">
					<div class="nav" role="tablist">
						<a class="active" href="#tab1" data-toggle="tab" role="tab"
							aria-selected="true" aria-controls="tab1">Mô tả chi tiết</a> <a
							href="#tab2" data-toggle="tab" role="tab" aria-selected="false"
							aria-controls="tab2">Đánh giá</a>
					</div>
				</div>
				<div class="p-d-tab tab-content">
					<div class="tab-pane active show fade" id="tab1" role="tabpanel">
						<div class="tab-items">
							<div class="p-details-list">
								<span>${product.detail_description }</span>
							</div>
						</div>
					</div>

					<jsp:include page="/WEB-INF/views/user/utilities/review.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<!-- Product Details Area End -->

	<!-- Related Products Area Start -->
	<div class="related-products-area text-center">
		<div class="container">
			<div class="section-title title-style-2">
				<h2>
					<span>Sản phẩm khác</span>
				</h2>
			</div>
		</div>
		<div class="container">
			<div class="custom-row">
				<div class="product-carousel owl-carousel carousel-style-one">
					<c:forEach items="${products }" var="p">

						<div class="custom-col">
							<div class="product-item">
								<div class="product-image-hover">
									<a href="${base }/product-details1/${p.getSeo()}"> <img
										style="width: 250px; height: 250px;" class="primary-image"
										src="${base }/upload/${p.avatar}" alt="">
									</a>
									<div class="product-hover">
										<span style="margin-right: -65px;">SL</span> <input
											type="number" value="1" id="sl_${p.id }"
											style="width: 50px; margin-left: 40px; margin-right: -20px;">
										<button onclick="Cart.addItemToCart(${p.id }, 'sl_${p.id }')">
											<i class="icon icon-FullShoppingCart"> </i>
										</button>
										<a href="wishlist.htnl"><i class="icon icon-Files"></i></a>
									</div>
								</div>
								<div class="product-text">
									<h4>
										<a href="/product-details1?id=${p.id}">${p.title }</a>
									</h4>
									<div class="product-price">
										<span><fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${p.price }" type="currency" /></span>
									</div>
								</div>
							</div>
						</div>



					</c:forEach>
				</div>

			</div>
		</div>
	</div>
	<!-- Related Products Area End -->

	<!-- Footer Area Start -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- Footer Area End -->

	<!-- all js here -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>
</html>
