
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
					<li class="breadcrumb-item active" aria-current="page">Đăng ký</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- Breadcrumb Area End -->
	<!-- Account Area Start -->
	<div class="my-account-area ptb-80">
		<div class="container">
			<div class="row">
				<c:if test="${not empty error}">
					<h3 class="h4 text-danger">Email đã tồn tại!</h3>
				</c:if>
				
				
				
				<div class="col-lg-6 col-md-12 col-sm-12">
					<form action="${base }/account" method="post">
						<div class="form-fields">
							<h2>Đăng ký thành viên</h2>
							<p>
								<label for="reg-email" class="important">Tài khoản</label> <input
									type="text" id="reg-email" name="username" required="required">
							</p>

							<p>
								<label for="reg-email" class="important">Email</label> <input
									type="text" id="reg-email" name="email" required="required">
							</p>
							<p>
								<label for="reg-email" class="important">Mật khẩu</label> <input
									type="password" id="reg-email" name="password" required="required">
							</p>
							<p>
								<label for="reg-pass" class="important">Nhập lại mật khẩu</label> <input
									type="password" id="reg-pass" name="repassword" required="required">
							</p>
						</div>
						<div class="form-action">
							<button type="submit">Đăng ký</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Account Area End -->
	<!-- Footer Area Start -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- Footer Area End -->

	<!-- all js here -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>
</html>
