<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- ajax -->
<form id="contact-form" method="post" action="${base}/contact2">
	<div class="row">
		<div class="col-md-6">
			<input type="text" name="name" id="ajname" placeholder="Họ tên" >
		</div>
		<div class="col-md-6">
			<input type="text" name="email" id="ajemail" placeholder="Email" >
		</div>
	</div>
	<input type="text" name="subject" id="ajsubject" placeholder="Tiêu đề" >
	
	<textarea name="message" id="ajmessage" cols="30" rows="10"
		placeholder="Nội dung......." ></textarea>
	
	<button type="submit" onclick="SaveContact();" class="default-btn submit-btn">Gửi</button>
	<p class="form-message"></p>

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
			$.ajax({
				url : "/contact2",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json",
				success : function(jsonResult) {
					if (jsonResult.statusCode == 200) {
						swal("Thành công!!", "Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất", "success");
					
					} else {
						alert("Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất");
					}
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 
				}
			});
		}
	</script>
</form>

