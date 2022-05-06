package Homework.JW12.ArtFurniture.service.serverside.controller.Admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Homework.JW12.ArtFurniture.service.serverside.controller.User.BaseController;
import Homework.JW12.ArtFurniture.service.serverside.services.ContactService;

@Controller
public class AdminContactController extends BaseController {
	@Autowired
	private ContactService contactService;
	
	
	@RequestMapping(value = { "/admin/manage_contact" }, method = RequestMethod.GET)
	public String admincontact(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		model.addAttribute("contact", contactService.findAll());
		return "admin/manage-contact";
	}

}