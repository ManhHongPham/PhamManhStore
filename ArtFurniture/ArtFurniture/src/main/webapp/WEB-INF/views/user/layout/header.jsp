
<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- TagLibs -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<header class="header-area bg-ash">
	<!--Header Top Area Start -->
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span class="welcome-text">Chào mừng tới PhamManhStore!</span>
					<!-- change -->
				</div>
				<div class="col-md-8">
					<div class="header-top-links">
						<div class="account-wishlist">
							
							<c:choose>
								<c:when test="${isLogined }">
									<a href="/index">${userLogined.userName }</a>
									<a href="${base }/logout"> <i class="zmdi zmdi-power"></i>Đăng xuất
									</a>
								</c:when>
								<c:otherwise>
									<a href="/login">Đăng nhập</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Header Top Area End -->
	<!--Header Middle Area Start -->
	<div class="header-middle-area">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="logo">
						<a href="/index"> <img src="http://localhost:9090/user/assets/img/logo/logo2.png"
							alt="Artfurniture" style="width: 224px; height: 84px:"></a>
					</div>
				</div>
				<div class="col-md-3">
					<span class="email-image"> <span><img
							src="user/assets/img/icon/email.png" alt=""></span> <span><span>Email:
						</span>PhamManhStore@gmail.com</span>
					</span>
				</div>
				<div class="col-md-6">

					<form action="${base }/search" method="get" class="header-search">
						<input type="text" placeholder="Tìm kiếm..."
							name="searchText">
						<button type="submit">
							<i class="icon icon-Search"></i>
						</button>
					</form>

					<div class="cart-box-wrapper">

						<a class="cart-info" href="/cart/view"> <span> <img
								src="user/assets/img/icon/cart.png" alt=""> <span
								id="totalItemsInCart"> (${totalItems })</span>
						</span> <span>Giỏ hàng</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Header Middle Area End -->
	<!-- Mainmenu Area Start -->
	<div class="mainmenu-area header-sticky display-none">
		<div class="container">
			<div class="menu-wrapper">
				<div class="main-menu">
					<nav>
						<ul>
							<li class="active"><a href="/index">Trang chủ</a></li>			
							<li><a href="/shop">Sản phẩm</a></li>
							<li><a href="/contact">Hỗ trợ</a></li>
							<li><a href="/account">Đăng ký</a></li>
							<li><a href="/login">Đăng nhập</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- Mainmenu Area End -->
</header>