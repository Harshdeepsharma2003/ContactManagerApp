package com.harshdeep.daoimpl;

import com.harshdeep.dao.ContactsDao;
import com.harshdeep.model.Contacts;
import com.harshdeep.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ContactsDaoImpl implements ContactsDao {
    @Override
    public void save(Contacts contacts) throws Exception {
        String sql = "INSERT INTO contacts (contactid,userid,name,phone,email,address,category,isfavorite) VALUES (?, ?, ?, ?,?,?,?,?)";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, contacts.getContactId());
            ps.setString(2, contacts.getUserId());
            ps.setString(3, contacts.getName());
            ps.setString(4, contacts.getPhone());
            ps.setString(5, contacts.getEmail());
            ps.setString(6, contacts.getAddress());
            ps.setString(7, contacts.getCategory());
            ps.setString(8, contacts.getIsFavorite());

            //Test
            ps.executeUpdate();
        }
    }

    @Override
    public boolean existsByContactId(String contactid) throws Exception {
        return false;
    }
}
