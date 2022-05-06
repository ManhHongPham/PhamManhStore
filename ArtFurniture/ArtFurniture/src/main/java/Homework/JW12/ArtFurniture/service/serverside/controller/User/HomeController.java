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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Homework.JW12.ArtFurniture.service.serverside.dto.CategoryModel;
import Homework.JW12.ArtFurniture.service.serverside.dto.ContactModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Category;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.services.CategoryService;
import Homework.JW12.ArtFurniture.service.serverside.services.ProductService;

@Controller
public class HomeController extends BaseController {

	// inject
	@Autowired // bỏ các thuộc tính getter setter, khi truyền tham số sẽ tự gán các thuộc tính
	private CategoryService CategoryService;

	@Autowired
	private ProductService productService;
	
	/**
	 * @param model    - Dùng để đẩy dữ liệu hoặc hứng dữ liệu từ tầng VIEW thông
	 *                 qua key vai trò trung gian giữa view và model.
	 * @param request  - Các thông tin người dùng yêu cầu gửi lên.
	 * @param response - Các thông tin controller gửi về.
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/home", "/index", "/trangchu" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
//		List<Category> categories = (CategoryService).search(null);
//		for (Category categories2 : categories) {
//			System.out.println(categories2.getName());
//		}
		List<Product> products= productService.findAll();
		model.addAttribute("product", products);
		return "user/index";
	}

	@RequestMapping(value = "/subscribe-ajax", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> subscribe(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody ContactModel contact) {

		System.out.println("subscribe[email]: " + contact.getMail());
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 200);
		result.put("status", "thanh cong");
		return ResponseEntity.ok(result);
	}

}
