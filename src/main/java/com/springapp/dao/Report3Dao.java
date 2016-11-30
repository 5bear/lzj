package com.springapp.dao;

import com.springapp.classes.model.Pager;
import com.springapp.classes.model.SystemContext;
import com.springapp.entity.Report3;
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
public class Report3Dao extends BaseDao1<Report3> {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    public Report3 getById(Long id) {
        return this.get(id);
    }

   /* public List<Park> getList() {
        return this.findAll("from Park where isDelete='0'", Park.class);
    }*/

    // time 是上午或下午
    public Pager<Report3> getPager(String companyName, String date, String startTime, String endTime) throws ParseException {

        Pager<Report3> pager;
        if (!"".equals(date.trim()) && !"".equals(startTime.trim()) && !"".equals(endTime.trim())) {
            SystemContext.setSort("");
            String hql = "from Report3 where company='" + companyName + "' and workDate='" + date + "' and startTime='" + startTime + "' and endTime='" + endTime + "'";
            pager = this.find(hql);
            if (pager == null || pager.getDatas().size() == 0) {
                getDatas(companyName, date, startTime, endTime);
                SystemContext.setSort("");
                return this.find(hql);
            } else {
                return pager;
            }
        }
        return null;
       /* if (!"".equals(startTime)){
            hql += " and startTime>='"+startTime+"'";
        }
        if(!"".equals(endTime)){
            hql += " and endTime<='"+endTime+"'";
        }*/
    }

    public List<Report3> getDatas(String companyName, String date, String startTime, String endTime) throws ParseException {

      /* String startDateTime = date+" "+startTime;
        String endDateTime = date+" "+endTime;
        String hql = "select v.company,v.vehicleLicence,v.vehicleType,vp.lat,vp.lng,vp.GPSTime,vp.devIDNO from" +
                " Vehicle v,DevGPS vp where v.OBUId=vp.devIDNO and v.company='"+companyName+"' and" +
                " vp.GPSTime>='"+startDateTime+"' and vp.GPSTime<='"+endDateTime+"'";
        List list = this.list1(hql);
        List<Report3> reportList = new ArrayList<Report3>();
        Report3 r;
        for(int i=0;i<list.size();i++){
            Object[] objs = (Object[]) list.get(i);
            r = new Report3();
            r.setCompany((String)objs[0]);
            String vehicleLicence = (String) objs[1];
            r.setVehicleLicence(vehicleLicence);
            r.setVehicleType((String) objs[2]);
            //把经纬度转换成路段
            String realPosition = BaiDuUtil.getPosition(String.valueOf(((Long) objs[3] / (double) 1000000)), String.valueOf((Long) objs[4] / (double) 1000000));

            r.setWorkDate(date);
            r.setStartTime(startTime);
            r.setEndTime(endTime);

            reportList.add(r);

            Report3 r3 = getByCon(vehicleLicence,date,startTime,endTime);
            if (r3==null){
                SystemContext.setSort("vp.GPSTime");
                SystemContext.setOrder("asc");
                //计算停留时间
                int smin=0;
                String start = date+" "+startTime;
                String end = date+" "+endTime;
                String devId = (String)objs[6];
                String hql1 = "select vp.GPSTime,vp.lat,vp.lng from DevGPS vp where vp.devIDNO='"+devId+"' and vp.speed=0" +
                        " and vp.GPSTime>='"+start+"' and vp.GPSTime<='"+end+"'";
                List list1 = this.list1(hql1);
                for (int n=0;n<list1.size();n++){
                    Object[] obj = (Object[]) list1.get(n);
                    //计算停留时间
                    String stopTime = obj[0].toString();
                    String hql2 = "select vp.GPSTime from DevGPS vp where vp.devIDNO='"+devId+"' and speed>0 and vp.GPSTime>'"+stopTime+"'";
                    Object o  =  this.query1(hql2,1);
                    String restartTime;
                    if (o!=null){
                        restartTime = o.toString();
                    }else{
                        restartTime = "";
                    }

                    Long ms=0L;
                    if (restartTime.compareTo(end)>0 || "".equals(restartTime)){
                        ms = sdf.parse(end).getTime()-sdf.parse(stopTime).getTime();
                    }else {
                        ms = sdf.parse(restartTime).getTime()-sdf.parse(stopTime).getTime();
                    }

                    int min = ms.intValue()/1000/60;
                    smin+=min;

                }
                r.setRemainTime(smin);


                //计算工作时间
                Long tms = sdf.parse(date+" "+endTime).getTime()-sdf.parse(date+" "+startTime).getTime();
                int tmin = tms.intValue()/1000/60;
                int wmin = tmin - smin;
                r.setWorkTime(wmin);
                r.setWorkArea(realPosition);

                String hql4 = "select vp.lat,vp.lng from DevGPS vp where vp.devIDNO='"+devId+"" +
                        "' and vp.GPSTime>='"+start+"' and vp.GPSTime<='"+end+"'";

                //计算里程
                Long lat1=0l;
                Long lng1=0l;
                Long lat2=0l;
                Long lng2=0l;
                int distance=0;
                List list4 = this.list1(hql4);
                for (int m=0;m<list4.size();m++){
                    Object[] obj4 = (Object[]) list4.get(m);
                    if (m==0){
                        lat1 = (Long) obj4[0];
                        lng1 = (Long) obj4[1];
                    }else{
                        lat2 = (Long) obj4[0];
                        lng2 = (Long) obj4[1];
                        distance += (int)BaiduMap.GetShortDistance(lng1/(double)1000000,lat1/(double)1000000,lng2/(double)1000000,lat2/(double)1000000);
                        lat1 = lat2;
                        lng1 = lng2;
                    }
                }

                r.setMile(distance);

                this.add(r);
            }else{
                String workArea = r3.getWorkArea();
                if (!workArea.contains(realPosition)){
                    workArea+=","+realPosition;
                    r3.setWorkArea(workArea);
                    this.update(r3);
                }
            }

        }
        return reportList;*/
        SystemContext.setSort("vp.GPSTime");
        SystemContext.setOrder("asc");

        String startDateTime = date + " " + startTime;
        //结束时间加一分钟
        String endDateTime = date + " " + endTime;
        Date td = new Date(sdf.parse(endDateTime).getTime() + 60 * 1000);
        endDateTime = sdf.format(td);
        String hql = "select v.company,v.vehicleLicense,v.vehicleType,vp.lat,vp.lng,vp.GPSTime,vp.devIDNO,vp.speed,vp.mile,vp.road from" +
                " Vehicle v,GpsBackup vp where v.OBUId=vp.devIDNO and v.company='" + companyName + "' and" +
                " vp.GPSTime>='" + startDateTime + "' and vp.GPSTime<='" + endDateTime + "' and v.isDelete=0";
        List list = this.list1(hql);
        System.out.println("------------listsize---------"+list.size());
        List<Report3> reportList = new ArrayList<Report3>();
        Report3 r;
        List<String> devIds = new ArrayList<String>();
        String dd = "";
        for (int i = 0; i < list.size(); i++) {
            Object[] objs = (Object[]) list.get(i);
            r = new Report3();
            r.setCompany((String) objs[0]);
            String vehicleLicence = (String) objs[1];
            r.setvehicleLicense(vehicleLicence);
            r.setVehicleType((String) objs[2]);
            //把经纬度转换成路段
            String realPosition = (String) objs[9];//BaiDuUtil.getPosition(String.valueOf(((Long) objs[3] / (double) 100000)), String.valueOf((Long) objs[4] / (double) 100000));

            r.setWorkDate(date);
            r.setStartTime(startTime);
            r.setEndTime(endTime);
            boolean flag  = false;
            dd = String.valueOf(objs[6]);
            for (String di:devIds){
                //该车已计算
                if(dd.equals(di)){
                    flag = true;
                    break;
                }
            }


           // Report3 r3 = getByCon(vehicleLicence, date, startTime, endTime);
            //int p = 1;
            if (!flag) {
                devIds.add(dd);
                //  System.out.println("---------------------------" + p);
              //  p++;
                //计算停留时间
                int smin = 0;
                int wmin = 0;
                String start = date + " " + startTime;
                String end = date + " " + endTime;
                String devId = (String) objs[6];
                String restartTime = "";
                String tempTime = "";
                for (int n = 0; n < list.size(); n++) {
                    Object[] obj = (Object[]) list.get(n);
                    if (String.valueOf(obj[6]).equals(devId) && (Integer) obj[7] <= 0 && String.valueOf(obj[5]).compareTo(tempTime) > 0) {
                        //计算停留时间
                        String stopTime = obj[5].toString();
                        //获取第一个速度大于0

                        for (int s = 0; s < list.size(); s++) {
                            Object[] o = (Object[]) list.get(s);
                            if (String.valueOf(o[6]).equals(devId) && (Integer) o[7] > 0 && String.valueOf(o[5]).compareTo(stopTime) > 0) {
                                restartTime = String.valueOf(o[5]);
                                //计算运动时间的前一个停止时间
                                for (int t = list.size() - 1; t >= 0; t--) {
                                    Object[] ot = (Object[]) list.get(t);
                                    if (String.valueOf(ot[6]).equals(devId) && (Integer) ot[7] <= 0 && String.valueOf(ot[5]).compareTo(restartTime) < 0) {
                                        restartTime = String.valueOf(ot[5]);
                                        break;
                                    }
                                }
                                tempTime = restartTime;
                                break;
                            }
                        }
                        //   System.out.println("----------------restartTime-------------" + restartTime);
                        //   System.out.println("----------------stopTime-------------" + stopTime);

                        Long ms = 0L;
                        boolean isbreak = false;
                        if ("".equals(restartTime) || restartTime.compareTo(end) > 0) {
                            String lastStopTime = "";
                            for (int v = list.size() - 1; v >= 0; v--) {
                                Object[] ve = (Object[]) list.get(v);
                                if (String.valueOf(ve[6]).equals(devId) && (Integer) ve[7] <= 0 && String.valueOf(ve[5]).compareTo(end) < 0) {
                                    lastStopTime = String.valueOf(ve[5]);
                                    break;
                                }
                            }
                            ms = sdf.parse(lastStopTime).getTime() - sdf.parse(stopTime).getTime();
                            isbreak = true;


                          /*  ms = sdf.parse(end).getTime() - sdf.parse(stopTime).getTime();
                            //      System.out.println("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" +  ms.intValue()/1000/60);
                            isbreak = true;*/
                        } else {
                            ms = sdf.parse(restartTime).getTime() - sdf.parse(stopTime).getTime();
                            restartTime = "";
                        }

                        int min = ms.intValue() / 1000 / 60;
                        smin += min;
                        if (isbreak) {
                            break;
                        }
                    }
                }
                r.setRemainTime(smin);


                //计算工作时间
                /*Long tms = sdf.parse(date+" "+endTime).getTime()-sdf.parse(date+" "+startTime).getTime();
                int tmin = tms.intValue()/1000/60;
                wmin = tmin - smin;
                r.setWorkTime(wmin);
                r.setWorkArea(realPosition);*/

                //--------------------------------
                String stopTime1 = "";
                String tempTime1 = "";
                for (int q = 0; q < list.size(); q++) {
                    Object[] obj5 = (Object[]) list.get(q);
                    if (String.valueOf(obj5[6]).equals(devId) && (Integer) obj5[7] > 0 && String.valueOf(obj5[5]).compareTo(tempTime1) > 0) {
                        //计算工作时间
                        String runTime = obj5[5].toString();
                        //获取第一个速度等于0

                        for (int s = 0; s < list.size(); s++) {
                            Object[] o = (Object[]) list.get(s);
                            if (String.valueOf(o[6]).equals(devId) && (Integer) o[7] <= 0 && String.valueOf(o[5]).compareTo(runTime) > 0) {
                                stopTime1 = String.valueOf(o[5]);
                                //计算停止时间的前一个运动时间
                                for (int e = list.size() - 1; e >= 0; e--) {
                                    Object[] oe = (Object[]) list.get(e);
                                    if (String.valueOf(oe[6]).equals(devId) && (Integer) oe[7] > 0 && String.valueOf(oe[5]).compareTo(stopTime1) < 0) {
                                        stopTime1 = String.valueOf(oe[5]);
                                        break;
                                    }
                                }
                                tempTime1 = stopTime1;
                                break;
                            }
                        }


                        Long msw = 0L;
                        boolean isbreak1 = false;
                        if ("".equals(stopTime1) || stopTime1.compareTo(end) > 0) {
                            String lastRunTime = "";
                            for (int v = list.size() - 1; v >= 0; v--) {
                                Object[] ve = (Object[]) list.get(v);
                                if (String.valueOf(ve[6]).equals(devId) && (Integer) ve[7] > 0 && String.valueOf(ve[5]).compareTo(end) < 0) {
                                    lastRunTime = String.valueOf(ve[5]);
                                    break;
                                }
                            }
                            msw = sdf.parse(lastRunTime).getTime() - sdf.parse(runTime).getTime();
                            isbreak1 = true;
                        } else {
                            msw = sdf.parse(stopTime1).getTime() - sdf.parse(runTime).getTime();
                            stopTime1 = "";
                        }

                        int min1 = msw.intValue() / 1000 / 60;
                        wmin += min1;
                        if (isbreak1) {
                            break;
                        }
                    }
                }
                r.setWorkTime(wmin);

               //计算工作区域
                String workArea = "";
                String workPos = "";
                for (int s = 0; s < list.size(); s++) {
                    Object[] o = (Object[]) list.get(s);
                    workPos = (String)o[9];
                    if (String.valueOf(o[6]).equals(devId)) {
                        if (workPos != null && !workArea.contains(workPos)) {
                            if("".equals(workArea)){
                                workArea += workPos;
                            }else{
                                workArea += "," + workPos;
                            }
                        }
                    }
                }

                r.setWorkArea(workArea);


                //计算里程
             /*   Long lat1=0l;
                Long lng1=0l;
                Long lat2=0l;
                Long lng2=0l;*/
                int tmp = 0;
                int distance = 0;
                int mm = 0;
                for (int m = 0; m < list.size(); m++) {
                    Object[] obj4 = (Object[]) list.get(m);
                    if (String.valueOf(obj4[6]).equals(devId)) {
                        if (mm == 0) {
                            tmp = (Integer) obj4[8];
                        } else {
                            if ((Integer) obj4[8] - tmp > 0) {
                                distance += (Integer) obj4[8] - tmp;
                            }
                            tmp = (Integer) obj4[8];
                        }

                        mm++;
                    }

                   /* if(String.valueOf(obj4[6]).equals(devId)){
                       *//* if (mm==0){
                            lat1 = (Long) obj4[3];
                            lng1 = (Long) obj4[4];
                        }else{
                            lat2 = (Long) obj4[3];
                            lng2 = (Long) obj4[4];
                            distance += (int)BaiduMap.GetShortDistance(lng1/(double)100000,lat1/(double)100000,lng2/(double)100000,lat2/(double)100000);
                            lat1 = lat2;
                            lng1 = lng2;
                        }
                        mm++;*//*
                        if (mm > 0){
                            distance += (Integer)obj4[8];
                        }
                       mm++;
                    }*/
                }
                if (wmin == 0) {
                    r.setMile(0);
                } else {
                    r.setMile(distance);
                }

                this.add(r);
            } /*else {
                String workArea = r3.getWorkArea();
                if (realPosition != null && !workArea.contains(realPosition)) {
                    workArea += "," + realPosition;
                    r3.setWorkArea(workArea);
                    this.update(r3);
                }
            }*/

        }
        return reportList;
    }

    public Report3 getByCon(String vehicleLicence, String date, String startTime, String endTime) {
        String hql = "from Report3 where vehicleLicense=? and workDate=? and startTime=? and endTime=?";

        return (Report3) this.queryObject(hql, new Object[]{vehicleLicence, date, startTime, endTime});
    }

    public String getMaxDateTime() {
        String hql = "select max(vp.GPSTime) from GpsBackup vp,Vehicle v where v.OBUId=vp.devIDNO and v.company='上海成基市政建设发展有限公司'  and v.isDelete=0";
        Object o = this.queryObject(hql);
        if (o != null) {
            return o.toString();
        }
        return null;
    }

    public String getStartTime(String date) {
        SystemContext.setSort("vp.GPSTime");
        SystemContext.setOrder("asc");
        String hql = "select min(vp.GPSTime) from GpsBackup vp,Vehicle v where v.OBUId=vp.devIDNO and v.company='上海成基市政建设发展有限公司' and vp.GPSTime like '%" + date + "%'  and v.isDelete=0";
        Object o = this.query1(hql, 1);
        if (o != null) {
            return o.toString();
        }
        return null;
    }

    public String getMaxDate() {
        String hql = "select max(workDate) from Report3";
        return (String) this.queryObject(hql);
    }

    public List<Report3> getList(String companyName, String date, String startTime, String endTime) {
        String hql = "from Report3 where company='" + companyName + "' and workDate='" + date + "' and startTime='" + startTime + "' and endTime='" + endTime + "'";

      /*  if (!"".equals(startTime)){
            hql += " and startTime>='"+startTime+"'";
        }
        if(!"".equals(endTime)){
            hql += " and endTime<='"+endTime+"'";
        }*/
        return this.list(hql);
    }
}
