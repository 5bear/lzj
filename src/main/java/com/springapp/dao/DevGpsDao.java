package com.springapp.dao;

import com.springapp.classes.DateUtil;
import com.springapp.entity.GpsBackup;
import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/6/2.
 */
@Repository
public class DevGpsDao extends BaseDao{
    private Timestamp timestamp;
    private Timestamp today;
    private SimpleDateFormat sdf;
    public List<GpsBackup> getByCurrentTrackDevNo(String devIDNO){
        timestamp = new Timestamp(DateUtil.getStartTime());
        try {
            return this.findAll("from GpsBackup as v where devIDNO=? and GPSTime>? group by v.lat,v.lng order by GPSTime asc", GpsBackup.class, devIDNO, timestamp);
        }catch (Exception e){
            return null;
        }finally {
            timestamp=null;
        }
        }
    public List<GpsBackup>getByCurrentQSTrackDevNo(String devIDNO){
        try {
            timestamp=new Timestamp(DateUtil.getStartTime());
            return this.findAll("from GpsBackup as v where devIDNO=? and GPSTime>? group by v.lat,v.lng order by GPSTime asc", GpsBackup.class, devIDNO,timestamp);
        }catch (Exception e){
            return null;
        }finally {
            timestamp=null;
        }
    }
    public GpsBackup getLatestPos(String DevIDNO){
        try{
            today=new Timestamp(DateUtil.getStartTime());
            //from GpsBackup  where id in(SELECT max(id) FROM GpsBackup GROUP BY devIDNO) and  devIDNO in (select vehicle.OBUId from vehicle where vehicle.isDelete=0)
            GpsBackup gpsBackup=this.find("from GpsBackup where id=(select max(id) from GpsBackup where DevIDNO=? and Gpstime>=?)",GpsBackup.class,new Object[]{DevIDNO,today});
            return gpsBackup;
        }catch (Exception e){
            return null;
        }finally {
            today=null;
        }
    }
    public List<GpsBackup>getLatestPos(){
        try{
            today=new Timestamp(DateUtil.getStartTime());
            //from GpsBackup  where id in(SELECT max(id) FROM GpsBackup GROUP BY devIDNO) and  devIDNO in (select vehicle.OBUId from vehicle where vehicle.isDelete=0)
            return this.findAllBySql("select * from GpsBackup  where Gpstime>=? and id in(SELECT max(id) FROM GpsBackup GROUP BY devIDNO) and  devIDNO in (select vehicle.OBUId from vehicle where vehicle.isDelete=0)",GpsBackup.class, today);
        }catch (Exception e){
            return null;
        }finally {
            today=null;
        }
    }
    public List<GpsBackup> getTodayTrack(String company){
        try{
            today=new Timestamp(DateUtil.getStartTime());
            if(company.equals("养护中心"))
                return this.findAllBySql("select * from GpsBackup where DevIDNO in (select vehicle.OBUId from vehicle where vehicle.isDelete=0)  and Gpstime>=? ORDER BY GPSTime asc", GpsBackup.class,today);
            else
                return this.findAllBySql("select * from GpsBackup where DevIDNO in (select vehicle.OBUId from vehicle where vehicle.isDelete=0 and vehicle.company=?)  and Gpstime>=? ORDER BY GPSTime asc", GpsBackup.class,company, today);
        }catch (Exception e){
            return null;
        }finally {
            timestamp=null;
        }
    }
    public List<GpsBackup> getTodayQSTrack(String company){
        try{
            today=new Timestamp(DateUtil.getStartTime());
            if(company.equals("养护中心"))
                return this.findAllBySql("select * from GpsBackup where DevIDNO in (select vehicle.OBUId from vehicle where vehicle.isDelete=0 and vehicle.vehicleType='清扫车') and Gpstime>=? group by lat,lng  ORDER BY GPSTime asc", GpsBackup.class,today);
            else
                return this.findAllBySql("select * from GpsBackup where DevIDNO in (select vehicle.OBUId from vehicle where vehicle.isDelete=0 and vehicle.company=? and vehicle.vehicleType='清扫车')  and Gpstime>=? group by lat,lng ORDER BY GPSTime asc", GpsBackup.class,company, today);
        }catch (Exception e){
            return null;
        }finally {
            timestamp=null;
        }
    }
    /*
    *按车牌查*/
    public List<GpsBackup>getHistoryTrack(String fromDate,String toDate,String param) throws ParseException {
        sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Timestamp from=new Timestamp(sdf.parse(fromDate).getTime());
        Timestamp to=new Timestamp(sdf.parse(toDate).getTime());
        List<GpsBackup>devGPSList=new ArrayList<GpsBackup>();
        try {
            devGPSList = findAll("from GpsBackup as d where d.devIDNO=? and d.GPSTime>=? and d.GPSTime<=? and d.speed>0 group by d.lat,d.lng order by GPSTime asc", GpsBackup.class, param, from, to);
            return devGPSList;
        }catch (Exception e){
            return null;
        }finally {
            from=null;
            to=null;
            sdf=null;
            devGPSList=null;
        }
    }
}
