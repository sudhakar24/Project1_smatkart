package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Dao.CategoryDao;
import com.model.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDao categoryDao;
	@RequestMapping(value="admin/AddCategory",method=RequestMethod.POST)
	public String addCategory(@RequestParam("catId") int catId,@RequestParam("catName") String catName,Model m)
	{
		Category category=new Category();
		category.setCatId(catId);
		category.setCatName(catName);
		
		
		m.addAttribute(category);
		categoryDao.addCategory(category);
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		return "category";
	}
	@RequestMapping(value="admin/category",method=RequestMethod.GET)
	public String showCategory(Model m)
	{ 
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		return "category";
	}
	@RequestMapping(value="admin/updateCategory/{catId}",method=RequestMethod.GET)
	public String updateCategory(@PathVariable("catId")int catId,Model m)
	{
		Category category=categoryDao.getCategory(catId);
		m.addAttribute(category);
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		return "updateCategory";
	}
	@RequestMapping(value="admin/UpdateCategory",method=RequestMethod.POST)
	public String updateMyCategory(@ModelAttribute("category")Category category,Model m)
	{	
		
		categoryDao.updateCategory(category);
		Category category1=new Category();
		m.addAttribute(category1);
		
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		
		return "category";
	}
	@RequestMapping(value="admin/deleteCategory/{catId}",method=RequestMethod.GET)
	public String deleteCategory(@PathVariable("catId")int catId,Model m)
	{
		Category category=categoryDao.getCategory(catId);
		categoryDao.deleteCategory(category);
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		return "category";
	}
	

}
