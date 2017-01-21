package com.springapp.dao;

import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 11369 on 2017/1/20.
 */
@Repository
public class ApiDao extends BaseDao {
    public List<Vehicle> vehicleList(String type,String con,String company){
        String hql = "from Vehicle where isDelete=0";
        if (!"0".equals(type.trim())){
            hql+=" and vehicleType='"+type+"'";
        }
        if(!"养护中心".equals(company)){
            hql+=" and company='"+company+"'";
        }
        if (!"".equals(con.trim())){
            hql += " and (company like '%"+con+"%' or vehicleLicense like '%"+con+"%' or vehicleModel like '%"+con+"%')";
        }
        return this.findAll(hql);
    }
}
