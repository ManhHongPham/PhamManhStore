package Homework.JW12.ArtFurniture.service.serverside.controller.Admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Homework.JW12.ArtFurniture.service.serverside.controller.User.BaseController;
import Homework.JW12.ArtFurniture.service.serverside.dto.Cart;
import Homework.JW12.ArtFurniture.service.serverside.entities.Category;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.entities.SaleOrder;
import Homework.JW12.ArtFurniture.service.serverside.entities.SaleOrderProduct;
import Homework.JW12.ArtFurniture.service.serverside.services.ProductService;
import Homework.JW12.ArtFurniture.service.serverside.services.SaleOrderProductService;
import Homework.JW12.ArtFurniture.service.serverside.services.SaleOrderService;

@Controller
public class AdminCartController extends BaseController {
	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	private SaleOrderProductService saleOrderProductService;

	@Autowired
	private ProductService ProductService;

	@RequestMapping(value = "/admin/manage_cart", method = RequestMethod.GET)
	public String manageCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {

		List<SaleOrder> saleOrderes = saleOrderService.findAll();
		model.addAttribute("saleorders", saleOrderes);
		return "admin/manage-cart";
	}

	@RequestMapping(value = { "/admin/detail_cart" }, method = RequestMethod.GET)
	public String detailProduct1(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		int saleOrderId = Integer.parseInt(request.getParameter("id"));
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);

		model.addAttribute("cart", saleOrder.getProducts());

		model.addAttribute("saleOrder", saleOrder);

		return "admin/detail-cart";
	}

	@RequestMapping(value = { "/admin/detail_cart" }, method = RequestMethod.POST)
	public String detailProduct(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		int saleOrderId = Integer.parseInt(request.getParameter("id"));
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);

		model.addAttribute("cart", saleOrder.getProducts());
		model.addAttribute("saleOrder", saleOrder);

		saleOrderService.save(saleOrder);
		return "admin/detail-cart";
	}

	@RequestMapping(value = { "/admin/delivered_saleorder" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct_Ajax(final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response, @RequestBody Product product) {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		try {
			int saleOrderId = Integer.parseInt(request.getParameter("SaleOrderId"));
			SaleOrder saleOrder = saleOrderService.getById(saleOrderId);

			// productService.delete(p);
			saleOrder.setStatus(Boolean.FALSE);
			saleOrderService.saveOrUpdate(saleOrder);
			// productService.deleteById(product.getId());

			jsonResult.put("code", 200);
			jsonResult.put("status", "TC");

		} catch (Exception e) {
			jsonResult.put("code", 500);
			jsonResult.put("message", e.getMessage());
		}

		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/admin/delete-cart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteCart_Ajax(final ModelMap model,
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@RequestBody Cart cart) {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		try {
			int cartId = Integer.parseInt(request.getParameter("CartId"));
			SaleOrder c = saleOrderService.getById(cartId);
			
			//productService.delete(p);
			c.setStatus(Boolean.FALSE);
			saleOrderService.saveOrUpdate(c);
			//productService.deleteById(product.getId());
			
			jsonResult.put("code", 200);
			jsonResult.put("status", "TC");

		} catch (Exception e) {
			jsonResult.put("code", 500);
			jsonResult.put("message", e.getMessage());
		}

		return ResponseEntity.ok(jsonResult);
	}
}
