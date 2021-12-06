package service;

import entities.Shopmessage;

import java.util.List;

public interface ShopService {
    //查询商品信息
    public List<Shopmessage> SelectShop();
    //添加商品信息
    public Integer AddShop(Shopmessage shopmessage);
    //查询单条商品信息
    public Shopmessage SelectOneShop(int sid);
    //修改商品信息
    public Integer UpdateShop(Shopmessage shopmessage);
    //删除商品信息
    public Integer DeleteShop(int sid);
    //商品详情页推荐商品
    public List<Shopmessage> SelectOneShopDown(Shopmessage shopmessage);
    //查找商品数量
    public Integer SelectStock(int sid);
    //查找商品热度
    public Integer SelectHot(int sid);
}
