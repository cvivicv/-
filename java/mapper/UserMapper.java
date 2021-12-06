package mapper;

import entities.Usermessage;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    //用户登录
    public Integer Login(@Param("username") String username, @Param("password") String password);
    //用户注册
    public Integer Register(Usermessage usermessage);
    //用户名验证
    public Integer AjaxUser(@Param("username") String username);
    //邮箱验证
    public Integer AjaxEmail(@Param("email") String email);
    //通过用户名查询id
    public Integer SelectUserid(@Param("username")String username);
    //查询用户金额
    public Integer SelectUserMoney(int userid);
    //扣除用户金额
    public Integer UpdateUserMoney(Usermessage usermessage);
}
