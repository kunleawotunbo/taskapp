package com.olakunle.taskapp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.olakunle.taskapp.model.User;
import org.hibernate.Query;
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
    public boolean saveUser(User user) {
        boolean success = false;
        try {
            this.sessionFactory.getCurrentSession().saveOrUpdate(user);
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
    
    /*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public boolean updateUser(User user) {
		//User entity = dao.findById(user.getId());
                boolean success = false;
                User entity =  (User) this.sessionFactory.getCurrentSession().get(User.class, user.getId());
		if(entity!=null){			
			entity.setFirstName(user.getFirstName());
			entity.setLastName(user.getLastName());
			entity.setAddress(user.getAddress());
			entity.setPassportPhotograph(user.getPassportPhotograph());
                        entity.setPhoneNumber(user.getPhoneNumber());
                        
                       //  this.sessionFactory.getCurrentSession().update(user);
                        success = true;
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

        return (List<User>) criteria.list();
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

        try {
            //this.sessionFactory.getCurrentSession().createQuery("delete from User where id = "+ id).executeUpdate();    
            Query query = this.sessionFactory.getCurrentSession().createQuery("delete from User where id  = :id");
            query.setInteger("id", id);
            query.executeUpdate();

            success = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

}
