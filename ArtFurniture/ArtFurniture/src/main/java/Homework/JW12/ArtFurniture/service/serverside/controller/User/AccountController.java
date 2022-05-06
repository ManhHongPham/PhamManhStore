package Homework.JW12.ArtFurniture.service.serverside.controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Homework.JW12.ArtFurniture.service.serverside.dto.ProductModel;
import Homework.JW12.ArtFurniture.service.serverside.dto.RoleModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Role;
import Homework.JW12.ArtFurniture.service.serverside.entities.User;
import Homework.JW12.ArtFurniture.service.serverside.services.RoleService;
import Homework.JW12.ArtFurniture.service.serverside.services.UserService;

@Controller
public class AccountController extends BaseController {
	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	/**
	 * page register
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/account" }, method = RequestMethod.GET)
	public String account(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		return "user/account";
	}

	@RequestMapping(value = { "/account" }, method = RequestMethod.POST)
	public String addProduct_Post(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");

		if (username.trim().equals("")) {
			model.addAttribute("error", "Username không được để trống!");
			return "/account";
		}

		Role roles = roleService.getRoleByName("Khach");

		User user = new User();
		
		user.setUserName(username);
		user.setEmail(email);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		user.setPassword(encoder.encode(password));

		user.addRole(roles);

		userService.saveOrUpdate(user);

		return "redirect:/account";
	}
}
