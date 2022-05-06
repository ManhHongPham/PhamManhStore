package Homework.JW12.ArtFurniture.service.serverside.controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Homework.JW12.ArtFurniture.service.serverside.controller.User.BaseController;
import Homework.JW12.ArtFurniture.service.serverside.entities.Category;
import Homework.JW12.ArtFurniture.service.serverside.entities.Role;
import Homework.JW12.ArtFurniture.service.serverside.entities.User;
import Homework.JW12.ArtFurniture.service.serverside.services.RoleService;
import Homework.JW12.ArtFurniture.service.serverside.services.UserService;

@Controller
public class AdminUserController extends BaseController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	/**
	 * action when user access page manage_user
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/admin/manage_user" }, method = RequestMethod.GET)
	public String manageUser(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		List<User> users = userService.findAll();
		model.addAttribute("user", users);
		return "admin/manage-user";
	}

	/**
	 * action when user click icon adduser-> page add_user
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = { "/admin/add_user" }, method = RequestMethod.GET)
	public String addUserPage(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("user") User users) {
		// model.addAttribute("user", new User());

		model.addAttribute("roleList", roleService.findAll());
		return "admin/add-user";
	}

	/**
	 * action when user want save infor of user
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param user
	 * @return
	 */
	@RequestMapping(value = { "/admin/add_user" }, method = RequestMethod.POST)
	public String addUser(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("user") User users) {
		// model.addAttribute("roleOfUser", roleService.findAll());
		userService.saveOrUpdate(users);

		return "redirect:/admin/add_user";
	}

	@RequestMapping(value = { "/admin/edit_user" }, method = RequestMethod.GET)
	public String editcategory(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		int userId = Integer.parseInt(request.getParameter("id"));

		User user = userService.getById(userId);

		model.addAttribute("user", user);

		return "admin/add_user";
	}
}
