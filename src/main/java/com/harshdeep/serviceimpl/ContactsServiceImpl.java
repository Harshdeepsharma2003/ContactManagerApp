package com.harshdeep.serviceimpl;

import com.harshdeep.dao.ContactsDao;
import com.harshdeep.daoimpl.ContactsDaoImpl;
import com.harshdeep.model.Contacts;
import com.harshdeep.service.ContactsService;

public class ContactsServiceImpl implements ContactsService {

    private ContactsDao contactsDao=new ContactsDaoImpl();

    @Override
    public void insertContact(Contacts contacts) throws Exception {
        //business logic - validation

        // Server-side validation
        // validateUser(user);

        // Check if userId or email already exists
        if (contactsDao.existsByContactId(contacts.getUserId())) {
            throw new IllegalArgumentException("User ID already exists.");
        }

        System.out.println("Saving contact with ID: " + contacts.getContactId());

        // Save user to DB
           contactsDao.save(contacts);

    }
}
