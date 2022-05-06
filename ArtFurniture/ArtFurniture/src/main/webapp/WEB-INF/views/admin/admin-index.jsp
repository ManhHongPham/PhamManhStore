<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- TagLibs -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="author" content="Hau Nguyen">
<meta name="keywords" content="au theme template">
<jsp:include page="/WEB-INF/views/admin/layout/variables.jsp"></jsp:include>

<!-- Title Page-->
<title>PhamManhStore</title>

<!-- Fontfaces CSS-->
<jsp:include page="/WEB-INF/views/admin/layout/css.jsp"></jsp:include>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->
		<!-- MENU SIDEBAR-->
		<jsp:include page="/WEB-INF/views/admin/layout/header-and-menu.jsp"></jsp:include>
		<!-- PAGE CONTAINER-->
		<jsp:include page="/WEB-INF/views/admin/layout/page-content.jsp"></jsp:include>
		<!-- HEADER DESKTOP-->
		<!-- END MAIN CONTENT-->
		<div class="page-container">

			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">

						<div class="row m-t-25">
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c1">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-account-o"></i>
											</div>
											<div class="text">
												<h2>${user}</h2>
												<span>Người dùng đăng ký</span>
											</div>
										</div>
										
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c1">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-comment"></i>
											</div>
											<div class="text">
												<h2>${contact}</h2>
												<span>Phản hồi sản phẩm</span>
											</div>
										</div>
										
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c2">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-shopping-basket"></i>
											</div>
											<div class="text">
												<h2>${product}</h2>
												<span>Sản phẩm hiện có</span>
											</div>
										</div>
										
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c2">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-shopping-cart"></i>
												
											</div>
											<div class="text">
												<h2>${cart}</h2>
												<span>Tổng đơn hàng</span>
											</div>
										</div>
										
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c4">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-money"></i>
												</span>$1,060,386<span>
											</div>
											<div class="text">
												<h2>1,060,386</h2>
												<span>total earnings</span>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>



		<!-- Jquery JS-->
		<jsp:include page="/WEB-INF/views/admin/layout/js.jsp"></jsp:include>
</body>

</html>
<!-- end document-->
