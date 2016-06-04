package com.springapp.dao;

import com.springapp.entity.Position;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/4.
 *
 */
@Repository
public class PositionDao extends BaseDao {
    public List<Position> getList(){
        return this.findAll("from Position",Position.class);
    }
    public List<Position> getListByVehicle(Long vehicle){
        return this.findAll("from Position where vehicleId=?",Position.class,new Object[]{vehicle});
    }

}
