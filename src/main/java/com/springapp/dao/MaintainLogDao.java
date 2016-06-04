package com.springapp.dao;

import com.springapp.classes.model.Pager;
import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Repository;
import com.springapp.entity.MaintainLog;
import java.util.List;

@Repository
public class MaintainLogDao extends BaseDao1<MaintainLog>{
    public MaintainLog getById(Long id){
        return this.get(id);
    }
    public List<MaintainLog> getList(){
        String hql = "from MaintainLog where isDelete='0'";
        return this.list(hql);
    }

    public List<MaintainLog> getByVehicleLicence(String vehicleLicence) {
        String hql = "from MaintainLog where isDelete='0' and vehicleLicence=?";
        return this.list(hql,vehicleLicence);
    }

    public MaintainLog getByVDT(String vehicleLicence,String date,String time) {
        String hql = "from MaintainLog where isDelete='0' and vehicleLicence=? and dayTime=? and time=?";
        return (MaintainLog)this.queryObject(hql,new Object[]{vehicleLicence,date,time});
    }

    public Pager<MaintainLog> getPager(String vehicleLicence,String startDate,String endDate){
        String hql ="from MaintainLog where isDelete='0'";
        if (!"".equals(vehicleLicence)){
            hql += " and vehicleLicence='"+vehicleLicence+"'";
        }

        if (!"".equals(startDate)){
            hql+=" and dayTime>='"+startDate+"'";
        }
        if (!"".equals(endDate)){
            hql+=" and dayTime<='"+endDate+"'";
        }

        return this.find(hql);
    }

}

