package service.impl;

import entities.Usermessage;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-06-22 17:26
 **/

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Integer Login(String username, String password) {
        return userMapper.Login(username,password);
    }

    @Override
    public Integer Register(Usermessage usermessage) {
        return userMapper.Register(usermessage);
    }

    @Override
    public Integer AjaxUser(String username) {
        return userMapper.AjaxUser(username);
    }

    @Override
    public Integer AjaxEmail(String email) {
        return userMapper.AjaxEmail(email);
    }

    @Override
    public Integer SelectUserid(String username) { return userMapper.SelectUserid(username); }

    @Override
    public Integer SelectUserMoney(int userid) {
        return userMapper.SelectUserMoney(userid);
    }

    @Override
    public Integer UpdateUserMoney(Usermessage usermessage) {
        return userMapper.UpdateUserMoney(usermessage);
    }


}
