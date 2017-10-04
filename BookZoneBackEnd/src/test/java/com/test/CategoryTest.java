package com.test;

import static org.junit.Assert.*;

import org.hibernate.SessionFactory;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.Dao.CategoryDao;
import com.hiberConfig.hiberConfig;
import com.model.Category;

public class CategoryTest 
{
	static CategoryDao categoryDAO;
	@BeforeClass
	public static void initialize()
	{
		AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext();
		ac.scan("com");
		ac.refresh();
		
		//SessionFactory sessionFactory = (SessionFactory)ac.getBean("hiberConfig.class");
		categoryDAO = (CategoryDao)ac.getBean("categoryDAO");
	}
	
	@Test
	public void addCategoryTest()
	{
		Category category = new Category();
		category.setCatId(1001);
		category.setCatName("Fiction");
		category.setCatDesc("All books of Fiction type");
		assertTrue(categoryDAO.addCategory(category));
	}
}
