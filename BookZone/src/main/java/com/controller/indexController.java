package com.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.Dao.UserDao;
import com.model.User;

@Controller
public class indexController 
{
	@Autowired
	UserDao userDao;
	
	@RequestMapping("/")
	public String index()
	{
		return "index";
	}
	
	@RequestMapping("/register")
	public String goToRegister(Model m)
	{
		User user = new User();
		m.addAttribute(user);
		return "register";
	}
	
	@RequestMapping(value="AddUser", method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user")User user, @RequestParam("uimage")MultipartFile fileDetail, Model m)
	{
		userDao.addUser(user);
		String path = "D:\\EclipseProjects\\BookZone\\src\\main\\webapp\\resources\\images\\users\\";
		String totalFilePath = path+String.valueOf(user.getUserid())+".jpg";
		File userImage = new File(totalFilePath);
		if(!fileDetail.isEmpty())
		{
			try
			{
				byte fileBuffer[] = fileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(userImage);
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
		return "index";
	}
}
