package entities;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-08-24 15:18
 **/

public class Carmessage {
    private int carid;
    private int userid;
    private String username;
    private int sid;
    private String shopname;
    private String shoper;
    private float price;
    private int sell;
    private String photo;

    public Carmessage(){}
    public Carmessage(int userid,String username,int sid,String shopname,String shoper,float price,int sell,String photo){
        this.userid=userid;
        this.username=username;
        this.sid=sid;
        this.shopname=shopname;
        this.shoper=shoper;
        this.price=price;
        this.sell=sell;
        this.photo=photo;
    }

    public int getCarid() {
        return carid;
    }

    public void setCarid(int carid) {
        this.carid = carid;
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

    public int getSell() { return sell; }

    public void setSell(int sell) { this.sell = sell; }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Carmessage{" +
                "carid=" + carid +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", sid=" + sid +
                ", shopname='" + shopname + '\'' +
                ", price=" + price +
                ", sell=" + sell +
                ", photo='" + photo + '\'' +
                '}';
    }
}
