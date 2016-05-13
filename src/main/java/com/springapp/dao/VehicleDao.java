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
        return this.findAll("from Vehicle where isDelete=0",Vehicle.class);

    }
    public Vehicle getByVehicleLicence(String vehicleLicence)
    {
        return this.find("from Vehicle where isDelete=0 and vehicleLicence='"+vehicleLicence+"'",Vehicle.class);
    }

    public List<Vehicle> getCList(){
        return this.findAll(("from Vehicle where isDelete=0 and company='上海成基公司'"),Vehicle.class);
    }

    public List<Vehicle> getGList(){
        return this.findAll(("from Vehicle where isDelete=0 and company='上海养护公司'"),Vehicle.class);
    }

    public List<Vehicle> getXList(){
        return this.findAll(("from Vehicle where isDelete=0 and vehicleType='巡视车'"),Vehicle.class);
    }

    public List<Vehicle> getYList(){
        return this.findAll(("from Vehicle where isDelete=0 and vehicleType='清扫车'"),Vehicle.class);
    }

    public List<Vehicle> getQList(){
        return this.findAll(("from Vehicle where isDelete=0 and vehicleType='牵引车'"),Vehicle.class);
    }

    public List<Vehicle> getCyList(){
        return this.findAll("from Vehicle where isDelete=0 and company='上海成基公司' and vehicleType='清扫车'",Vehicle.class);
    }
    public List<Vehicle> getCqList(){
        return this.findAll("from Vehicle where isDelete=0 and company='上海成基公司' and vehicleType='牵引车'",Vehicle.class);
    }
    public List<Vehicle> getCxList(){
        return this.findAll("from Vehicle where isDelete=0 and company='上海成基公司' and vehicleType='巡视车'",Vehicle.class);
    }
    public List<Vehicle> getGyList(){
        return this.findAll("from Vehicle where isDelete=0 and company='上海高架公司' and vehicleType='清扫车'",Vehicle.class);
    }
    public List<Vehicle> getGqList(){
        return this.findAll("from Vehicle where isDelete=0 and company='上海高架公司' and vehicleType='牵引车'",Vehicle.class);
    }
    public List<Vehicle> getGxList(){
        return this.findAll("from Vehicle where isDelete=0 and company='上海高架公司' and vehicleType='巡视车'",Vehicle.class);
    }
    public List<Vehicle>getByeFence(Long id){
        return this.findAll("from Vehicle where eFenceId=? and isDelete=0",Vehicle.class,new Object[]{id});
    }
}
