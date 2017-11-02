package com.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.Dao.SupplierDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
public class supplierController 
{
	@Autowired
	SupplierDao supplierDao;
	
	@RequestMapping(value="/supplier", method=RequestMethod.GET)
	public String showSupplier(Model m)
	{
		String pageTitle = "BookZone - Supplier";
		m.addAttribute("pageTitle", pageTitle);
		Supplier supplier = new Supplier();
		m.addAttribute(supplier);
		List<Supplier> listSupplier = supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "supplier";
	}
	
	@RequestMapping(value="AddSupplier", method=RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier")Supplier supplier, Model m)
	{
		String pageTitle = "BookZone - Supplier";
		m.addAttribute("pageTitle", pageTitle);
		supplierDao.addSupplier(supplier);
		List<Supplier> listSupplier = supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		Supplier supplier1 = new Supplier();
		m.addAttribute(supplier1);
		return "supplier";
	}
	
	@RequestMapping(value="updateSupplier/{supplierId}", method=RequestMethod.GET)
	public String updateSupplier(@PathVariable("supplierId")int supplierId, Model m)
	{
		String pageTitle = "BookZone - Supplier Update";
		m.addAttribute("pageTitle", pageTitle);
		Supplier supplier = supplierDao.getSupplier(supplierId);
		m.addAttribute(supplier);
		List<Supplier> listSupplier = supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "updateSupplier";
	}
	
	@RequestMapping(value="UpdateSupplier", method=RequestMethod.POST)
	public String updateMySupplier(@ModelAttribute("supplier")Supplier supplier, Model m)
	{
		String pageTitle = "BookZone - Supplier";
		m.addAttribute("pageTitle", pageTitle);
		supplierDao.updateSupplier(supplier);
		Supplier supplier1 = new Supplier();
		m.addAttribute(supplier1);
		List<Supplier> listSupplier = supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "supplier";
	}
	
	@RequestMapping(value="/deleteSupplier/{supplierId}", method=RequestMethod.GET)
	public String deleteSupplier(@PathVariable("supplierId")int supplierId, Model m)
	{
		String pageTitle = "BookZone - Supplier";
		m.addAttribute("pageTitle", pageTitle);
		Supplier supplier = supplierDao.getSupplier(supplierId);
		supplierDao.deleteSupplier(supplier);
		List<Supplier> listSupplier = supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		Supplier supplier1 = new Supplier();
		m.addAttribute(supplier1);
		return "supplier";
	}
	
	@RequestMapping(value="/viewSupplier/{supplierId}", method=RequestMethod.GET)
	public String viewSupplier(@PathVariable("supplierId")int supplierId, Model m)
	{
		String pageTitle = "BookZone - Supplier Detail";
		m.addAttribute("pageTitle", pageTitle);
		Supplier supplier = supplierDao.getSupplier(supplierId);
		m.addAttribute(supplier);
		return "supplierDetail";
	}
}
