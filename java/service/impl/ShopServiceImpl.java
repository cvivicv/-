package service.impl;

import entities.Shopmessage;
import mapper.ShopMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ShopService;

import java.util.List;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-06-22 17:25
 **/

@Service
public class ShopServiceImpl implements ShopService {

    @Autowired
    private ShopMapper shopMapper;

    @Override
    public List<Shopmessage> SelectShop() {
        return shopMapper.SelectShop();
    }

    @Override
    public Integer AddShop(Shopmessage shopmessage) {
        return shopMapper.AddShop(shopmessage);
    }

    @Override
    public Shopmessage SelectOneShop(int sid) {
        return shopMapper.SelectOneShop(sid);
    }

    @Override
    public Integer UpdateShop(Shopmessage shopmessage) {
        return shopMapper.UpdateShop(shopmessage);
    }

    @Override
    public Integer DeleteShop(int sid) {
        return shopMapper.DeleteShop(sid);
    }

    @Override
    public List<Shopmessage> SelectOneShopDown(Shopmessage shopmessage) {
        return shopMapper.SelectOneShopDown(shopmessage);
    }

    @Override
    public Integer SelectStock(int sid) {
        return shopMapper.SelectStock(sid);
    }

    @Override
    public Integer SelectHot(int sid) {
        return shopMapper.SelectHot(sid);
    }

}
