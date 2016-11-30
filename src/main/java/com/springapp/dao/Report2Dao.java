package com.springapp.dao;

import com.springapp.classes.model.Pager;
import com.springapp.entity.Report2;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/5/22.
 */
@Repository
public class Report2Dao extends BaseDao1<Report2> {
    public Report2 getById(Long id) {
        return this.get(id);
    }

   /* public List<Park> getList() {
        return this.findAll("from Park where isDelete='0'", Park.class);
    }*/

    // time 是上午或下午
    public Pager<Report2> getPager(String companyName,String date,String time) {
        Pager<Report2> pager;
        if (!"".equals(date.trim())&&!"".equals(time.trim())){
            String hql = "from Report2 where company='"+companyName+"' and workDate='"+date+"' and workTime='"+time+"'";
            pager = this.find(hql);
            if(pager==null || pager.getDatas().size()==0){
                getDatas(companyName,date,time);
                return this.find(hql);
            }else{
                return pager;
            }
        }

       /* if (!"".equals(startTime)){
            hql += " and workTime>='"+startTime+"'";
        }
        if(!"".equals(endTime)){
            hql += " and workTime<='"+endTime+"'";
        }*/
        return null;
    }

    public List<Report2> getDatas(String companyName,String date,String time)  {
        String dateTime = date+" " + time;
        String hql = "select v.company,v.vehicleLicense,v.vehicleType,vp.lat,vp.lng,vp.GPSTime,vp.road from" +
                " Vehicle v,GpsBackup vp where v.OBUId=vp.devIDNO and v.company='"+companyName+"' and" +
                " vp.GPSTime like '%"+dateTime+"%' and v.isDelete=0";
        List list = this.list1(hql);
        List<Report2> reportList = new ArrayList<Report2>();
        Report2 r;
        for(int i=0;i<list.size();i++){
            Object[] objs = (Object[]) list.get(i);
            r = new Report2();
            r.setCompany((String)objs[0]);
            String vehicleLicence = (String) objs[1];
            r.setvehicleLicense(vehicleLicence);
            r.setVehicleType((String) objs[2]);
            //把经纬度转换成路段
            String realPosition =  (String)objs[6];//BaiDuUtil.getPosition(String.valueOf(((Long) objs[3] / (double) 100000)), String.valueOf((Long) objs[4] / (double) 100000));
            r.setRampName(realPosition);
            r.setWorkDate(date);
            r.setWorkTime(time);

            reportList.add(r);

            if (getByCon(vehicleLicence,date,time)==null){
                this.add(r);
            }

        }
        return reportList;
    }

    public Report2 getByCon(String vehicleLicence,String date,String time) {
        String hql = "from Report2 where vehicleLicense=? and workDate=? and workTime=?";

        return (Report2)this.queryObject(hql,new Object[]{vehicleLicence,date,time});
    }

    public String getMaxDateTime(){
        String hql = "select max(vp.GPSTime) from GpsBackup vp,Vehicle v where v.OBUId=vp.devIDNO and v.company='上海成基市政建设发展有限公司'  and v.isDelete=0";
        Object o = this.queryObject(hql);
        if (o!=null){
            return o.toString();
        }
        return null;
    }
    /* public String getMaxDate(){
         String hql = "select max(workDate) from Report2";
         return (String)this.queryObject(hql);
     }*/
    public List<Report2> getList(String companyName,String date,String time) {
        String hql = "from Report2 where company='"+companyName+"' and workDate='"+date+"' and workTime='"+time+"'";

       /* if (!"".equals(startTime)){
            hql += " and workTime>='"+startTime+"'";
        }
        if(!"".equals(endTime)){
            hql += " and workTime<='"+endTime+"'";
        }*/
        return this.list(hql);
    }
}
