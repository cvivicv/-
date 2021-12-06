package service;

import entities.Carmessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CarService {
    //商品添加至购物车
    public Integer AddCar(Carmessage carmessage);
    //购物车查询
    List<Carmessage> SelectShopCar(int userid);
    //购物车删除
    public Integer DeleteCar(int carid);
    //购物车重置
    public Integer DeleteAllCar(int userid);
    //购物车选中查询
    List<Carmessage> ChooseShopCar(int carid);
    //购物车订单支付删除
    public Integer ChooseDeleteCar(int carid,int userid);
    //修改购物车商品数量
    public Integer AjaxUpdateCar(@Param("carid") int carid,@Param("sell") int sell);
}
