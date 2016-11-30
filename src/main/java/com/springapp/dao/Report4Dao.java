package com.springapp.dao;


import com.springapp.classes.model.Pager;
import com.springapp.classes.model.SystemContext;

import com.springapp.entity.Report4;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/5/22.
 */
@Repository
public class Report4Dao extends BaseDao1<Report4> {
    private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    public Report4 getById(Long id) {
        return this.get(id);
    }

   /* public List<Park> getList() {
        return this.findAll("from Park where isDelete='0'", Park.class);
    }*/

    // time 是上午或下午
    public Pager<Report4> getPager(String companyName,String date,String startTime,String endTime) throws ParseException {
        Pager<Report4> pager;
        if (!"".equals(date.trim())&&!"".equals(startTime.trim())&&!"".equals(endTime.trim())){
            SystemContext.setSort("");
            String hql = "from Report4 where company='"+companyName+"' and eventDate='"+date+"' and ((startTime>='"+startTime+"' and startTime<='"+endTime+"') or (endTime>='"+startTime+"' and endTime<='"+endTime+"'))";
            pager = this.find(hql);
            if(pager==null || pager.getDatas().size()==0){
                getDatas(companyName,date,startTime,endTime);
                SystemContext.setSort("");
                return  this.find(hql);
            }else{
                return pager;
            }
        }

      /*  if (!"".equals(startTime)){
            hql += " and startTime>='"+startTime+"'";
        }
        if(!"".equals(endTime)){
            hql += " and endTime<='"+endTime+"'";
        }*/
        return null;
    }

    public void getDatas(String companyName,String date,String startTime,String endTime) throws ParseException {

        String startDateTime = date+" "+startTime;
        //结束时间加一分钟
        String endDateTime = date+" "+endTime;
        Date td = new Date (sdf.parse(endDateTime).getTime()+60*1000);
        endDateTime = sdf.format(td);
        String hql = "select v.vehicleLicense,v.vehicleType,vp.GPSTime,vp.devIDNO,vp.speed,vp.overSpeed from" +
                " Vehicle v,GpsBackup vp where v.OBUId=vp.devIDNO and v.company='"+companyName+"' and" +
                " vp.GPSTime>='"+startDateTime+"' and vp.GPSTime<='"+endDateTime+"'  and v.isDelete=0";
        List list = this.list1(hql);
        Report4 r;
        String vehicleLicense;
        String vehicleType;
        String gpsTime;
        String devId;
        Long ms=0L;
        int min=0;
        int minSpeed=0;
        int maxSpeed=0;
        int isOverSpeed=0;
        List<String> sl = new ArrayList<String>();
        List<String> el = new ArrayList<String>();
        for(int i=0;i<list.size();i++) {
            Object[] obj = (Object[]) list.get(i);
            r = new Report4();
            vehicleLicense = (String)obj[0];
            vehicleType = (String)obj[1];
            gpsTime = obj[2].toString();
            devId = (String)obj[3];
            isOverSpeed = (Integer)obj[5];
            r.setCompany(companyName);
            r.setvehicleLicense(vehicleLicense);
            r.setVehicleType(vehicleType);
            r.setEventDate(date);

            if (isOverSpeed==1) {
                boolean flag = false;
                String s = "";
                String e = "";
                String vdt = vehicleLicense+date+sdf1.parse(gpsTime);
                for(int ii=0;ii<sl.size();ii++){
                    s = sl.get(ii);
                    e = el.get(ii);
                    //说明已经存在
                    if(vdt.compareTo(s)>=0 && vdt.compareTo(e)<=0){
                        flag = true;
                        break;
                    }
                }
//getByCon(vehicleLicense, date, sdfTime.format(sdf1.parse(gpsTime))) == null
                if (!flag) {
                    try {
                        SystemContext.setSort("vp.GPSTime");
                        SystemContext.setOrder("desc");
                  /*  String hql1 = "select vp.GPSTime from DevGPS vp " +
                            "where vp.devIDNO='" + devId + "' and vp.overSpeed=0 and vp.GPSTime<'" + gpsTime + "'";

                    String temp1 = this.query1(hql1, 1).toString();

                    String hql11 = "select vp.GPSTime from DevGPS vp " +
                            "where vp.devIDNO='" + devId + "' and vp.overSpeed=1 and vp.GPSTime>'" + temp1 + "'";
*/
                    /*String start = this.query1(hql11, 1).toString();*/
                    /*String start = gpsTime;*/
                        SystemContext.setOrder("asc");
                        String hql2 = "select vp.GPSTime from GpsBackup vp,Vehicle v " +
                                "where v.OBUId=vp.devIDNO and vp.devIDNO='" + devId + "' and vp.overSpeed=0 and vp.GPSTime>'" + gpsTime + "'  and v.isDelete=0";
                        String temp2 = this.query1(hql2, 1).toString();

                        SystemContext.setOrder("desc");
                        String hql22 = "select vp.GPSTime from GpsBackup vp,Vehicle v " +
                                "where v.OBUId=vp.devIDNO and vp.devIDNO='" + devId + "' and vp.overSpeed=1 and vp.GPSTime<'" + temp2 + "'  and v.isDelete=0";

                        String end = this.query1(hql22, 1).toString();

                        sl.add(vehicleLicense + date + sdf1.parse(gpsTime));
                        el.add(vehicleLicense + date + sdf1.parse(end));
                        r.setStartTime(sdfTime.format(sdf1.parse(gpsTime)));
                        r.setEndTime(sdfTime.format(sdf1.parse(end)));
                        //计算超速时间
                        ms = sdf1.parse(end).getTime() - sdf1.parse(gpsTime).getTime();
                        min = ms.intValue() / 1000 / 60;
                        int sec = (ms.intValue() / 1000) % 60;
                        if (sec > 0) {
                            min += 1;
                        }
                        r.setOverspeedTime(min);
                        //计算最小速度
                        SystemContext.setSort("vp.GPSTime");
                        String hql3 = "select min(vp.speed) from GpsBackup vp,Vehicle v  where v.OBUId=vp.devIDNO and  vp.devIDNO='" + devId + "' and vp.GPSTime>='" + gpsTime + "' and vp.GPSTime<='" + end + "'  and v.isDelete=0";
                        minSpeed = (Integer) this.query1(hql3, 1);
                        //计算最大速度
                        String hql4 = "select max(vp.speed) from GpsBackup vp,Vehicle v  where v.OBUId=vp.devIDNO and vp.devIDNO='" + devId + "' and vp.GPSTime>='" + gpsTime + "' and vp.GPSTime<='" + end + "'  and v.isDelete=0";
                        maxSpeed = (Integer) this.query1(hql4, 1);

                        r.setMinSpeed(minSpeed);
                        r.setMaxSpeed(maxSpeed);

                        SystemContext.setSort("vp.GPSTime");
                        SystemContext.setOrder("asc");
                        //计算超速里程
                        String hql5 = "select vp.lat,vp.lng,vp.mile from GpsBackup vp,Vehicle v  where v.OBUId=vp.devIDNO and vp.devIDNO='" + devId + "" +
                                "' and vp.GPSTime>='" + gpsTime + "' and vp.GPSTime<='" + end + "'  and v.isDelete=0";
/*
                    Long lat1 = 0l;
                    Long lng1 = 0l;
                    Long lat2 = 0l;
                    Long lng2 = 0l;*/
                        int distance = 0;
                        int tmp = 0;
                        int mm = 0;
                        List list5 = this.list1(hql5);
                        for (int m = 0; m < list5.size(); m++) {
                            Object[] obj5 = (Object[]) list5.get(m);
                            if (m == 0) {
                                tmp = (Integer) obj5[2];
                            } else {
                                if ((Integer) obj5[2] - tmp > 0) {
                                    distance += (Integer) obj5[2] - tmp;
                                }
                                tmp = (Integer) obj5[2];
                            }
                        }

                        if (min == 0) {
                            r.setOverspeedMile(0);
                        } else {
                            r.setOverspeedMile(distance);
                        }


                        this.add(r);
                    }catch(Exception exc){

                    }
                }
            }

        }
       /* String startDateTime = date+" "+startTime;
        String endDateTime = date+" "+endTime;
        String hql = "select v.vehicleLicense,v.vehicleType,vp.gpsTime,vp.devIDNO,vp.speed from" +
                " Vehicle v,VehiclePos vp where v.id=vp.devIDNO and v.company='"+companyName+"' and" +
                " vp.gpsTime>='"+startDateTime+"' and vp.gpsTime<='"+endDateTime+"'";
        List list = this.list1(hql);
        List<Report4> reportList = new ArrayList<Report4>();
        Report4 r;
        String vehicleLicense;
        String vehicleType;
        String gpsTime;
        String devId;
        int speed=0;
        int superSpeed=0;
        Long ms=0L;
        int min=0;
        int minSpeed=0;
        int maxSpeed=0;
        for(int i=0;i<list.size();i++) {
            Object[] obj = (Object[]) list.get(i);
            r = new Report4();
            vehicleLicense = (String)obj[0];
            vehicleType = (String)obj[1];
            gpsTime = obj[2].toString();
            devId = (String)obj[3];
            speed = (Integer)obj[4];
            if ("清扫车".equals(vehicleType)){
                superSpeed = (int)getSpeed("cleanCarSpeed");
            }else if("巡视车".equals(vehicleType)){
                superSpeed = (int)getSpeed("viewCarSpeed");
            }else if("牵引车".equals(vehicleType)){
                superSpeed = (int)getSpeed("pullCarSpeed");
            }
            r.setCompany(companyName);
            r.setvehicleLicense(vehicleLicense);
            r.setVehicleType(vehicleType);
            r.setEventDate(date);

            if (speed>superSpeed) {
                if (getByCon(vehicleLicense, date, sdfTime.format(sdf1.parse(gpsTime))) == null) {
                    SystemContext.setSort("vp.gpsTime");
                    SystemContext.setOrder("desc");
                    String hql1 = "select vp.gpsTime from VehiclePos vp " +
                            "where vp.devIDNO='" + devId + "' and speed<=" + superSpeed + " and vp.gpsTime<'" + gpsTime + "'";
                    String start = this.query1(hql1, 1).toString();
                    SystemContext.setOrder("asc");
                    String hql2 = "select vp.gpsTime from VehiclePos vp " +
                            "where vp.devIDNO='" + devId + "' and speed<=" + superSpeed + " and vp.gpsTime>'" + gpsTime + "'";
                    String end = this.query1(hql2, 1).toString();

                    r.setStartTime(sdfTime.format(sdf1.parse(start)));
                    r.setEndTime(sdfTime.format(sdf1.parse(end)));
                    //计算超速时间
                    ms = sdf1.parse(end).getTime() - sdf1.parse(start).getTime();
                    min = ms.intValue() / 1000 / 60;
                    r.setOverspeedTime(min);
                    //计算最小速度
                    String hql3 = "select min(vp.speed) from VehiclePos vp where vp.devIDNO='" + devId + "' and vp.gpsTime>'" + start + "' and vp.gpsTime<'" + end + "'";
                    minSpeed = (Integer) this.query1(hql3, 1);
                    //计算最大速度
                    String hql4 = "select max(vp.speed) from VehiclePos vp where vp.devIDNO='" + devId + "' and vp.gpsTime>'" + start + "' and vp.gpsTime<'" + end + "'";
                    maxSpeed = (Integer) this.query1(hql4, 1);

                    r.setMinSpeed(minSpeed);
                    r.setMaxSpeed(maxSpeed);

                    //计算超速里程
                    String hql5 = "select vp.lat,vp.lng from VehiclePos vp where vp.devIDNO='" + devId + "" +
                            "' and vp.gpsTime>='" + start + "' and vp.gpsTime<='" + end + "'";

                    Long lat1 = 0l;
                    Long lng1 = 0l;
                    Long lat2 = 0l;
                    Long lng2 = 0l;
                    int distance = 0;
                    List list5 = this.list1(hql5);
                    for (int m = 0; m < list5.size(); m++) {
                        Object[] obj5 = (Object[]) list5.get(m);
                        if (m == 0) {
                            lat1 = (Long) obj5[0];
                            lng1 = (Long) obj5[1];
                        } else {
                            lat2 = (Long) obj5[0];
                            lng2 = (Long) obj5[1];
                            distance += (int) BaiduMap.GetShortDistance(lng1 / (double) 1000000, lat1 / (double) 1000000, lng2 / (double) 1000000, lat2 / (double) 1000000);
                            lat1 = lat2;
                            lng1 = lng2;
                        }
                    }

                    r.setOverspeedMile(distance);

                    this.add(r);
                }
            }

        }*/

    }

    public Report4 getByCon(String vehicleLicense,String date,String time) {
        SystemContext.setSort("");
        String hql = "from Report4 where vehicleLicense=? and eventDate=? and startTime<='"+time+"' and endTime>='"+time+"'";

        return (Report4)this.queryObject(hql,new Object[]{vehicleLicense,date});
    }

    private double getSpeed(String type){
        SystemContext.setSort("");
       String hql = "select "+type+" from Rules where id=0";

       return (Double)this.query1(hql,1);
    }
    public String getMaxDateTime(){
        SystemContext.setSort("");
        String hql = "select max(vp.GPSTime) from GpsBackup vp,Vehicle v where v.id=vp.devIDNO and v.company='上海成基市政建设发展有限公司'";
        Object o = this.queryObject(hql);
        if (o!=null){
            return o.toString();
        }
        return null;
    }
    public String getStartTime(String date){
        SystemContext.setSort("vp.GPSTime");
        SystemContext.setOrder("asc");
        String hql = "select min(vp.GPSTime) from GpsBackup vp,Vehicle v where v.id=vp.devIDNO and v.company='上海成基市政建设发展有限公司' and vp.GPSTime like '%"+date+"%'";
        Object o = this.query1(hql, 1);
        if (o!=null){
            return o.toString();
        }
        return null;
    }

    public String getMaxDate(){
        String hql = "select max(eventDate) from Report4";
        return (String)this.queryObject(hql);
    }
    public List<Report4> getList(String companyName,String date,String startTime,String endTime) {
        String hql = "from Report4 where company='"+companyName+"' and eventDate='"+date+"' and ((startTime>='"+startTime+"' and startTime<='"+endTime+"') or (endTime>='"+startTime+"' and endTime<='"+endTime+"'))";

        return this.list(hql);
    }
}
