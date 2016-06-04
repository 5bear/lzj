package com.springapp.dao;

import com.springapp.classes.DateUtil;
import com.springapp.entity.DevGPS;
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
    public List<DevGPS> getByCurrentTrackDevNo(String devIDNO){
        Timestamp timestamp=new Timestamp(DateUtil.getStartTime());
        return this.findAll("from DevGPS as v where devIDNO=? and GPSTime>?", DevGPS.class, new Object[]{devIDNO,timestamp});
    }
    public DevGPS getLatestPos(String DevIDNO){
        Timestamp timestamp=this.find("select max(v.GPSTime) from DevGPS as v where devIDNO=?",Timestamp.class,new Object[]{DevIDNO});
        return this.find("from DevGPS where  devIDNO=? and GPSTime=?", DevGPS.class,new Object[]{DevIDNO,timestamp});
    }
    /*
    *按车牌查*/
    public List<DevGPS>getHistoryTrack(String fromDate,String toDate,String param) throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Timestamp from=new Timestamp(sdf.parse(fromDate).getTime());
        Timestamp to=new Timestamp(sdf.parse(toDate).getTime());
        List<DevGPS>devGPSList=new ArrayList<DevGPS>();
        devGPSList=findAll("from DevGPS as d where d.devIDNO=? and d.GPSTime>=? and d.GPSTime<=? and d.speed>0",DevGPS.class,new Object[]{param,from,to});
        return devGPSList;
    }
}
