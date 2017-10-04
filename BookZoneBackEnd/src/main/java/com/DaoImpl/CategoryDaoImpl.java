package com.DaoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.CategoryDao;
import com.model.Category;

@Repository("categoryDAO")
public class CategoryDaoImpl implements CategoryDao
{
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public boolean addCategory(Category category) 
	{
		try
		{
			sessionFactory.getCurrentSession().saveOrUpdate(category);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}

	public List<Category> retrieveCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean deleteCategory(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

	public Category getCategory(int catId) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean updateCategory(Category category) {
		// TODO Auto-generated method stub
		return false;
	}
}
