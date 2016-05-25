package com.springapp.dao;

import com.springapp.classes.DateUtil;
import com.springapp.entity.VehiclePos;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/11.
 */
@Repository
public class VehiclePosDao extends BaseDao {
    public List<VehiclePos> getByCurrentTrackDevNo(String devIDNO){
        Timestamp timestamp=new Timestamp(DateUtil.getStartTime());
        return this.findAll("from VehiclePos as v where devIDNO=? and GpsTime>?", VehiclePos.class, new Object[]{devIDNO,timestamp});
    }
    public VehiclePos getLatestPos(String DevIDNO){
        Timestamp timestamp=this.find("select max(v.gpsTime) from VehiclePos as v where devIDNO=?",Timestamp.class,new Object[]{DevIDNO});
        return this.find("from VehiclePos where  devIDNO=? and GpsTime=?", VehiclePos.class,new Object[]{DevIDNO,timestamp});
    }
}
