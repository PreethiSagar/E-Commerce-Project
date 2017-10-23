package com.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Dao.CategoryDao;
import com.Dao.ProductDao;
import com.Dao.SupplierDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
public class productController 
{
	@Autowired
	ProductDao productDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	SupplierDao supplierDao;
	
	@RequestMapping(value="/product", method=RequestMethod.GET)
	public String showProduct(Model m)
	{
		String pageTitle = "BookZone - Product";
		m.addAttribute("pageTitle", pageTitle);
		Product product = new Product();
		m.addAttribute(product);
		List<Product> listProduct = productDao.retrieveProduct();
		m.addAttribute("productList",listProduct);
		m.addAttribute("categoryList",this.getCategories());
		m.addAttribute("supplierList",this.getSuppliers());
		return "product";
	}
	
	public LinkedHashMap<Integer,String> getCategories()
	{
		List<Category> listCategories = categoryDao.retrieveCategory();
		LinkedHashMap<Integer,String> categoriesList = new LinkedHashMap<Integer,String>();
		for(Category category:listCategories)
		{
			categoriesList.put(category.getCatId(), category.getCatName());
		}
		return categoriesList;
	}
	
	public LinkedHashMap<Integer,String> getSuppliers()
	{
		List<Supplier> listSuppliers = supplierDao.retrieveSupplier();
		LinkedHashMap<Integer,String> suppliersList = new LinkedHashMap<Integer,String>();
		for(Supplier supplier:listSuppliers)
		{
			suppliersList.put(supplier.getSupplierId(), supplier.getSupplierName());
		}
		return suppliersList;
	}
	
	@RequestMapping(value="AddProduct", method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product")Product product, @RequestParam("pimage")MultipartFile fileDetail, Model m)
	{
		String pageTitle = "BookZone - Product";
		m.addAttribute("pageTitle", pageTitle);
		productDao.addProduct(product);
		String path = "D:\\EclipseProjects\\BookZone\\src\\main\\webapp\\resources\\images\\products\\";
		String totalFilePath = path+String.valueOf(product.getProductId())+".jpg";
		File productImage = new File(totalFilePath);
		if(!fileDetail.isEmpty())
		{
			try
			{
				byte fileBuffer[] = fileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(productImage);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(fileBuffer);;
				bs.close();
			}
			catch(Exception e)
			{
				m.addAttribute("error", e.getMessage());
			}
		}
		else
		{
			m.addAttribute("error", "Problem in file uploading.");
		}
		List<Product> listProduct = productDao.retrieveProduct();
		m.addAttribute("productList",listProduct);
		return "product";
	}
	
	@RequestMapping(value="updateProduct/{productId}", method=RequestMethod.GET)
	public String updateProduct(@PathVariable("productId")int productId, Model m)
	{
		String pageTitle = "BookZone - Product Update";
		m.addAttribute("pageTitle", pageTitle);
		Product product = productDao.getProduct(productId);
		m.addAttribute(product);
		List<Product> listProduct = productDao.retrieveProduct();
		m.addAttribute("productList",listProduct);
		m.addAttribute("categoryList",this.getCategories());
		m.addAttribute("supplierList",this.getSuppliers());
		return "updateProduct";
	}
	
	@RequestMapping(value="UpdateProduct", method=RequestMethod.POST)
	public String updateMyProduct(@ModelAttribute("product")Product product, @RequestParam("pimage")MultipartFile fileDetail, Model m)
	{
		String pageTitle = "BookZone - Product";
		m.addAttribute("pageTitle", pageTitle);
		productDao.updateProduct(product);
		Product product1 = new Product();
		m.addAttribute(product1);
		String path = "D:\\EclipseProjects\\BookZone\\src\\main\\webapp\\resources\\images\\products\\";
		String totalFilePath = path+String.valueOf(product.getProductId())+".jpg";
		File productImage = new File(totalFilePath);
		if(!fileDetail.isEmpty())
		{
			try
			{
				byte fileBuffer[] = fileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(productImage);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(fileBuffer);;
				bs.close();
			}
			catch(Exception e)
			{
				m.addAttribute("error", e.getMessage());
			}
		}
		else
		{
			m.addAttribute("error", "Problem in file uploading.");
		}
		List<Product> listProduct = productDao.retrieveProduct();
		m.addAttribute("productList",listProduct);
		m.addAttribute("categoryList",this.getCategories());
		m.addAttribute("supplierList",this.getSuppliers());
		return "product";
	}
	
	@RequestMapping(value="/deleteProduct/{productId}", method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId")int productId, Model m)
	{
		String pageTitle = "BookZone - Product";
		m.addAttribute("pageTitle", pageTitle);
		Product product = productDao.getProduct(productId);
		productDao.deleteProduct(product);
		List<Product> listProduct = productDao.retrieveProduct();
		m.addAttribute("productList",listProduct);
		Product product1 = new Product();
		m.addAttribute(product1);
		return "product";
	}
	
	@RequestMapping(value="/viewProduct/{productId}", method=RequestMethod.GET)
	public String viewProduct(@PathVariable("productId")int productId, Model m)
	{
		String pageTitle = "BookZone - Product detail";
		m.addAttribute("pageTitle", pageTitle);
		Product product = productDao.getProduct(productId);
		m.addAttribute(product);
		return "productDetail";
	}
}
