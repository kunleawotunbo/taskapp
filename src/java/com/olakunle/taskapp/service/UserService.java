package com.olakunle.taskapp.service;

import java.util.List;

import com.olakunle.taskapp.model.User;

/**
 *
 * @author olakunle
 */
public interface UserService {
	
	public boolean saveUser(User user);
        public boolean updateUser(User user);
        public User findUserById(int id);
        public List<User> queryUserByPhoneNo(String phoneNo);
        public List<User> findAllUsers();
        public boolean deleteUser(int id);
}