package com.springapp.dao;

import org.springframework.stereotype.Repository;
import com.springapp.entity.Vehicle;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/4.
 *
 */
@Repository
public class VehicleDao extends BaseDao {
    public Vehicle getById(Long id){
        return this.get(Vehicle.class,id);
    }
    public List<Vehicle> getList(){
        return this.findAll("from Vehicle where isDelete='0'",Vehicle.class);

    }
}
