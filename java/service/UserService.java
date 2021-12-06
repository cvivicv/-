package service;

import entities.Usermessage;

public interface UserService {
    //用户登录
    public Integer Login(String username,String password);
    //用户注册
    public Integer Register(Usermessage usermessage);
    //用户名验证
    public Integer AjaxUser(String username);
    //邮箱验证
    public Integer AjaxEmail(String email);
    //通过用户名查询id
    public Integer SelectUserid(String username);
    //查询用户金额
    public Integer SelectUserMoney(int userid);
    //扣除用户金额
    public Integer UpdateUserMoney(Usermessage usermessage);
}
