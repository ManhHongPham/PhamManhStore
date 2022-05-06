package Homework.JW12.ArtFurniture.service.serverside.controller.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Homework.JW12.ArtFurniture.service.serverside.dto.ContactModel;
import Homework.JW12.ArtFurniture.service.serverside.dto.ProductSearchModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.services.ProductService;

@Controller
public class ProductDetailController extends BaseController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = { "/product-details1/{productSeo}", }, method = RequestMethod.GET)
	public String detail10(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("productSeo") String productSeo) throws Exception {
		

		//display detail product
		//int productID = Integer.parseInt(request.getParameter("id"));
		//Product product = productService.getById(productID);
		
		
		ProductSearchModel sm = new ProductSearchModel();
		sm.setProductSeo(productSeo);
		
		List<Product> products = productService.search(sm);
		model.addAttribute("product", products.get(0));
		
		//display list product
		model.addAttribute("products", productService.findAll());
		
		return "user/product-details-1";
	}

	@RequestMapping(value = { "/product-details1" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> review(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody ContactModel contact) throws Exception {
		int productID = Integer.parseInt(request.getParameter("id"));
		Product product = productService.getById(productID);

		List<Product> products = productService.findAll();
		model.addAttribute("products", products);

		model.addAttribute("product", product);

		System.out.println("Contact[Email]: " + contact.getName());
		System.out.println("Contact[Name]: " + contact.getMail());
		System.out.println("Contact[sugject]: " + contact.getSubject());
		System.out.println("Contact[Content]: " + contact.getMessage());

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 200);
		result.put("status", "TC");

		return ResponseEntity.ok(result);
	}
}
