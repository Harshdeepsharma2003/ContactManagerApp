package com.harshdeep.service;

import com.harshdeep.model.User;

public interface UserService {

    boolean authenticate(String userId, String password) throws Exception;
    void insertUser(User user) throws Exception;
}
