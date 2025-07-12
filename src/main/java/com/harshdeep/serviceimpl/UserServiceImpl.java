package com.harshdeep.serviceimpl;

import com.harshdeep.dao.UserDao;
import com.harshdeep.daoimpl.UserDaoImpl;
import com.harshdeep.model.User;
import com.harshdeep.service.UserService;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    @Override
    public boolean authenticate(String userId, String password) throws Exception
    {
        User user = userDao.getUserById(userId);
        if (user != null && user.getPassword() != null) {
            // User exists, check password
            System.out.println("Retrieved user: " + user);
            System.out.println("User password: " + user.getPassword());

            return password != null && password.trim().equals(user.getPassword().trim());

        } else {
            // User does not exist, signal to redirect to registration page
            System.out.println("Found user password: " + (user != null ? user.getPassword() : "No user found"));

            return false;

        }
    }

    @Override
    public void insertUser(User user) throws Exception {
        // Server-side validation
       // validateUser(user);

        // Check if userId or email already exists
        if (userDao.existsByUserId(user.getUserId())) {
            throw new IllegalArgumentException("User ID already exists.");
        }
        if (userDao.existsByEmail(user.getEmail())) {
            throw new IllegalArgumentException("Email already registered.");
        }
        System.out.println("Saving user with ID: " + user.getUserId());

        // Save user to DB
        userDao.save(user);
    }

}



