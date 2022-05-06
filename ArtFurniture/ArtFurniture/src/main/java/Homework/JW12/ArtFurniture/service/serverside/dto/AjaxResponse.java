package Homework.JW12.ArtFurniture.service.serverside.dto;

public class AjaxResponse {
	private int statusCode;
	private Object data;

	public AjaxResponse(int statusCode, Object data) {
		super();
		this.statusCode = statusCode;
		this.data = data;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
