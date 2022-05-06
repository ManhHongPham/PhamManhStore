package Homework.JW12.ArtFurniture.service.serverside.controller.User;

import java.math.BigDecimal;
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

import Homework.JW12.ArtFurniture.service.serverside.dto.Cart;
import Homework.JW12.ArtFurniture.service.serverside.dto.CartItem;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.entities.SaleOrder;
import Homework.JW12.ArtFurniture.service.serverside.entities.SaleOrderProduct;
import Homework.JW12.ArtFurniture.service.serverside.services.ProductService;
import Homework.JW12.ArtFurniture.service.serverside.services.SaleOrderProductService;
import Homework.JW12.ArtFurniture.service.serverside.services.SaleOrderService;
import net.bytebuddy.asm.Advice.This;

@Controller
public class CartController extends BaseController {

	@Autowired
	ProductService productService;

	@Autowired
	SaleOrderService saleOrderService;

	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET)
	public String account(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("totalprice", this.getTotalPrice(request));
		return "user/cart";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/cart/paymnet" }, method = RequestMethod.POST)
	public String addProduct_Post(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String fullName = request.getParameter("fullName");
		String address = request.getParameter("address");

		HttpSession httpSession = request.getSession();
		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCode("ORDER-" + System.currentTimeMillis());
		saleOrder.setSeo("ORDER-" + System.currentTimeMillis());

		saleOrder.setCustomerAddress(address);
		saleOrder.setCustomerName(fullName);
		saleOrder.setCustomerEmail(email);
		saleOrder.setCustomerPhone(tel);

		saleOrder.setTotal(new BigDecimal(getTotalItems(request)));
		saleOrder.setTotal_price(new BigDecimal(getTotalPrice(request)));

		for (CartItem item : cartItems) {
			SaleOrderProduct saleOrderProducts = new SaleOrderProduct();
			saleOrderProducts.setProduct(productService.getById(item.getProductId()));
			saleOrderProducts.setQuality(item.getQuanlity());
			saleOrder.addSaleOrderProduct(saleOrderProducts);

		}
		model.addAttribute("totalprice", saleOrder.getTotal_price());

		saleOrderService.save(saleOrder);

		this.resetCart(request);

		// send a email to customer.
		// emailService.sendEmailWhenPaymentSuccess(email);

		return "redirect:/index";
	}

	@RequestMapping(value = { "/cart_delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteItemInCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem cartItem) {
		HttpSession httpSession = request.getSession();

		Cart cart = (Cart) httpSession.getAttribute("cart");

		List<CartItem> cartItems = cart.getCartItems();
		Double totalPrice = 0d;

		for (int i = 0; i < cartItems.size(); i++) {
			if (cartItems.get(i).getProductId() == cartItem.getProductId()) {
				cartItems.remove(i);
				break;
			}
		}
		for (CartItem item : cartItems) {
			totalPrice += item.getPriceUnit().doubleValue();
		}

		httpSession.setAttribute("totalItems", getTotalItems(request));
		httpSession.setAttribute("totalPrice", totalPrice);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	/**
	 * buy product
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param cartItem
	 * @return
	 */
	@RequestMapping(value = { "/cart/add" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem cartItem) {

		// lay doi tuong session
		// session tuong tu nhu la 1 map luu tren ram cua server
		HttpSession httpSession = request.getSession();

		// dinh nghia gio hang
		Cart cart = null;

		// kiem tra xem da co gio hang tren session
		if (httpSession.getAttribute("cart") != null) {
			// neu da ton tai gio hang thi lay ra tu session
			cart = (Cart) httpSession.getAttribute("cart");
		} else {
			cart = new Cart(); // khoi tao gio hang neu chua co
			httpSession.setAttribute("cart", cart); // luu gio hang tren session
		}

		// kiem tra item da co trong gio hang chua
		// lay tat ca cac san pham co trong gio hang
		List<CartItem> cartItems = cart.getCartItems();

		// bat dau kiem tra xem da ton tai chua
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// neu khong ton tai san pham trong gio hang
		if (!isExists) {
			// lay thon tin san pham tu db
			Product productInDb = productService.getById(cartItem.getProductId());

			// thiet lap cac gia tri khac cua item
			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setAvatarProduct(productInDb.getAvatar());

			// add san pham vao trong gio hang
			cart.getCartItems().add(cartItem);
		}

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		printInfo(request);

		// hien thi sl don hang o moi trang
		httpSession.setAttribute("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

	private void printInfo(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		for (CartItem item : cartItems) {
			System.out.println(item.getProductName() + ":" + item.getQuanlity());
		}
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}

	private Double getTotalPrice(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0d;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		Double totalPrice = 0d;
		for (CartItem item : cartItems) {
			totalPrice += item.getPriceUnit().doubleValue() * item.getQuanlity();
		}

		return totalPrice;
	}

	private void resetCart(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		// after finish payment must be clean.
		httpSession.setAttribute("cart", new Cart());
		httpSession.setAttribute("totalItems", 0);
	}

}
