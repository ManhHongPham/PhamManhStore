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
	href="user/user/assets/img/favicon.png">

<!-- all css here -->
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>
	<!-- Header Area Start -->
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<!-- Header Area End -->
	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-dark">
		<div class="container">
			<nav aria-label="breadcrumb">
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="/index">Trang chủ</a></li>
					<li class="breadcrumb-item active" aria-current="page">Sản
						phẩm</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- Breadcrumb Area End -->
	<!-- Shop Area Start -->
	<div class="shop-area ptb-80">
		<div class="container">
			<div class="row">
				<div class="order-xl-2 order-lg-2 col-xl-9 col-lg-8">
					<div class="shop-banner">
						<img src="user/assets/img/banner/slide2.png" alt="">
					</div>
					<h1 class="page-title">Sản phẩm</h1>
					<div class="ht-product-tab">
						<div class="nav" role="tablist">
							<a class="active" href="#grid" data-toggle="tab" role="tab"
								aria-selected="true" aria-controls="grid"><i
								class="fa fa-th"></i></a> <a href="#list" data-toggle="tab"
								role="tab" aria-selected="false" aria-controls="list"><i
								class="fa fa-th-list" aria-hidden="true"></i></a>
						</div>
					</div>
					<div class="ht-product-shop tab-content">
						<div class="tab-pane active show fade text-center" id="grid"
							role="tabpanel">
							<!-- 							type1 -->
							<div class="row">
								<c:forEach items="${product}" var="p">
									<div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-xs-12">
										<div class="product-item">
											<div class="product-image-hover">
												<a href="${base }/product-details1/${p.getSeo()}"> <img
													class="primary-image" src="${base }/upload/${p.avatar}"
													alt="">
												</a>
												<div class="product-hover">
													<span style="margin-right: -65px;">SL</span> <input
														type="number" value="1" id="sl_${p.id }"
														style="width: 50px; margin-left: 40px; margin-right: -20px;">

													<button
														onclick="Cart.addItemToCart(${p.id }, 'sl_${p.id }')">
														<i class="icon icon-FullShoppingCart"> </i>
													</button>

													<a href="${base }/product-details1/${p.getSeo()}"><i
														class="icon icon-Files"></i></a>
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


						<!-- type2 -->

						<div class="tab-pane fade" id="list" role="tabpanel">
							<c:forEach items="${product}" var="p">
								<div class="product-item">
									<div class="product-image-hover">
										<a href="${base }/product-details1/${p.getSeo()}"> <img
											style="width: 300px; height: 300px;" class="primary-image"
											src="${base }/upload/${p.avatar}" alt="avatar">
										</a>

										<div class="product-hover">
											<button>
												<i class="icon icon-FullShoppingCart"> </i>
											</button>
											<a href="wishlist.htnl"><i class="icon icon-Heart"></i></a> <a
												href="${base }/product-details1/${p.getSeo()}"><i
												class="icon icon-Files"></i></a>
										</div>
									</div>
									<div class="product-text">
										<h4>
											<a href="/product-details1">${p.title }</a>
										</h4>
										<div class="product-price">
											<span><fmt:setLocale value="vi_VN" scope="session" />
												<fmt:formatNumber value="${p.price }" type="currency" /></span>
										</div>
										<p>${p.short_description }</p>
										<a href="${base }/product-details1/${p.getSeo()}">Learn
											More</a>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>

					<div class="pagination-wrapper">
						<nav aria-label="navigation">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">Trang
										đầu</a></li>
								<li class="page-item active"><a class="page-link" href="#">Trang
										trước</a></li>
								<li class="page-item active"><a class="page-link" href="#">Kế
										tiếp</a></li>
								<li class="page-item active"><a class="page-link" href="#">Cuối</a></li>

								<li class="page-item"><a class="page-link" href="#">Kế
										tiếp<i class="fa fa-angle-right"></i>
								</a></li>
							</ul>
						</nav>

					</div>
				</div>



				<div class="col-xl-3 col-lg-4">
					<div class="sidebar-widget widget-style-1 panel-group"
						id="widget-parent" aria-multiselectable="true" role="tablist">
						<h4>Danh mục</h4>
						<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>

						<div class="panel widget-option">
							<a class="collapsed" data-toggle="collapse" href="#manufacture"
								data-parent="#widget-parent">Hãng</a>
							<div class="collapse" id="manufacture">
								<div class="collapse-content">
									<div class="single-widget-opt">
										<input type="checkbox" id="adidas"> <label
											for="adidas">Adidas <span>(1)</span></label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="chanel"> <label
											for="chanel">Chanel <span>(4)</span></label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="dkny"> <label for="dkny">DKNY
											<span>(2)</span>
										</label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="dolce"> <label for="dolce">Dolce
											<span>(5)</span>
										</label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="gabbana"> <label
											for="gabbana">Gabbana <span>(1)</span></label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="nike"> <label for="nike">Nike
											<span>(2)</span>
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="panel widget-option">
							<a class="collapsed" data-toggle="collapse" href="#price"
								data-parent="#widget-parent">Giá</a>
							<div class="collapse" id="price">
								<div class="collapse-content">
									<div class="single-widget-opt">
										<input type="checkbox" id="low"> <label for="low">$0.00
											- $9.99 <span>(3)</span>
										</label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="l-t-m"> <label for="l-t-m">$10.00
											- $19.99 <span>(2)</span>
										</label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="medium"> <label
											for="medium">$30.00 - $39.99 <span>(3)</span></label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="m-t-h"> <label for="m-t-h">$40.00
											- $49.99 <span>(4)</span>
										</label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="high"> <label for="high">$50.00
											- $59.99 <span>(1)</span>
										</label>
									</div>
									<div class="single-widget-opt">
										<input type="checkbox" id="highest"> <label
											for="highest">$70.00 And Above <span>(1)</span></label>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="sidebar-widget widget-style-1">
						<h4>So sánh sản phẩm</h4>
						<p>Bạn chưa có sản phẩm để so sánh</p>
					</div>

					<div class="sidebar-widget widget-style-1">
						<h4>Danh sách sản phẩm yêu thích</h4>
						<p>Bạn chưa có sản phẩm yêu thích</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Area End -->
	<!-- Footer Area Start -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- Footer Area End -->

	<!-- all js here -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>
</html>
