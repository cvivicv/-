package mapper;

import entities.Purchasemessage;

import java.util.List;
import java.util.Map;

public interface PurchaseMapper {
    //购物车加入订单
    public Integer AddPurchase(Purchasemessage purchasemessage);
    //用户查询未配送订单
    public List<Map<String, Object>> SelectNotDelivered(int userid);
    //用户查询配送中，已送达订单
    public List<Map<String, Object>> SelectDelivering(int userid);
    //用户查询已接收，已退款订单
    public List<Map<String, Object>> SelectDelivered(int userid);
    //商户查询未配送订单
    public List<Map<String, Object>> ShoperNotDelivered(String shopername);
    //商户查询配送中，已送达订单
    public List<Map<String, Object>> ShoperDelivering(String shopername);
    //商户查询已接收，已退款订单
    public List<Map<String, Object>> ShoperDelivered(String shopername);
    //商户订单未配送->配送中
    public Integer ShoperPurchaseDelivering(int purid);
}
