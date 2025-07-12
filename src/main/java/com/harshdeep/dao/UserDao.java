package com.harshdeep.dao;

import com.harshdeep.model.User;

public interface UserDao {
    User getUserById(String userId) throws Exception;
     /**
     * Save user to database.
     * @param user User object.
     * @throws Exception on DB errors.
     */
    void save(User user) throws Exception;

    /**
     * Check if a user exists by userId.
     * @param userid user id
     * @return true if exists, false otherwise
     * @throws Exception on DB errors.
     */
    boolean existsByUserId(String userid) throws Exception;

    /**
     * Check if a user exists by email.
     * @param email user email
     * @return true if exists, false otherwise
     * @throws Exception on DB errors.
     */
    boolean existsByEmail(String email) throws Exception;

}
