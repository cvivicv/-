package service;

import entities.Shopmessage;

import java.util.List;

public interface IndexService {
    //首页查询最为热门的商品信息
    public List<Shopmessage> SelectHotShop();
    //首页查询最为新的商品信息
    public List<Shopmessage> SelectNewShop();
    //首页查询随机的商品信息
    public List<Shopmessage> SelectRandShop();
    //搜索框以及主表单
    public List<Shopmessage> SelectSearch(String event);
    //搜索框以及主表单最新查询
    public List<Shopmessage> SelectNewSearch(String event);
    //搜索框以及主表单价格升序查询
    public List<Shopmessage> MoneyUpSearch(String event);
    //搜索框以及主表单价格降序查询
    public List<Shopmessage> MoneyDownSearch(String event);
}
