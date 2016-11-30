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

    public List<MaintainLog> getByvehicleLicense(String vehicleLicense) {
        String hql = "from MaintainLog where isDelete='0' and vehicleLicense=?";
        return this.list(hql,vehicleLicense);
    }

    public MaintainLog getByVDT(String vehicleLicense,String date,String time) {
        String hql = "from MaintainLog where isDelete='0' and vehicleLicense=? and dayTime=? and time=?";
        return (MaintainLog)this.queryObject(hql,new Object[]{vehicleLicense,date,time});
    }

    public Pager<MaintainLog> getPager(String vehicleLicense,String startDate,String endDate){
        String hql ="from MaintainLog where isDelete='0'";
        if (!"".equals(vehicleLicense)){
            hql += " and vehicleLicense='"+vehicleLicense+"'";
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

