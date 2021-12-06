package entities;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-10-19 09:38
 **/

public class Contactmessage {
    private int userid;
    private String username;
    private String truename;
    private String address;
    private String phone;
    public Contactmessage(){}
    public Contactmessage(int userid,String username) {
        this.userid=userid;
        this.username=username;
    }
    public Contactmessage(int userid,String username,String truename,String address,String phone){
        this.userid=userid;
        this.username=username;
        this.truename=truename;
        this.address=address;
        this.phone=phone;
    }


    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Contactmessage{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", truename='" + truename + '\'' +
                ", address='" + address + '\'' +
                ", phone=" + phone +
                '}';
    }
}
