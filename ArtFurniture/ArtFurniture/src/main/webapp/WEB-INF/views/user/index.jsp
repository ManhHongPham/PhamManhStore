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

<!-- variable -->
<link href="/user/layout/variables.jsp">

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
	<!-- Slider Area Start -->
	<div class="slider-area">
		<div class="slider-wrapper owl-carousel carousel-style-dot">
			<div class="single-slide"
				style="background-image: url('user/assets/img/slider/banner3.jpg');">
				<!-- 				<div class="container" style=" margin-right: 20px; margin-top: 100px;"> -->
				<!-- 					<div class="slider-banner" > -->
				<!-- 						<h1>Collection</h1> -->
				<!-- 						<h2>Lamps light Color</h2> -->
				<!-- 						<p> -->
				<!-- 							Eikon is made of certified wood and a lampshade that is attached<br>simply -->
				<!-- 							with the help of magnets. -->
				<!-- 						</p> -->
				<!-- 						<a href="/shop" class="banner-btn">Shop now</a> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
			<div class="single-slide slide-two"
				style="background-image: url('user/assets/img/slider/slide1.png');">
				<!-- 				<div class="container"> -->
				<!-- 					<div class="slider-banner"> -->
				<!-- 						<h1>inimalist design</h1> -->
				<!-- 						<h2>Lounge Chairs</h2> -->
				<!-- 						<p> -->
				<!-- 							Doko Demo is a minimalist design created by<br>Copenhagen-based -->
				<!-- 							designer CZYK -->
				<!-- 						</p> -->
				<!-- 						<a href="/shop" class="banner-btn">Shop now</a> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
		</div>
	</div>
	<!-- Slider Area End -->

	<!-- Banner Area Start -->
	<div class="banner-area pt-90">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<a class="banner-image" href="/shop"><img
						src="user/assets/img/banner/pre2.png" alt=""></a>
				</div>
				<div class="col-lg-6 col-md-6">
					<a class="banner-image" href="/shop"><img
						src="user/assets/img/banner/re1.png" alt="" style="height: 319px;"></a>
				</div>
				<div class="col-lg-3 col-md-3">
					<a class="banner-image" href="/shop"><img
						src="user/assets/img/banner/pre3.png" alt=""
						style="height: 319px;"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner Area End -->

	<!-- Product Area Start -->
	<div class="product-area text-center pt-90 pb-85">
		<div class="container">
			<div class="section-title">

				<h2>
					<span>Sản phẩm</span>
				</h2>
			</div>
		</div>
		<div class="container">
			<div class="custom-row">
				<div class="product-carousel owl-carousel carousel-style-one">
					<c:forEach items="${ product}" var="p">

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
										<!-- 										<a href="wishlist.htnl"><i class="icon icon-Heart"></i></a> -->
										<a href="wishlist.htnl"><i class="icon icon-Files"></i></a>
									</div>
								</div>
								<div class="product-text">
									<h4>
										<a href="${base }/product-details1/${p.getSeo()}">${p.title }</a>
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
	<!-- Product Area End -->

	<!-- Feature Product Area Start -->
	<!-- Banner Area Start -->

	<div class="banner-area">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<a class="banner-image" href="/shop"><img
						src="user/assets/img/banner/10.jpg" alt=""></a>
				</div>
				<div class="col-md-4">
					<a class="banner-image" href="/shop"><img
						src="user/assets/img/banner/11.jpg" alt=""></a>
				</div>
				<div class="col-md-4">
					<a class="banner-image" href="/shop"><img
						src="user/assets/img/banner/12.jpg" alt="" style="height: 194px;"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner Area End -->

	<!-- Information Area Start -->
	<div class="information-area">
		<div class="container">
			<div class="information-wrapper ptb-60">
				<div class="row">
					<div class="col-md-3">
						<div class="single-information">
							<div class="s-info-img">
								<img src="user/assets/img/icon/shipping.png" alt="">
							</div>
							<div class="s-info-text">
								<h4>Giao hàng</h4>
								<span>Miễn phí giao hàng khu vực Hà Nội</span>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="single-information">
							<div class="s-info-img">
								<img src="user/assets/img/icon/online.png" alt="">
							</div>
							<div class="s-info-text">
								<h4>Hỗ trợ</h4>
								<span>Hỗ trợ 24/7</span>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="single-information">
							<div class="s-info-img">
								<img src="user/assets/img/icon/money.png" alt="">
							</div>
							<div class="s-info-text">
								<h4>Chính sách</h4>
								<span>Hoàn trả 7 ngày vì bất cứ lý do gì</span>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="single-information">
							<div class="s-info-img">
								<img src="user/assets/img/icon/member.png" alt="">
							</div>
							<div class="s-info-text">
								<h4>Giảm giá</h4>
								<span>Nhận voucher giảm 10% của đơn hàng trên
									10.000.000(đ)</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Information Area End -->
	<!-- Footer Area Start -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- Footer Area End -->

	<!-- all js here -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>
</html>
