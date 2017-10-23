package com.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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
	public String index(Model m)
	{
		String pageTitle = "BookZone - Home";
		m.addAttribute("pageTitle", pageTitle);
		return "index";
	}
	
	@RequestMapping("/goToLogin")
	public String goToLogin(Model m)
	{
		String pageTitle = "BookZone - Login";
		m.addAttribute("pageTitle", pageTitle);
		User user = new User();
		m.addAttribute(user);
		return "login";
	}
	
	@RequestMapping("/userLogged")
	public String userLogged(Model m, HttpSession session)
	{
		String pageTitle = "BookZone - Home";
		m.addAttribute("pageTitle", pageTitle);
		
		String roleName=null;
		boolean loggedIn=false;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loggedUsername = auth.getName();
		session.setAttribute("username", loggedUsername);
		Collection<GrantedAuthority> auths = (Collection<GrantedAuthority>)auth.getAuthorities();
		for(GrantedAuthority role:auths)
		{
			if(role.getAuthority().equals("ROLE_ADMIN"))
			{
				loggedIn = true;
				roleName = "admin";
			}
			else
			{
				loggedIn = true;
				roleName = "user";
			}
		}
		session.setAttribute("loggedIn", loggedIn);
		session.setAttribute("roleName", roleName);
		
		return "redirect:/";
	}
	
	@RequestMapping("/error")
	public String error(Model m)
	{
		String pageTitle = "BookZone - Error";
		m.addAttribute("pageTitle", pageTitle);
		return "error";
	}
	
	@RequestMapping("/register")
	public String goToRegister(Model m)
	{
		String pageTitle = "BookZone - Sign Up";
		m.addAttribute("pageTitle", pageTitle);
		User user = new User();
		m.addAttribute(user);
		return "register";
	}
	
	@RequestMapping(value="AddUser", method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user")User user, @RequestParam("uimage")MultipartFile fileDetail, Model m)
	{
		String pageTitle = "BookZone - Home";
		m.addAttribute("pageTitle", pageTitle);
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
