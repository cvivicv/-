package mapper;

import entities.Shopermessage;
import entities.Shopmessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShoperMapper {
    //商户登录
    public Integer LoginShoper(@Param("shopername")String shopername, @Param("password")String password);
    //商户注册
    public Integer RegisterShoper(Shopermessage shopermessage);
    //商户名验证
    public Integer AjaxShoper(String shopername);
    //通过商户名查询id
    public Integer SelectShoperid(String shopername);
    //通过商户id查询商户金额
    public Double SelectShoperMoney(int shoperid);
    //通过商户名查询商品信息
    public List<Shopmessage> SelectShoperShop(@Param("shoper")String shoper);
}
