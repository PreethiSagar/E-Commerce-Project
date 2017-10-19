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
		Supplier supplier = new Supplier();
		m.addAttribute(supplier);
		List<Supplier> listSupplier = supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "supplier";
	}
	
	@RequestMapping(value="AddSupplier", method=RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier")Supplier supplier, Model m)
	{
		supplierDao.addSupplier(supplier);
		List<Supplier> listSupplier = supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "supplier";
	}
	
	@RequestMapping(value="/deleteSupplier/{supplierId}", method=RequestMethod.GET)
	public String deleteSupplier(@PathVariable("supplierId")int supplierId, Model m)
	{
		Supplier supplier = supplierDao.getSupplier(supplierId);
		supplierDao.deleteSupplier(supplier);
		List<Supplier> listSupplier = supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "supplier";
	}
}
