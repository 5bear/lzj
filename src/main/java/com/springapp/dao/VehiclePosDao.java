package com.springapp.dao;

import com.springapp.classes.DateUtil;
import com.springapp.entity.Line;
import com.springapp.entity.RFID;
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
        return this.findAll("from VehiclePos as v where devIDNO=? and GpsTime>? and HDD !=?", VehiclePos.class, new Object[]{devIDNO,timestamp,""});
    }
    public List<RFID> getRFIDByCurrentTrackDevNo(String devIDNO){
        Timestamp timestamp=new Timestamp(DateUtil.getStartTime());
        return this.findAllBySql("select r.* from VehiclePos as v,RFID as r where v.devIDNO=? and v.GpsTime>? and v.HDD !=? and r.serialNumber = v.serialNumber and r.isDelete=0 group by r.serialNumber", RFID.class, new Object[]{devIDNO,timestamp,""});
    }
    public List<VehiclePos> getAllAlarm(){
        Timestamp timestamp=new Timestamp(DateUtil.getStartTime());
        return this.findAll("from VehiclePos as v where GpsTime>?", VehiclePos.class, new Object[]{timestamp});
    }

    /**
     * 获得最新RFID数据
     * @param DevIDNO
     * @param line
     * @return
     */
    public VehiclePos getLatestPos(String DevIDNO, Line line){
        Timestamp timestamp=this.find("select max(v.gpsTime) from VehiclePos as v where devIDNO=?",Timestamp.class,new Object[]{DevIDNO});
        return this.find("from VehiclePos where  devIDNO=? and GpsTime=? and serialNumber in (select serialNumber from RFID where roadId=?)", VehiclePos.class,new Object[]{DevIDNO,timestamp,line.getId()});
    }
    public List<VehiclePos> getLatestPos(String DevIDNO){
        Timestamp timestamp=this.find("select max(v.gpsTime) from VehiclePos as v where devIDNO=?",Timestamp.class,new Object[]{DevIDNO});
        return this.findAll("from VehiclePos where  devIDNO=? and GpsTime=?", VehiclePos.class,new Object[]{DevIDNO,timestamp});
    }
}
