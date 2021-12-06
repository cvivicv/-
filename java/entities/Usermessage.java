package entities;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-05-18 14:41
 **/

public class Usermessage {
    private int userid;
    private String username;
    private String password;
    private String email;
    private String cometime;
    private double money;

    public Usermessage(){}
    public Usermessage(int userid,String username,String password,String email,String cometime){
        this.userid=userid;
        this.username=username;
        this.password=password;
        this.email=email;
        this.cometime=cometime;
    }
    public Usermessage(String username,String password,String email,String cometime,double money){
        this.username=username;
        this.password=password;
        this.email=email;
        this.cometime=cometime;
        this.money=money;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCometime() {
        return cometime;
    }

    public void setCometime(String cometime) {
        this.cometime = cometime;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Usermessage{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", cometime='" + cometime + '\'' +
                ", money=" + money +
                '}';
    }
}
