package Homework.JW12.ArtFurniture.service.serverside.controller.Admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Homework.JW12.ArtFurniture.service.serverside.controller.User.BaseController;
import Homework.JW12.ArtFurniture.service.serverside.dto.ProductModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.services.CategoryService;
import Homework.JW12.ArtFurniture.service.serverside.services.ProductService;

@Controller
public class AdminProductController extends BaseController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	/**
	 * page manage product, include list products
	 * 
	 * @param modelMap
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/manage_product", method = RequestMethod.GET)
	public String manageProduct(final ModelMap modelMap, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		List<Product> products = productService.findAll();
		modelMap.addAttribute("product", products);

		return "admin/manage-product";
	}

	/**
	 * page add product is form add product
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/admin/add_product" }, method = RequestMethod.GET)
	public String addProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("product", new Product());
		model.addAttribute("categoriesList", categoryService.findAll()); // lấy danh sách tất cả các categories
		return "admin/add-product";

	}

	/**
	 * when user want to save or update product
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param product       -key of entity product mapping with modeladdtribute in
	 *                      form addproduct
	 * @param productAvatar - spring form not support, use httprequest corresponds
	 *                      with name in form
	 * @param imagesProduct
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/admin/add_product" }, method = RequestMethod.POST)
	public String detail(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("product") Product product, @RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("imagesProduct") MultipartFile[] imagesProduct) throws Exception {

		if (product.getId() != null && product.getId() > 0) {
			productService.edit(product, productAvatar, imagesProduct);
		} else {
			productService.save(product, productAvatar, imagesProduct);
		}
		return "redirect:/admin/manage_product"; // when finish, return path http://localhost:9090/admin/add_product
	}

	/**
	 * 
	 * action when user click a buton edit on page manage product-> select id ->page
	 * edit-add(product)
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/admin/edit_product" }, method = RequestMethod.GET)
	public String editProduct(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		int proructId = Integer.parseInt(request.getParameter("id"));
		Product product = productService.getById(proructId);

		model.addAttribute("categoriesList", categoryService.findAll());
		model.addAttribute("product", product);

		return "admin/add-product";
	}

	/**
	 * action when user click icon delete
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = { "/admin/delete-product" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct_Ajax(final ModelMap model,
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@RequestBody Product product) {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			Product p = productService.getById(productId);
			
			//productService.delete(p);
			p.setStatus(Boolean.FALSE);
			productService.saveOrUpdate(p);
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
