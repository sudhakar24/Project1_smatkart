package com.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Dao.CartDao;
import com.Dao.CategoryDao;
import com.Dao.OrderDao;
import com.Dao.ProductDao;
import com.Dao.SupplierDao;
import com.Dao.UserDao;
import com.model.Cart;
import com.model.Orders;
import com.model.Product;
import com.model.User;

@Controller
public class CartController {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	SupplierDao supplierDao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	CartDao cartDao;

	@Autowired
	OrderDao orderDao;
	
	
	@RequestMapping(value="user/goToCart", method=RequestMethod.GET)
	public String myCart(HttpServletRequest request,Model m)
	{
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		User user=userDao.getUser(userEmail);
		List<Cart> userCartList = cartDao.retrieveCart(userEmail);
		m.addAttribute(user);
		m.addAttribute("userCartList", userCartList);
		return "cart";
	}
	
	@RequestMapping(value="user/addToCart", method=RequestMethod.POST)
	public String addCart(HttpServletRequest request,Model m)
	{
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		int productId=Integer.valueOf(request.getParameter("cartProductId"));
		int Quantity=Integer.valueOf(request.getParameter("quant"));
		Product p=productDao.getProduct(productId);
		double price=p.getPrice();
		User u=userDao.getUser(userEmail);
		List<Cart> cartExist=cartDao.checkCartExist(userEmail, productId);
		if(cartExist.isEmpty())
		{
			Cart cart=new Cart();
			cart.setCartPrice(price);
			cart.setCartQuantity(Quantity);
			cart.setProduct(p);
			cart.setUser(u);
			cartDao.add(cart);
		}
		else
		{
			List<Cart> cartList=cartDao.getCartById(userEmail, productId);
			for(Cart c:cartList)
			{
				int CartId=c.getCartId();
				Cart cart=new Cart();
				cart.setCartId(CartId);
				cart.setCartPrice(price);
				cart.setCartQuantity(Quantity);
				cart.setProduct(p);
				cart.setUser(u);
				
				cartDao.updateCart(cart);
				
			}
		}
		List<Cart> userCartList=cartDao.retrieveCart(userEmail);
		m.addAttribute("userCartList",userCartList);
		return "cart";
		
	}
	
	@RequestMapping(value="user/checkout", method=RequestMethod.GET)
	public String shippingDetails(Model m,HttpServletRequest request)
	{	
		
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		User user=userDao.getUser(userEmail);
		List<Cart> userCartList=cartDao.retrieveCart(userEmail);
		
		m.addAttribute(user);
		m.addAttribute("userCartList",userCartList);
		return "checkout";
	}
	@RequestMapping(value="user/invoice", method=RequestMethod.POST)
	public String invoiceDetails(HttpServletRequest request, Model m)
	{
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		User user=userDao.getUser(userEmail);
		String paymentMode = String.valueOf(request.getParameter("payment"));
		double orderAmount = Double.valueOf(request.getParameter("total"));
		Orders os = new Orders();
		os.setUser(user);
		os.setOrderAmount(orderAmount);
		os.setPaymentMode(paymentMode);
		os.setOrderDate(new Date());
		orderDao.createOrder(os);
		List<Cart> userCartList = cartDao.retrieveCart(userEmail);
		m.addAttribute(user);
		m.addAttribute("userCartList", userCartList);
		return "invoice";
	}
	
	@RequestMapping(value="user/deleteCart/{cartId}",method=RequestMethod.GET)
	public String deleteCart(@PathVariable("cartId")int cartId,HttpServletRequest request,Model m)
	{
		Cart cart = cartDao.getCart(cartId);
		cartDao.deleteCart(cart);
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		List<Cart> userCartList = cartDao.retrieveCart(userEmail);
		m.addAttribute("userCartList", userCartList);
		return "cart";
	}
	
	@RequestMapping(value="user/ack")
	public String ack(HttpServletRequest request)
	{
		Principal principal = request.getUserPrincipal();
		String userEmail = principal.getName();
		List<Cart> userCartlist =cartDao.retrieveCart(userEmail);
		for(Cart c:userCartlist)
		{
			int cartId = c.getCartId();

			Cart cr=cartDao.getCart(cartId);
			cartDao.deleteCart(cr);
			

		}
		return "acknowledgement";
	}
	@RequestMapping(value="user/goToOrders", method=RequestMethod.GET)
	public String myOders(HttpServletRequest request,Model m)
	{
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		User user=userDao.getUser(userEmail);
		List<Orders> userOrdersList = orderDao.retrieveOrders(userEmail);
		m.addAttribute(user);
		m.addAttribute("userOrdersList", userOrdersList);
		return "myorder";
	}
	
}
