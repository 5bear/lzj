package com.springapp.dao;

import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Repository;
import com.springapp.entity.MaintainLog;
import java.util.List;

/**
 * Created by yanglin on 16/4/19.
 */
@Repository
public class MaintainLogDao extends BaseDao{
    public MaintainLog getById(Long id){
        return this.get(MaintainLog.class,id);
    }
    public List<MaintainLog> getList(){
        return this.findAll("from MaintainLog where isDelete='0'",MaintainLog.class);
    }

    public List<MaintainLog> getByVehicleLicence(String vehicleLicence) {
        return this.findAll("from MaintainLog where isDelete='0' and vehicleLicence=?",MaintainLog.class);
    }

}

