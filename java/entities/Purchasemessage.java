package entities;
/**
*@program: Antenna
*@author:Mr.C
*@@create: 2021-10-20 11:44
**/

public class Purchasemessage {
    private int purid;
    private int userid;
    private String username;
    private int sid;
    private String shopname;
    private String shoper;
    private float price;
    private int sell;
    private String photo;
    private int receiving;
    private String creation_time;
    private String truename;
    private String address;
    private String phone;

    public Purchasemessage(){}

    public Purchasemessage(int sid, String shopname,String shoper, Integer userid, String username, float price, int sell, String photo, int receiving, String creation_time, String truename, String address, String phone) {
        this.sid=sid;
        this.shopname=shopname;
        this.userid=userid;
        this.username=username;
        this.shoper=shoper;
        this.price=price;
        this.sell=sell;
        this.photo=photo;
        this.receiving=receiving;
        this.creation_time=creation_time;
        this.truename=truename;
        this.address=address;
        this.phone=phone;
    }


    public int getPurid() {
        return purid;
    }

    public void setPurid(int purid) {
        this.purid = purid;
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

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public String getShoper() {
        return shoper;
    }

    public void setShoper(String shoper) {
        this.shoper = shoper;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getSell() {
        return sell;
    }

    public void setSell(int sell) {
        this.sell = sell;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getReceiving() {
        return receiving;
    }

    public void setReceiving(int receiving) {
        this.receiving = receiving;
    }

    public String getCreation_time() {
        return creation_time;
    }

    public void setCreation_time(String creation_time) {
        this.creation_time = creation_time;
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
        return "Purchasemessage{" +
                "purid=" + purid +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", sid=" + sid +
                ", shopname='" + shopname + '\'' +
                ", price=" + price +
                ", sell=" + sell +
                ", photo='" + photo + '\'' +
                ", receving=" + receiving +
                ", creation_time='" + creation_time + '\'' +
                ", truename='" + truename + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
