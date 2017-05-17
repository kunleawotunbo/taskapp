/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.olakunle.taskapp.service;

import com.olakunle.taskapp.dao.UserDao;
import com.olakunle.taskapp.model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author olakunle
 */

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
    
    @Autowired
    public UserDao userDao;
    
    @Override
    public boolean saveOrUpdateUser(User user) {
        return userDao.saveOrUpdateUser(user);
    }

    @Override
    public User findUserById(int id) {
        return userDao.findUserById(id);
    }

    @Override
    public List<User> queryUserByPhoneNo(String phoneNo) {
       return userDao.queryUserByPhoneNo(phoneNo);
    }

    @Override
    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }

    @Override
    public boolean deleteUser(int id) {
        return userDao.deleteUser(id);
    }
    
}
