package mapper;


import entities.Carmessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CarMapper {
    //商品添加至购物车
    public Integer AddCar(Carmessage carmessage);
    //购物车查询
    List<Carmessage> SelectShopCar(@Param("userid") int userid);
    //购物车删除
    public Integer DeleteCar(@Param("carid") int carid);
    //购物车重置
    public Integer DeleteAllCar(@Param("userid") int userid);
    //购物车选中查询
    List<Carmessage> ChooseShopCar(@Param("carid") int carid);
    //购物车订单支付删除
    public Integer ChooseDeleteCar(@Param("carid")int carid,@Param("userid") int userid);
    //修改购物车商品数量
    public Integer AjaxUpdateCar(@Param("carid") int carid,@Param("sell") int sell);
}
