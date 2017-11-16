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

import com.Dao.SupplierDao;
import com.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	SupplierDao supplierDao;
	@RequestMapping(value="admin/AddSupplier",method=RequestMethod.POST)
	public String addSupplier(@RequestParam("supplierId") int supplierId,@RequestParam("supplierName") String supplierName,@RequestParam("supplierDes") String supplierDes,@RequestParam("supplierEmail")String supplierEmail,Model m)
	{
		Supplier supplier=new Supplier();
		supplier.setSupplierId(supplierId);
		supplier.setSupplierName(supplierName);
		supplier.setSupplierDes(supplierDes);
		supplier.setSupplierEmail(supplierEmail);
		m.addAttribute(supplier);
		
		supplierDao.addSupplier(supplier);
		List<Supplier> listSupplier=supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		
		return "supplier";
	}
	@RequestMapping(value="admin/supplier",method=RequestMethod.GET)
	public String showSupplier(Model m)
	{ 
		
		List<Supplier> listSupplier=supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "supplier";
	}
	
	@RequestMapping(value="admin/updateSupplier/{supplierId}",method=RequestMethod.GET)
	public String updateSupplier(@PathVariable("supplierId")int supplierId,Model m)
	{
		Supplier supplier=supplierDao.getSupplier(supplierId);
		m.addAttribute(supplier);
		List<Supplier> listSupplier=supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "updateSupplier";
	}
	@RequestMapping(value="admin/UpdateSupplier",method=RequestMethod.POST)
	public String updateMySupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	{	
		
		supplierDao.updateSupplier(supplier);
		Supplier supplier1=new Supplier();
		m.addAttribute(supplier1);
		
		List<Supplier> listSupplier=supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		
		return "supplier";
	}
	
	@RequestMapping(value="admin/deleteSupplier/{supplierId}",method=RequestMethod.GET)
	public String deleteSupplier(@PathVariable("supplierId")int supplierId,Model m)
	{
		Supplier supplier=supplierDao.getSupplier(supplierId);
		supplierDao.deleteSupplier(supplier);
		List<Supplier> listSupplier=supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "supplier";
	}
	
	
}