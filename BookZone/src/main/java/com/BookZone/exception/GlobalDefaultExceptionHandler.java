package com.BookZone.exception;
import java.io.PrintWriter;
import java.io.StringWriter;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalDefaultExceptionHandler 
{
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handlerNoHandlerFoundException()
	{
		String pageTitle = "BookZone - Error";
		ModelAndView mv = new ModelAndView("errorPage");
		mv.addObject("pageTitle", pageTitle);
		mv.addObject("errorTitle", "The page is not constructed!");
		mv.addObject("errorDescription", "The page you are looking for is not available right now!");
		return mv;
	}
	
	@ExceptionHandler(ProductNotFoundException.class)
	public ModelAndView handlerProductNotFoundException()
	{
		String pageTitle = "BookZone - Error";
		ModelAndView mv = new ModelAndView("errorPage");
		mv.addObject("pageTitle", pageTitle);
		mv.addObject("errorTitle", "The item not available!");
		mv.addObject("errorDescription", "The item you are looking for is not available right now!");
		return mv;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handlerException(Exception ex)
	{
		String pageTitle = "BookZone - Error";
		ModelAndView mv = new ModelAndView("errorPage");
		mv.addObject("pageTitle", pageTitle);
		mv.addObject("errorTitle", "Contact Your Administrator!");
		mv.addObject("errorDescription", ex.toString());
		return mv;
	}
}
