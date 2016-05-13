package com.springapp.dao;

import com.springapp.entity.VehiclePos;
import org.springframework.stereotype.Repository;

/**
 * Created by ZhanShaoxiong on 2016/5/11.
 */
@Repository
public class VehiclePosDao extends BaseDao {
    public VehiclePos getByDevNo(String devIDNO){
        return this.find("from VehiclePos where devIDNO=?",VehiclePos.class,new Object[]{devIDNO});
    }
}
