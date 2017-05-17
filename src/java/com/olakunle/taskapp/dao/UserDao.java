package com.olakunle.taskapp.dao;

import java.util.List;

import com.olakunle.taskapp.model.User;

/**
 *
 * @author olakunle
 */

public interface UserDao {
    
        public boolean saveOrUpdateUser(User user);
        public User findUserById(int id);
        public List<User> queryUserByPhoneNo(String phoneNo);
        public List<User> findAllUsers();
        public boolean deleteUser(int id);

}

