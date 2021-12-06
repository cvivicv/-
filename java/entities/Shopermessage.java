package entities;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-11-10 13:03
 **/

public class Shopermessage {
    private int shoperid;
    private String shopername;
    private String password;
    private double money;

    public Shopermessage(){}
    public Shopermessage(String shopername,String password,Double money){
        this.shopername=shopername;
        this.password=password;
        this.money=money;
    }

    public int getShoperid() {
        return shoperid;
    }

    public void setShoperid(int shoperid) {
        this.shoperid = shoperid;
    }

    public String getShopername() {
        return shopername;
    }

    public void setShopername(String shopername) {
        this.shopername = shopername;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }
}
