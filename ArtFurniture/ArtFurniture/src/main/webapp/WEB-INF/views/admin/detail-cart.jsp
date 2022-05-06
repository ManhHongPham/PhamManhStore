<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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

<jsp:include page="/WEB-INF/views/admin/layout/summernote.jsp"></jsp:include>

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

		<!-- HEADER DESKTOP-->

		<!-- MAIN CONTENT-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include page="/WEB-INF/views/admin/layout/page-content.jsp"></jsp:include>
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-6">
								<div class="card" style="width: 980px;">
									<div class="card-header">
										<strong>Chi tiết đơn hàng</strong>
									</div>
									<div class="card-body card-block">
										<sf:form action="${base}/admin/detail_cart" method="post"
											enctype="multipart/form-data" class="form-horizontal"
											modelAttribute="saleOrder">


											<sf:hidden path="id" />
											<!-- dung chung cho việc chỉnh sửa và ad sp, mapping in  -->

											<div class="row form-group">
												<div class="col col-md-3">
													<label class=" form-control-label">Thông tin đơn
														hàng </label>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Tên
														khách hàng </label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="text" id="text-input" name="text-input"
														placeholder="Text" class="form-control"
														path="customerName" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Email</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="text" id="email-input" name="email-input"
														placeholder="text" class="form-control"
														path="customerEmail" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Điện
														thoại </label>

												</div>
												<div class="col-12 col-md-9">
													<sf:input type="text" id="password-input"
														name="password-input" placeholder="text"
														class="form-control" path="customerPhone" />
												</div>
											</div>

											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">Địa
														chỉ </label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="text" id="password-input"
														name="password-input" placeholder="text"
														class="form-control" path="customerAddress" />
												</div>
											</div>

											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">Tổng
														tiền: <fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
															value="${saleOrder.getTotal_price() }" type="currency" />
													</label>
												</div>
												
												
												<div class="row">
													<div class="col-md-12">
														<!-- DATA TABLE-->
														<br>
														<h4 style="margin-left: 10px;">Thông tin sản phẩm</h4>
														<br>
														<div class="table-responsive m-b-40" style="width: 930px;">
															<table class="table table-borderless table-data3">
																<thead>
																	<tr>
																		<th>Mã sản phẩm</th>
																		<th>Tên sản phẩm</th>
																		<th>Hình ảnh</th>
																		<th>Số lượng</th>
																		<th>Giá Tiền</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${cart }" var="c">
																		<tr>
																			<td style="padding-top: 50px;">${c.id }</td>
																			<td><img id="zoom1"
																				src="${base }/upload/${c.product.avatar}" alt=""
																				style="width: 107px; height: 107px;" /></td>
																			<td style="padding-top: 50px;">${c.product.title}</td>
																			<td style="padding-top: 50px;">${c.quality }</td>
																			<td style="padding-top: 50px;"><fmt:setLocale
																					value="vi_VN" scope="session" /> <fmt:formatNumber
																					value="${c.product.price }" type="currency" /></td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
														<!-- END DATA TABLE                  -->
													</div>
												</div>
											</div>


											<div class="card-footer" style="padding-left: 750px;">
												<button type="submit" class="btn btn-primary btn-sm">
													<i class="fa fa-dot-circle-o"></i> Lưu
												</button>
												<button type="reset" class="btn btn-danger btn-sm">
													<i class="fa fa-ban"></i> Khôi phục
												</button>
											</div>
										</sf:form>
									</div>

								</div>
							</div>
						</div>
						<!-- 						<div class="row form-group"> -->
						<!-- 							<div class="col col-md-3"> -->
						<%-- 								<label class=" form-control-label">Tổng tiền <fmt:setLocale --%>
						<%-- 										value="vi_VN" scope="session" /> <fmt:formatNumber --%>
						<%-- 										value="${saleOrder.getTotal_price() }" type="currency" /> --%>
						<!-- 								</label> -->
						<!-- 							</div> -->
						<!-- 						</div> -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END MAIN CONTENT-->
	<!-- END PAGE CONTAINER-->


	<!-- Jquery JS-->
	<jsp:include page="/WEB-INF/views/admin/layout/js.jsp"></jsp:include>

	<script>
		$('#detail_description').summernote(
				{
					placeholder : 'detail...',
					tabsize : 2,
					height : 120,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'insert', [ 'link', 'picture', 'video' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
				});
	</script>
</body>

</html>
<!-- end document-->
