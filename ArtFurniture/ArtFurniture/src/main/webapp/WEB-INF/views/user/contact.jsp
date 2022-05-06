<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
	<div class="breadcrumb-area bg-dark">
		<div class="container">
			<nav aria-label="breadcrumb">
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="/index">Trang chủ</a></li>
					<li class="breadcrumb-item active" aria-current="page">Hỗ trợ</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- Breadcrumb Area End -->
	<!-- Contact Area Start -->
	<div class="contact-area ptb-80">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h4>Nhập thông tin</h4>
					<jsp:include page="/WEB-INF/views/user/utilities/contact-form.jsp"></jsp:include>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="contact-address-info bg-light-2">
						<div class="single-contact-adrs text-center">
							<span class="c-address-icon"> <i class="fa fa-map-marker"></i>
							</span>
							<div class="adrs-text">
								<span>Địa chỉ: 312, Hồ Tùng Mậu, P.Cầu Diễn, Q.Nam Từ Liêm, Tp.Hà Nội
								</span>
							</div>
						</div>
						<div class="single-contact-adrs text-center">
							<span class="c-address-icon"> <i class="fa fa-phone"></i>
							</span>
							<div class="adrs-text">
								<span>Điện thoại: 0336 910 878<br>0336 010 277
								</span>
							</div>
						</div>
						<div class="single-contact-adrs text-center">
							<span class="c-address-icon"> <i class="fa fa-globe"></i>
							</span>
							<div class="adrs-text">
								<span>Email: PhammanhStore@gmail.com
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact Area End -->

	<!-- Footer Area Start -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- Footer Area End -->

	<!-- all js here -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>
</html>
