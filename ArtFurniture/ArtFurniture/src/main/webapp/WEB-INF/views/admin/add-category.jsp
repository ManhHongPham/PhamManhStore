<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
								<div class="card" style="width: 950px;">
									<div class="card-header">
										<strong>Danh mục sản phẩm</strong>
									</div>
									<div class="card-body card-block" >
										<sf:form
											action="${pageContext.servletContext.contextPath}/admin/add_category"
											method="post" enctype="multipart/form-data"
											class="form-horizontal" modelAttribute="category">

											<sf:hidden path="id" />
											<!-- dung chung cho việc chỉnh sửa và ad sp, mapping in  -->


											<div class="row form-group">
												<div class="col col-md-3">
													<label class=" form-control-label">Thông tin danh mục</label>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Tên: 
													</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="text" id="text-input" name="text-input"
														placeholder="Tên danh mục" class="form-control" path="name" required="true" />
												</div>
											</div>

											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">Mô tả</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:textarea name="textarea-input" id="textarea-input"
														rows="9" placeholder="Mô tả..." class="form-control"
														path="description"></sf:textarea>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="select" class=" form-control-label">Danh mục cha </label>
												</div>
												<div class="col-12 col-md-9">
													<sf:select path="parent.id" name="select" id="select"
														class="form-control" required="true">
														<sf:option value=""></sf:option>
														<sf:options items="${categories}" itemValue="id"
															itemLabel="name" />

														<!-- 														them category property trong product model  -->
													</sf:select>
												</div>
											</div>
											<div class="card-footer" style="padding-left: 710px;">
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
