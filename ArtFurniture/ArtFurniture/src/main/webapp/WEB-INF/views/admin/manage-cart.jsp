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

		<!-- MAIN CONTENT -->

		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include page="/WEB-INF/views/admin/layout/page-content.jsp"></jsp:include>
			<!-- END HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">

						<div class="row">
							<div class="col-md-12">
								<!-- DATA TABLE -->
								<h3 class="title-5 m-b-35">Đơn hàng</h3>
								<h4 class="title-5 m-b-35">
									<span></span>
								</h4>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th>Mã đơn hàng</th>
												<th>Tên khách hàng</th>
												<th>Địa chỉ</th>
												<th>Số điện thoại</th>

												<th>Tổng tiền</th>
												<th>Trạng thái đơn hàng</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${saleorders }" var="s">
												<tr class="tr-shadow">
													<td><a href="${base}/admin/detail_cart?id=${s.id}">${s.code }
													</a></td>
													<td>${s.customerName}</td>

													<td class="desc">${s.customerAddress}</td>
													<td>${s.customerPhone }</td>
													<td>${s.getTotal_price()}đ</td>

													<td><span id="_saleorder_status_${s.id} }"> <c:choose>
																<c:when test="${s.status }">
																	<span class="badge badge-primary">Xác nhận</span>
																</c:when>
																<c:otherwise>
																	<span class="badge badge-warning">Đã giao</span>
																</c:otherwise>
															</c:choose>
													</span></td>


													<td>
														<div class="table-data-feature">


															<button class="item" data-toggle="tooltip"
																data-placement="top" title="Đã giao"
																onclick="Deliveried(${s.id})">
																<i class="zmdi zmdi-truck"></i>
															</button>

															<button class="item" data-toggle="tooltip"
																data-placement="top" title="Chi tiết">
																<a href="${base}/admin/detail_cart?id=${s.id}"> <i
																	class="zmdi zmdi-info"></i>
																</a>
															</button>

															<button class="item" data-toggle="tooltip"
																data-placement="top" title="Xóa"
																onclick="DeleteCart(${s.id})">
																<i class="zmdi zmdi-delete"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr class="spacer"></tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- END DATA TABLE -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT-->
		<!-- END PAGE CONTAINER-->
	</div>
	<!-- Jquery JS-->
	<jsp:include page="/WEB-INF/views/admin/layout/js.jsp"></jsp:include>


	<script type="text/javascript">
		function Deliveried(productId) {
			// javascript object.
			var data = {};

			// $ === jQuery
			$.ajax({
						url : "/admin/delivered_saleorder?SaleOrderId=" + productId,
						type : "post",
						contentType : "application/json",
						data : JSON.stringify(data),

						dataType : "json",
						success : function(jsonResult) {
							if (jsonResult.code == 200) {

								$("#_saleorder_status_" + productId)
										.html("<span class=\"badge badge-warning\">Đã giao</span>");
								
								alert("Đã giao thành công");

							} else {
								
								alert(jsonResult.message);
							}
						},
						error : function(jqXhr, textStatus, errorMessage) { // error callback 

						}
					});
		}
		
		function DeleteCart(productId) {
			// javascript object.
			var data = {};

			// $ === jQuery
			$.ajax({
						url : "/admin/delivered_saleorder?SaleOrderId=" + productId,
						type : "post",
						contentType : "application/json",
						data : JSON.stringify(data),

						dataType : "json",
						success : function(jsonResult) {
							if (jsonResult.code == 200) {
								$("#_saleorder_status_" + productId)
										.html("<span class=\"badge badge-warning\">Đã hủy đơn</span>");
								alert("Hủy đơn thành công");

							} else {
								
								alert(jsonResult.message);
							}
						},
						error : function(jqXhr, textStatus, errorMessage) { // error callback 

						}
					});
		}
	</script>

</body>
</html>
<!-- end document-->
