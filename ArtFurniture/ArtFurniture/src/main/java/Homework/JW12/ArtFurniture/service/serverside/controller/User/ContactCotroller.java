package Homework.JW12.ArtFurniture.service.serverside.controller.User;

import java.io.IOException;
import java.util.ArrayList;
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

import Homework.JW12.ArtFurniture.service.serverside.dto.AjaxResponse;
import Homework.JW12.ArtFurniture.service.serverside.dto.ContactModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Contact;
import Homework.JW12.ArtFurniture.service.serverside.services.ContactService;

@Controller
public class ContactCotroller extends BaseController {
	
	@Autowired
	private ContactService contactService;
	/**
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("contact", new ContactModel());

		return "user/contact";
	}

	// use http request
	// model trung gian giua view va model
//	@RequestMapping(value = { "/contactt" }, method = RequestMethod.POST)
//	public String details(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
//			throws IOException {
//		
//		String fullname= request.getParameter("name");
//		System.out.println(fullname);
//		return "user/contact";
//	}
	/**
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param contact  -- tóm tất cả nội dung ở form thành để truy xuất
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = { "/contactt" }, method = RequestMethod.POST)
	public String details(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("contact") ContactModel contact) throws IOException {

		String username= request.getParameter("name");
		String mail= request.getParameter("email");
		String subject= request.getParameter("subject");
		String message= request.getParameter("message");
		
		//Map<String, Object> result = new HashMap<String, Object>();
		
		Contact contacts= new Contact();
		
		contacts.setFirstName(username);
		contacts.setEmail(mail);
		contacts.setRequestType(subject);
		contacts.setMessage(message);
		
		contactService.saveOrUpdate(contacts);

		return "user/contact";
	}
	
	@RequestMapping(value = { "/contact-ajax" }, method = RequestMethod.POST)
	public String contact3(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		
		String username= request.getParameter("name");
		String mail= request.getParameter("email");
		String subject= request.getParameter("subject");
		String message= request.getParameter("message");
		
		Contact contacts= new Contact();
		
		contacts.setLastName(username);
		contacts.setFirstName(username);
		contacts.setEmail(mail);
		contacts.setRequestType(subject);
		contacts.setMessage(message);
		
		System.out.println(username);
		contactService.saveOrUpdate(contacts);
	
		return "user/contact";
	}
	
	@RequestMapping(value = { "/contact2" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> contact3(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody ContactModel contactDto) {

//		Contact lh = contactService.saveContact(contact);
//		if (lh != null) {
//			return ResponseEntity.ok(new AjaxResponse(200, "The your message is sent to Administrator."));
//		} else {
//			return ResponseEntity.badRequest().body(new AjaxResponse(200, "Your message is corrupted when sending to Administrator."));
//		}

		Contact contact = new Contact();

		contact.setFirstName(contactDto.getName());
		contact.setLastName(contactDto.getName());
		contact.setRequestType(contactDto.getSubject());
		contact.setEmail(contactDto.getMail());
		contact.setMessage(contactDto.getMessage());

		
		//contact.setCreatedDate(new Date());
		contact.setUpdatedDate(contact.getCreatedDate());

		contactService.saveOrUpdate(contact);
//		contactRepo.save(contact);

		return ResponseEntity.ok(new AjaxResponse(200, "Thành công"));
	}
}
