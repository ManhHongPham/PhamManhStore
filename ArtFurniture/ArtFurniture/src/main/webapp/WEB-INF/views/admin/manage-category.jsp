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
								<h3 class="title-5 m-b-35">Danh mục sản phẩm</h3>
								<div class="table-data__tool">
									<div class="table-data__tool-right">
										<button class="au-btn au-btn-icon au-btn--green au-btn--small">
											<a
												href="${pageContext.servletContext.contextPath}/admin/add_category">
												<i class="zmdi zmdi-plus"></i>Thêm danh mục
											</a>
										</button>
									</div>
								</div>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th>Mã danh mục</th>
												<th>Tên</th>
												<th>Mã danh mục con</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${category}" var="ca">
												<tr class="tr-shadow">
													<td>${ca.id }</td>
													<td><a
														href="${pageContext.servletContext.contextPath}/admin/edit_category?id=${ca.id}">${ca.nameCategory }</a></td>
													
													<td>${ca.parent.id }</td>
													<td>
														<div class="table-data-feature">
															<button class="item" data-toggle="tooltip"
																data-placement="top" title="Chỉnh sửa">
																<a
																	href="${pageContext.servletContext.contextPath}/admin/edit_category?id=${ca.id}"><i
																	class="zmdi zmdi-edit"></i></a>
															</button>
															<button class="item" data-toggle="tooltip"
																data-placement="top" title="Xóa">
																<i class="zmdi zmdi-delete"></i>
															</button>
															<button class="item" data-toggle="tooltip"
																data-placement="top" title="Thông tin thêm">
																<i class="zmdi zmdi-more"></i>
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

</body>

</html>
<!-- end document-->
