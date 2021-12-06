package service;

import entities.Usermessage;

import java.util.List;
import java.util.Map;

public interface AdminService {
    //查询用户信息
    public List<Map<String, Object>> SelectUser();
    //添加用户信息
    public Integer AddUser(int userid, String username, String password, String email,String cometime,int money);
    //查询单条用户信息
    public Usermessage SelectOneUser(int userid);
    //修改用户信息
    public Integer UpdateUser(int userid,String username,String password,String mail,int money);
    //删除用户信息
    public Integer DeleteUser(int userid);
}
