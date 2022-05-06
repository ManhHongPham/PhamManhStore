<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!-- HEADER MOBILE-->
<header class="header-mobile d-block d-lg-none">
	<div class="header-mobile__bar">
		<div class="container-fluid">
			<div class="header-mobile-inner">
				<a class="logo" href="/admin/index"> <img
					src="/user/assets/img/logo/logo2.png" alt="CoolAdmin" />
				</a>
				<button class="hamburger hamburger--slider" type="button">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
	<nav class="navbar-mobile">
		<div class="container-fluid">
			<ul class="navbar-mobile__list list-unstyled">
				<li><a href="/admin/index"> <i class="fa fa-archive"></i>Tổng
						quan
				</a></li>
				<li><a href="/admin/manage_category"> <i
						class="fa fa-archive"></i>Danh mục sản phẩm
				</a></li>
				<li><a href="/admin/manage_product"> <i
						class="fa fa-square"></i>Sản phẩm
				</a></li>
				<li><a href="/admin/manage_cart"> <i
						class="fa fa-shopping-cart"></i>Đơn hàng
				</a></li>
				<li><a href="/admin/manage_contact"> <i
						class="fa fa-comment"></i>Phản hồi
				</a></li>
				<li><a href="/admin/manage_user"> <i class="fa fa-user"></i>Tài
						khoản
				</a></li>

			</ul>
		</div>
	</nav>
</header>
<!-- END HEADER MOBILE-->

<!-- MENU SIDEBAR-->
<aside class="menu-sidebar d-none d-lg-block">
	<div class="logo">
		<a href="/admin/index"> <img src="/user/assets/img/logo/logo2.png"
			alt="Cool Admin" />
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li><a href="/admin/index"> <i class="fa fa-archive"></i>Tổng
						quan
				</a></li>
				<li><a href="/admin/manage_category"> <i
						class="fa fa-archive"></i>Danh mục sản phẩm
				</a></li>

				<li><a href="/admin/manage_product"> <i
						class="fa fa-square"></i>Sản phẩm
				</a></li>
				<li><a href="/admin/manage_cart"> <i
						class="fa fa-shopping-cart"></i>Đơn hàng
				</a></li>
				<li><a href="/admin/manage_contact"> <i
						class="fa fa-comment"></i>Phản hồi
				</a></li>
				<li><a href="/admin/manage_user"> <i class="fa fa-user"></i>Tài
						khoản
				</a></li>
			</ul>
		</nav>
	</div>
</aside>
<!-- END MENU SIDEBAR-->