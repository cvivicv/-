package mapper;

import entities.Usermessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AdminMapper {
    //查询用户信息
    public List<Map<String, Object>> SelectUser();
    //添加用户信息
    public Integer AddUser(@Param("userid") int userid,@Param("username") String username,@Param("password") String password,@Param("email") String email,@Param("cometime") String cometime,@Param("money")int money);
    //查询单条用户信息
    public Usermessage SelectOneUser(@Param("userid")int userid);
    //修改用户信息
    public Integer UpdateUser(@Param("userid") int userid,@Param("username") String username,@Param("password") String password,@Param("email") String email,@Param("money")int money);
    //删除用户信息
    public Integer DeleteUser(@Param("userid")int userid);
}
