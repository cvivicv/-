package service;


import entities.Contactmessage;

public interface ContactService {
    //查询用户详细信息
    public Contactmessage SelectContact(int userid);
    //自动添加用户详细信息
    public Integer AddContact(Contactmessage contactmessage);
    //更新用户详细信息
    public Integer UpdateContact(Contactmessage contactmessage);

}
