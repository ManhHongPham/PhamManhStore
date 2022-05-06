<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="tab-pane fade scroll-area" id="tab2" role="tabpanel">
	<div class="tab-items">
		<div class="p-review-wrapper">
			<div class="section-title title-style-2 text-center">
				<h2>
					<span>Đánh giá</span>
				</h2>
			</div>
		</div>
		<div class="submit-review-wrapper">
			<h3>Đánh giá ngay</h3>

			<form class="rating-form" method="post" action="${base }/contact2">
				<div class="rating-form-box">
					<label for="r-name" class="important">Họ và tên: </label> <input
						type="text" placeholder="" id="ajname" required="required">
				</div>
				<div class="rating-form-box">
					<label for="r-summary" class="important">Email</label> <input
						type="text" placeholder="" id="ajemail" required="required">
				</div>
				<div class="rating-form-box">
					<label for="r-summary" class="important">Nội dung:</label> <input
						type="text" placeholder="" id="ajsubject" required="required">
				</div>
				<div class="rating-form-box">
					<label for="r-review" class="important">Cảm nhận của bạn về sản phẩm</label>
					<textarea name="review" id="ajmessage" cols="30" rows="10" required="required"></textarea>
				</div>
				<button type="button" onclick="SaveContact();">Gửi đánh giá</button>


				<script type="text/javascript">
					function SaveContact() {
						// javascript object.
						var data = {};
						data["name"] = $("#ajname").val();
						data["mail"] = $("#ajemail").val();
						data["subject"] = $("#ajsubject").val();
						data["message"] = $("#ajmessage").val();
						alert(JSON.stringify(data));

						// $ === jQuery
						$
								.ajax({
									url : "/contact2",
									type : "post",
									contentType : "application/json",
									data : JSON.stringify(data),
									dataType : "json",
									success : function(jsonResult) {
										if (jsonResult.statusCode == 200) {
											swal(
													"Thành công!!",
													"Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất",
													"success");

										} else {
											alert("Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất");
										}
									},
									error : function(jqXhr, textStatus,
											errorMessage) { // error callback 
									}
								});
					}
				</script>
			</form>
		</div>
	</div>
</div>