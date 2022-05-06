<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<footer class="footer-area">
	<div class="footer-top pt-80 pb-80">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="single-footer-widget">
<!-- 						<div class="footer-logo"> -->
<!-- 							<a href="/index"><img src="user/assets/img/logo/logo-2.png" -->
<!-- 								alt=""></a> -->
<!-- 						</div> -->
						<div class="single-footer-text">
							<span>Địa chỉ: 312, Hồ Tùng Mậu, P.Cầu Diễn, Q.Nam Từ Liêm, Tp.Hà Nội</span>
							<span>Điện thoại: 0321 222 121</span> 
							<span>Email: PhammanhStore@gmail.com</span>
						</div>
					</div>
				</div>

				<div class="col-lg-2 col-md-4">
					<div class="single-footer-widget">
						<h4>Chính sách</h4>
						<ul class="footer-widget-list">
							<li><a href="/contact">Hỏi đáp</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3">
					<div class="single-footer-widget">
						<h4>Tài khoản</h4>
						<ul class="footer-widget-list">
							<li><a href="/account">Tài khoản của tôi</a></li>
							<li><a href="/account">Đăng nhập</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-footer-widget">
						<h4>Đăng ký để nhận thông tin</h4>
						<p>Hãy là người đầu tiên nhận thông tin về sản phẩm và ưu đãi</p>
						<div class="newsletter-form mc_embed_signup">
							<jsp:include page="/WEB-INF/views/user/utilities/subscribe.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>