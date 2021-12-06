package service.impl;

import entities.Purchasemessage;
import mapper.PurchaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.PurchaseService;

import java.util.List;
import java.util.Map;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-10-09 14:50
 **/

@Service
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Override
    public Integer AddPurchase(Purchasemessage purchasemessage) {
        return purchaseMapper.AddPurchase(purchasemessage);
    }

    @Override
    public List<Map<String, Object>> SelectNotDelivered(int userid) {
        return purchaseMapper.SelectNotDelivered(userid);
    }

    @Override
    public List<Map<String, Object>> SelectDelivering(int userid) {
        return purchaseMapper.SelectDelivering(userid);
    }

    @Override
    public List<Map<String, Object>> SelectDelivered(int userid) {
        return purchaseMapper.SelectDelivered(userid);
    }

    @Override
    public List<Map<String, Object>> ShoperNotDelivered(String shopername) {
        return purchaseMapper.ShoperNotDelivered(shopername);
    }

    @Override
    public List<Map<String, Object>> ShoperDelivering(String shopername) {
        return purchaseMapper.ShoperDelivering(shopername);
    }

    @Override
    public List<Map<String, Object>> ShoperDelivered(String shopername) {
        return purchaseMapper.ShoperDelivered(shopername);
    }

    @Override
    public Integer ShoperPurchaseDelivering(int purid) {
        return purchaseMapper.ShoperPurchaseDelivering(purid);
    }
}
