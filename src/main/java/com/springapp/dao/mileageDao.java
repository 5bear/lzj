package com.springapp.dao;

import com.springapp.classes.DateUtil;
import com.springapp.entity.Line;
import com.springapp.entity.Mileage;
import com.springapp.entity.RFID;
import com.springapp.entity.VehiclePos;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;
import java.util.Vector;

/**
 * Created by 11369 on 2016/7/6.
 */
@Repository
public class MileageDao extends BaseDao {
    public Mileage getByDate(String date, String devIDNO, Line line){
        return this.find("from Mileage where mydate=? and devIDNO=? and line=?", Mileage.class, new Object[]{date,devIDNO,line});
    }
    public List<Mileage> getByDate(String date){
        return this.findAll("from Mileage where mydate=?", Mileage.class, new Object[]{date});
    }
    public List<Mileage> getByLine(String date,String devIDNO){
        return this.findAll("from Mileage where mydate=? and lineID>0 and devIDNO=?", Mileage.class, new Object[]{date,devIDNO});
    }
    public Mileage getCurrent(String date,String devIDNO){
        return this.find("from Mileage where mydate=? and lineID>0 and devIDNO=? and current=1", Mileage.class, new Object[]{date,devIDNO});
    }
    public List<Mileage>getByLine(Line line){
        return this.findAll("from Mileage where line=?",Mileage.class,new Object[]{line});
    }
    public Integer getCount(Long line){
        String sql="select * from RFID where roadId="+line+" group by installPos1";
        List<RFID>rfids=this.findAllBySql(sql,RFID.class);
        return rfids.size();
    }
    public Integer getRealCount(Long line,String devIDNO){
        Timestamp timestamp=new Timestamp(DateUtil.getStartTime());
        String sql="select * from VehiclePos where devIDNO='"+devIDNO+"' and serialNumber in (select serialNumber from RFID where roadId="+line+") and armTime>'"+timestamp+"' group by HDD";
        List<VehiclePos>vehiclePosList=this.findAllBySql(sql,VehiclePos.class);
        return vehiclePosList.size();
    }
}
