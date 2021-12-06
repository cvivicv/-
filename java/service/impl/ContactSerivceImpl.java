package service.impl;

import entities.Contactmessage;
import mapper.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ContactService;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-10-19 09:51
 **/
@Service
public class ContactSerivceImpl implements ContactService {
    @Autowired
    private ContactMapper contactMapper;

    @Override
    public Contactmessage SelectContact(int userid) {
        return contactMapper.SelectContact(userid);
    }

    @Override
    public Integer AddContact(Contactmessage contactmessage) {
        return contactMapper.AddContact(contactmessage);
    }

    @Override
    public Integer UpdateContact(Contactmessage contactmessage) {
        return contactMapper.UpdateContact(contactmessage);
    }
}
