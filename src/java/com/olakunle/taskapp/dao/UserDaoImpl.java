package com.olakunle.taskapp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.olakunle.taskapp.model.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author olakunle
 */

@Repository("userDao")
public class UserDaoImpl implements UserDao {
    
    @Autowired
    public SessionFactory sessionFactory;
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    @Override
    public boolean saveOrUpdateUser(User user) {
        boolean success = false;
        try {
            this.sessionFactory.getCurrentSession().saveOrUpdate(user);            
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public User findUserById(int id) {
        return (User) this.sessionFactory.getCurrentSession().get(User.class, id);
    }

    @Override
    public List<User> queryUserByPhoneNo(String phoneNo) {
         Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
         
	 //criteria.add(Restrictions.eq("phoneNo",phoneNo));
         criteria.add(Restrictions.like("phoneNumber", phoneNo + "%"));
         criteria.addOrder(Order.asc("id"));
	 
	 return  (List<User>)criteria.list();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<User> findAllUsers() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);

        return criteria.list();
    }

    @Override
    public boolean deleteUser(int id) {
        boolean success = false;
        User user = (User) sessionFactory.getCurrentSession().load(User.class, id);
        if (null != user) {
            this.sessionFactory.getCurrentSession().delete(user);
            success = true;
        }
        return success;
    }

	
}
