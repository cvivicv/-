package mapper;

import entities.Contactmessage;
import org.apache.ibatis.annotations.Param;

public interface ContactMapper {
    //查询用户详细信息
    public Contactmessage SelectContact(@Param("userid") int userid);
    //自动添加用户详细信息
    public Integer AddContact(Contactmessage contactmessage);
    //更新用户详细信息
    public Integer UpdateContact(Contactmessage contactmessage);
}
