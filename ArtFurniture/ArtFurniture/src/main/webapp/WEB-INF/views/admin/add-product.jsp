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
								<div class="card" style="width: 920px;">
									<div class="card-header">
										<strong>Thêm sản phẩm</strong>
									</div>
									<div class="card-body card-block">
										<sf:form action="${base}/admin/add_product" method="post"
											enctype="multipart/form-data" class="form-horizontal"
											modelAttribute="product">


											<sf:hidden path="id" />
											<!-- dung chung cho việc chỉnh sửa và ad sp, mapping in  -->

											<div class="row form-group">
												<div class="col col-md-3">
													<label class=" form-control-label" style="width: 250px;">Thông
														tin sản phẩm</label>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Tên
														sản phẩm </label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="text" id="text-input" name="text-input"
														placeholder="" class="form-control" path="title"
														required="true" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Giá</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="number" id="email-input" name="email-input"
														placeholder="" class="form-control" path="price"
														required="true" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Giá
														sale</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="number" id="password-input"
														name="password-input" placeholder="" class="form-control"
														path="price_sale" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">Mô
														tả ngắn</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:textarea name="textarea-input" id="textarea-input"
														rows="9" placeholder="Nội dung..." class="form-control"
														path="short_description" required="true"></sf:textarea>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">Mô
														tả chi tiết</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:textarea name="textarea-input" id="textarea-input"
														rows="9" placeholder="Nội dung..." class="form-control"
														path="detail_description"></sf:textarea>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="select" class=" form-control-label">Danh
														mục</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:select path="categories1.id" name="select" id="select"
														class="form-control" required="true">
														<sf:options items="${categoriesList}" itemValue="id"
															itemLabel="nameCategory" value="" />
														<!-- categoriesList tuong ung voi model.addAttribute("categoriesList") o controller 
															categories1 tuong ung voi entity
														-->
													</sf:select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Ảnh
														đại diện</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="file" id="file-input" name="productAvatar"
														class="form-control-file" required="true">

													<!-- spring boot not support, use http url with property name -->

													<img style="width: 100px; height: 100px;"
														class="primary-image"
														src="${base }/upload/${product.avatar}" alt="">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Ảnh
														khác</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="file" id="file-input" name="imagesProduct"
														class="form-control-file" multiple="multiple">

													<c:forEach items="${product.productImages}" var="image">
														<img style="width: 100px; height: 100px;"
															src="${base }/upload/${image.path}" alt="">
													</c:forEach>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label class=" form-control-label">Sản phẩm bán
														chạy</label>
												</div>
												<div class="col col-md-9">
													<div class="form-check">
														<div class="checkbox">
															<label for="checkbox1" class="form-check-label ">
																<sf:checkbox path="hot" id="checkbox1" name="checkbox1"
																	value="option1" class="form-check-input " /> Có
															</label>
														</div>
													</div>
												</div>
											</div>

											<div class="card-footer" style="padding-left: 620px;">
												<button type="submit" class="btn btn-primary btn-sm">
													<i class="fa fa-dot-circle-o"></i> Lưu
												</button>
												<button type="reset" class="btn btn-danger btn-sm">
													<i class="fa fa-ban"></i> Khôi phục ban đầu
												</button>
											</div>
										</sf:form>
									</div>
								</div>

							</div>
						</div>
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
