package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.UserDao;
import com.model.User;

@Controller
public class indexController {
	
	@Autowired
	UserDao userDao;
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	@RequestMapping(value="/index")
	public String in()
	{
		return "index";
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public ModelAndView goToRegister()
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("user",new User());
		mv.setViewName("register");
		return mv;
		
	}
	@RequestMapping(value="/saveRegister", method=RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute("user")User user)
	{
		ModelAndView mv=new ModelAndView();
		user.setRole("ROLE_USER");
		user.setEnabled("1");
		userDao.addUser(user);
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/goToLogin")
	public ModelAndView goToLogin()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping("/userLogged")
	public String userLogged()
	{
		return "redirect:index";
	}
	
	@RequestMapping("/error")
	public String errorPage()
	{
		return "error";
	}
	@RequestMapping("/accessdenied")
	public String accessdenied()
	{
		return "accessdenied";
	}
	
}
