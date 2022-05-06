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
								<h3 class="title-5 m-b-35">Sản phẩm</h3>
								<div class="table-data__tool">
									<div class="table-data__tool-right">
										<button class="au-btn au-btn-icon au-btn--green au-btn--small">
											<a
												href="${pageContext.servletContext.contextPath}/admin/add_product">
												<i class="zmdi zmdi-plus"></i>Thêm sản phẩm
											</a>
										</button>
									</div>
								</div>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th>mã sản phẩm</th>
												<th>Tên sản phẩm</th>
												<th>Hình ảnh</th>
												<th>Danh mục</th>
												<th>Giá</th>
												<th>Trạng thái</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${product }" var="p">
												<tr class="tr-shadow">
													<td style="text-align: center; padding-top: 70px;">${p.id }</td>
													<td><a
														href="${pageContext.servletContext.contextPath}/admin/edit_product?id=${p.id}">${p.title }

													</a> </td>
													<td><img id="zoom1" src="${base }/upload/${p.avatar}"
														alt="" style="width: 107px; height: 107px;" /></td>
													<td>${p.categories1.nameCategory }</td>

													<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
															value="${p.price }" type="currency" /></td>

													<td><span id="_product_status_${p.id} }"> <c:choose>
																<c:when test="${p.status }">
																	<span class="badge badge-primary">Đang hoạt
																		động</<> 
																</c:when>
																<c:otherwise>
																	<span class="badge badge-warning">Ngừng hoạt
																		động</span>
																</c:otherwise>
															</c:choose>
													</span></td>


													<td>
														<div class="table-data-feature">

															<button class="item" data-toggle="tooltip"
																data-placement="top" title="Chỉnh sửa">
																<a
																	href="${pageContext.servletContext.contextPath}/admin/edit_product?id=${p.id}">
																	<i class="zmdi zmdi-edit"></i>
																</a>
															</button>
															<button class="item" data-toggle="tooltip"
																data-placement="top" title="Dừng kinh doanh"
																onclick="DeleteProduct(${p.id})">
																<i class="zmdi zmdi-stop"></i>
															</button>
<!-- 															<button class="item" data-toggle="tooltip" -->
<!-- 																data-placement="top" title="Xem thêm"> -->
<!-- 																<i class="zmdi zmdi-more"></i> -->
<!-- 															</button> -->
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
		function DeleteProduct(productId) {
			// javascript object.
			var data = {};

			// $ === jQuery
			$.ajax({
						url : "/admin/delete-product?productId=" + productId,
						type : "post",
						contentType : "application/json",
						data : JSON.stringify(data),

						dataType : "json",
						success : function(jsonResult) {
							if (jsonResult.code == 200) {

								$("#_product_status_" + productId)
										.html("<span class=\"badge badge-warning\">InActive</span>");
								alert("successful delele");

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
