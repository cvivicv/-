package service.impl;

import entities.Shopermessage;
import entities.Shopmessage;
import mapper.ShoperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ShoperService;

import java.util.List;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-11-11 11:31
 **/
@Service
public class ShoperServiceImpl implements ShoperService {
    @Autowired
    private ShoperMapper shoperMapper;
    @Override
    public Integer LoginShoper(String shopername, String password) {
        return shoperMapper.LoginShoper(shopername,password);
    }

    @Override
    public Integer RegisterShoper(Shopermessage shopermessage) {
        return shoperMapper.RegisterShoper(shopermessage);
    }

    @Override
    public Integer AjaxShoper(String shopername) {
        return shoperMapper.AjaxShoper(shopername);
    }

    @Override
    public Integer SelectShoperid(String shopername) {
        return shoperMapper.SelectShoperid(shopername);
    }

    @Override
    public Double SelectShoperMoney(int shoperid) {
        return shoperMapper.SelectShoperMoney(shoperid);
    }

    @Override
    public List<Shopmessage> SelectShoperShop(String shoper) {
        return shoperMapper.SelectShoperShop(shoper);
    }


}
