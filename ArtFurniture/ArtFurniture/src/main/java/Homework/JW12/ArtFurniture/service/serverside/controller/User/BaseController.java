package Homework.JW12.ArtFurniture.service.serverside.controller.User;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import Homework.JW12.ArtFurniture.service.serverside.entities.Category;
import Homework.JW12.ArtFurniture.service.serverside.entities.User;
import Homework.JW12.ArtFurniture.service.serverside.services.CategoryService;

public abstract class BaseController {
	@Autowired
	private CategoryService categoryService;

	@ModelAttribute("menus")
	public String getCategories() {
		return this.buildMenu();
	}

	/**
	 * check user is logined
	 * 
	 * @return
	 */
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object pricipal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (pricipal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}

	@ModelAttribute("userLogined")
	public User getUserLogined() {
		// get infor user logined through SecurityContextHolder
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		// check
		if (userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;

		return null;
	}

	private void recursiveMenu(StringBuilder menu, Set<Category> childs) {
		menu.append("<ul>");
		for (Category c : childs) {
			menu.append("<li> <a href=\"/category/" + c.getSeo() + "\">" + c.getName() + "</a>");
			if (c.getChildCategory() != null && !c.getChildCategory().isEmpty()) {
				recursiveMenu(menu, c.getChildCategory());
				menu.append("</li>");
			} else {
				menu.append("</li>");
			}
		}
		menu.append("</ul>");
	}

	protected String buildMenu() {
		StringBuilder menu = new StringBuilder();

		// danh sach menu cha
		List<Category> categories = categoryService.getAllParents();

		for (Category c : categories) {
			menu.append("<li> <a href=\"/category/" + c.getSeo() + "\">" + c.getName() + "</a>");

			if (c.getChildCategory() != null && !c.getChildCategory().isEmpty()) {
				recursiveMenu(menu, c.getChildCategory());
			}
			menu.append("</li>");
		}

		return menu.toString();
	}
}
