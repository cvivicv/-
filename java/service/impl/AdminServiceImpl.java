package service.impl;

import entities.Usermessage;
import mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AdminService;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-06-22 17:25
 **/

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public List<Map<String, Object>> SelectUser() {
        return adminMapper.SelectUser();
    }

    @Override
    public Integer AddUser(int userid, String username, String password, String email,String cometime,int money) {
        return adminMapper.AddUser(userid,username,password,email,cometime,money);
    }

    @Override
    public Usermessage SelectOneUser(int userid) {
        return adminMapper.SelectOneUser(userid);
    }

    @Override
    public Integer UpdateUser(int userid,String username,String password,String email,int money) {
        return adminMapper.UpdateUser(userid,username,password,email,money);
    }

    @Override
    public Integer DeleteUser(int userid) {
        return adminMapper.DeleteUser(userid);
    }

}
