package service.impl;

import entities.Shopmessage;
import mapper.IndexMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.IndexService;

import java.util.List;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-06-23 23:39
 **/

@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private IndexMapper indexMapper;

    @Override
    public List<Shopmessage> SelectHotShop() {
        return indexMapper.SelectHotShop();
    }

    @Override
    public List<Shopmessage> SelectNewShop() {
        return indexMapper.SelectNewShop();
    }

    @Override
    public List<Shopmessage> SelectRandShop() {
        return indexMapper.SelectRandShop();
    }

    @Override
    public List<Shopmessage> SelectSearch(String event) {
        return indexMapper.SelectSearch(event);
    }

    @Override
    public List<Shopmessage> SelectNewSearch(String event) {
        return indexMapper.SelectNewSearch(event);
    }

    @Override
    public List<Shopmessage> MoneyUpSearch(String event) {
        return indexMapper.MoneyUpSearch(event);
    }

    @Override
    public List<Shopmessage> MoneyDownSearch(String event) {
        return indexMapper.MoneyDownSearch(event);
    }

}
