package com.harshdeep.daoimpl;

import com.harshdeep.dao.UserDao;
import com.harshdeep.model.User;
import com.harshdeep.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDaoImpl implements UserDao {

    @Override
    public User getUserById(String userId) throws Exception {
        String sql = "SELECT userid,username,passwordhash,email FROM users WHERE userid = ?";
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String userName = rs.getString("username");  // Retrieve username from ResultSet
                    String passwordHash = rs.getString("passwordhash");
                    String email = rs.getString("email");
                    return new User(userId, userName, passwordHash,email);
                }
            }
        }
        return null;
    }

    @Override
    public void save(User user) throws Exception {
        String sql = "INSERT INTO users (userid, username, passwordhash, email) VALUES (?, ?, ?, ?)";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUserId());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.executeUpdate();
        }
    }

    @Override
    public boolean existsByUserId(String userid) throws Exception {
        return false;
    }

    @Override
    public boolean existsByEmail(String email) throws Exception {
        return false;
    }
}






