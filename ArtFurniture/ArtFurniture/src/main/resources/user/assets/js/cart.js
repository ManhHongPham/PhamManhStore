var Cart = {
	addItemToCart: function(productId, quantityElementId) {
		
		/*alert("productId = " + productId);
		alert(quantityElementId);
		alert("quantity = " + $("#" + quantityElementId).val());*/
		
		var data = {
			"productId": productId,
			"quanlity": $("#" + quantityElementId).val()
		};
		$.ajax({
			url: "/cart/add",
			type: "post",
			contentType: "application/json",
			data: JSON.stringify(data),

			dataType: "json",
			success: function(jsonResult) {
				$("#totalItemsInCart").html(jsonResult.totalItems);
				//alert('thanh cong');
			}
		});
	},
}