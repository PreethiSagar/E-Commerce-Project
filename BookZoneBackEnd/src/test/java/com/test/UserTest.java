package com.test;

import static org.junit.Assert.*;

import org.hibernate.SessionFactory;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.hiberConfig.hiberConfig;

public class UserTest {
	
	@BeforeClass
	public static void initialize()
	{
		AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext();
		ac.scan("com");
		ac.refresh();
		
		SessionFactory sessionFactory = (SessionFactory)ac.getBean("hiberConfig.class");
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
