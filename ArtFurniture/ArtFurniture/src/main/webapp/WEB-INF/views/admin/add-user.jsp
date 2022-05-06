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
								<div class="card" style=" width:950px;">
									<div class="card-header">
										<strong>Thêm tài khoản</strong>
									</div>
									<div class="card-body card-block">
										<sf:form action="${base}/admin/add_user" 
										method="post" enctype="multipart/form-data"
											class="form-horizontal" modelAttribute="user">
											
											<sf:hidden path="id" />
											<!-- dung chung cho việc chỉnh sửa và ad sp, mapping in  -->
											
											
											<div class="row form-group">
												<div class="col col-md-3">
													<label class=" form-control-label">Thông tin tài khoản</label>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Họ tên
													</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="text" id="text-input" name="text-input"
														placeholder="Text" class="form-control" path="userName" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Mật khẩu
													</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="password" id="text-input" name="text-input"
														placeholder="Text" class="form-control" path="password" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Email</label>
												</div>
												<div class="col-12 col-md-9">
													<sf:input type="text" id="text-input" name="text-input"
														placeholder="Text" class="form-control" path="email" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="select" class=" form-control-label">Quyền </label>
												</div>
												<div class="col-12 col-md-9">
													<sf:select path="roles" name="select" id="select" class="form-control"> 							
 														
 														<sf:options items="${roleList}" itemValue="id" itemLabel="name"/>
														
<!-- 														them category property trong product model  -->
 													</sf:select> 
												</div>
											</div>
											<div class="card-footer" style="padding-left: 715px;">
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
