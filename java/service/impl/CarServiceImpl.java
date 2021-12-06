package service.impl;


import entities.Carmessage;
import mapper.CarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CarService;

import java.util.List;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-08-24 15:17
 **/

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarMapper carMapper;

    @Override
    public Integer AddCar(Carmessage carmessage) { return carMapper.AddCar(carmessage); }

    @Override
    public List<Carmessage> SelectShopCar(int userid) {
        return carMapper.SelectShopCar(userid);
    }

    @Override
    public Integer DeleteCar(int carid) {
        return carMapper.DeleteCar(carid);
    }


    @Override
    public Integer DeleteAllCar(int userid) {
        return carMapper.DeleteAllCar(userid);
    }

    @Override
    public List<Carmessage> ChooseShopCar(int carid) {
        return carMapper.ChooseShopCar(carid);
    }

    @Override
    public Integer ChooseDeleteCar(int carid,int userid) {
        return carMapper.ChooseDeleteCar(carid,userid);
    }

    @Override
    public Integer AjaxUpdateCar(int carid, int sell) {
        return carMapper.AjaxUpdateCar(carid,sell);
    }

}
