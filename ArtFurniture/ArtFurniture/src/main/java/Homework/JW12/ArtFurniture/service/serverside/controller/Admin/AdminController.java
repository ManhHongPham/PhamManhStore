package Homework.JW12.ArtFurniture.service.serverside.controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Homework.JW12.ArtFurniture.service.serverside.controller.User.BaseController;
import Homework.JW12.ArtFurniture.service.serverside.entities.Contact;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.entities.SaleOrder;
import Homework.JW12.ArtFurniture.service.serverside.entities.User;
import Homework.JW12.ArtFurniture.service.serverside.services.ContactService;
import Homework.JW12.ArtFurniture.service.serverside.services.ProductService;
import Homework.JW12.ArtFurniture.service.serverside.services.SaleOrderProductService;
import Homework.JW12.ArtFurniture.service.serverside.services.SaleOrderService;
import Homework.JW12.ArtFurniture.service.serverside.services.UserService;

@Controller
public class AdminController extends BaseController {
	
	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	private SaleOrderProductService saleOrderProductService;

	@Autowired
	private ProductService ProductService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = { "/admin/index" }, method = RequestMethod.GET)
	public String admin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		
		List<Product> products = ProductService.findAll();
		int count=0;
		for(int i=1;i<=products.size();i++) {
			count++;
		}
		
		List<User> users = userService.findAll();
		int count1=0;
		for(int i=1;i<=users.size();i++) {
			count1++;
		}
		
		List<SaleOrder> saleOrders = saleOrderService.findAll();
		int count2=0;
		for(int i=1;i<=saleOrders.size();i++) {
			count2++;
		}
		
		List<Contact> contacts = contactService.findAll();
		int count3=0;
		for(int i=1;i<=contacts.size();i++) {
			count3++;
		}
		
		model.addAttribute("product", count);
		model.addAttribute("user", count1);
		model.addAttribute("cart", count2);
		model.addAttribute("contact", count3);
		
		return "admin/admin-index";
	}
	
	
}