package com.harshdeep.dao;

import com.harshdeep.model.Contacts;
import com.harshdeep.model.User;

public interface ContactsDao {

    void save(Contacts contacts) throws Exception;
    boolean existsByContactId(String contactid) throws Exception;
   }
