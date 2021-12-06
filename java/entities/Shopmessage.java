package entities;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-06-12 09:43
 **/

public class Shopmessage {
    private int sid;
    private String shopname;
    private String title;
    private String type1;
    private String type2;
    private String shoper;
    private float price;
    private String text;
    private int stock;
    private int hot;
    private String photo;

    public Shopmessage(){}
    public Shopmessage(String shopname,String title,String type1,String type2,String shoper,float price,String text,int stock,int hot,String photo){
        this.shopname=shopname;
        this.title=title;
        this.type1=type1;
        this.type2=type2;
        this.shoper=shoper;
        this.price=price;
        this.text=text;
        this.stock=stock;
        this.hot=hot;
        this.photo=photo;
    }
    public Shopmessage(int sid,String shopname,String title,String type1,String type2,String shoper,float price,String text,int stock,int hot,String photo){
        this.sid=sid;
        this.shopname=shopname;
        this.title=title;
        this.type1=type1;
        this.type2=type2;
        this.shoper=shoper;
        this.price=price;
        this.text=text;
        this.stock=stock;
        this.hot=hot;
        this.photo=photo;
    }

    public Shopmessage(int sid,String shopname, String title, String type1, String type2, float price, String text, int stock, String photo) {
        this.sid=sid;
        this.shopname=shopname;
        this.title=title;
        this.type1=type1;
        this.type2=type2;
        this.price=price;
        this.text=text;
        this.stock=stock;
        this.photo=photo;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType1() {
        return type1;
    }

    public void setType1(String type1) {
        this.type1 = type1;
    }

    public String getType2() {
        return type2;
    }

    public void setType2(String type2) {
        this.type2 = type2;
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

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Shopmessage{" +
                "sid=" + sid +
                ", shopname='" + shopname + '\'' +
                ", title='" + title + '\'' +
                ", type1='" + type1 + '\'' +
                ", type2='" + type2 + '\'' +
                ", shoper='" + shoper + '\'' +
                ", price=" + price +
                ", text='" + text + '\'' +
                ", stock=" + stock +
                ", hot=" + hot +
                ", photo='" + photo + '\'' +
                '}';
    }
}
