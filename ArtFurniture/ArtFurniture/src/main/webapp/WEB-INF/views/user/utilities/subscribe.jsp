
<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<form action=""  id="mc-embedded-subscribe-form"
	name="mc-embedded-subscribe-form" class="validate" target="_blank"
	novalidate >
	<div id="mc_embed_signup_scroll" class="mc-form">
		<input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL"
			placeholder="Email của bạn" required>
		<!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
		<div class="mc-news" aria-hidden="true">
			<input type="text" name="b_6bbb9b6f5827bd842d9640c82_05d85f18ef"
				tabindex="-1" value="" required="required">
		</div>
		<button id="mc-embedded-subscribe" type="button" onclick="Subscribe();" name="subscribe" >Đăng ký</button>
	</div>
</form>

<script type="text/javascript">
	function Subscribe() {
		// javascript object.
		var data = {};
		data["mail"] = $("#mce-EMAIL").val();
		alert(JSON.stringify(data));

		// $ === jQuery
		$.ajax({
			url : "/subscribe-ajax",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),

			dataType : "json",
			success : function(jsonResult) {
				if (jsonResult.code == 200) {
					alert(jsonResult.status)
				} else {
					alert(jsonResult.data);
				}
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 
			}
		});
	}
</script>