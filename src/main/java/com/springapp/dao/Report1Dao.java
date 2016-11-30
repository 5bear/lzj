package com.springapp.dao;

import com.springapp.classes.model.Pager;
import com.springapp.classes.model.SystemContext;
import com.springapp.entity.Report1;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/5/22.
 */
@Repository
public class Report1Dao extends BaseDao1<Report1> {
    private static SimpleDateFormat sdfD = new SimpleDateFormat("yyyy-MM-dd");
    private static SimpleDateFormat sdfT = new SimpleDateFormat("HH:mm");
    public Report1 getById(Long id) {
        return this.get(id);
    }

   /* public List<Park> getList() {
        return this.findAll("from Park where isDelete='0'", Park.class);
    }*/

    // time 是上午或下午
    public Pager<Report1> getPager(String companyName,String date,String time) throws ParseException {
        Pager<Report1> pager;
        if (!"".equals(date.trim())&&!"".equals(time.trim())){
            SystemContext.setSort("");
            String hql = "from Report1 where company='"+companyName+"' and arriveDate='"+date+"' and arriveTime='"+time+"'";
            pager = this.find(hql);
            if(pager==null || pager.getDatas().size()<=0){
                getDatas(companyName,date,time);
                return this.find(hql);
            }else{
                return pager;
            }
        }

      /*  if ("上午".equals(time)){
            hql += " and (arriveTime>='00:00' and arriveTime<='11:59')";
        }else if("下午".equals(time)){
            hql += " and (arriveTime>='12:00' and arriveTime<='23:59')";
        }*/
        return null;
    }

    public List<Report1> getDatas(String companyName,String date,String time) throws ParseException {
        String dateTime = date+" "+time;
        String hql = "select v.company,v.vehicleLicense,pl.lat,pl.lng,vp.lat,vp.lng,vp.GPSTime,pl.road,vp.road from" +
                " Vehicle v,GpsBackup vp,Position pl where v.OBUId=vp.devIDNO and pl.vehicle=v.vehicleLicense and v.company='"+companyName+"' and v.vehicleType='牵引车' and" +
                " vp.GPSTime like '%"+dateTime+"%' and v.isDelete=0";
        List list = this.list1(hql);
        List<Report1> report1List = new ArrayList<Report1>();
        Report1 r;
        for(int i=0;i<list.size();i++){
            Object[] objs = (Object[]) list.get(i);
            r = new Report1();
            r.setCompany((String)objs[0]);
            String vehicleLicence = (String) objs[1];
            r.setvehicleLicense(vehicleLicence);
            String planPosition =  (String)objs[7];//BaiDuUtil.getPosition(String.valueOf(objs[2]),String.valueOf(objs[3]));
            r.setPlanPosition(planPosition);

            //把经纬度转换成路段
            String realPosition = (String)objs[8];//BaiDuUtil.getPosition(String.valueOf(((Long)objs[4]/(double)100000)),String.valueOf((Long)objs[5]/(double)100000));
            r.setRealPosition(realPosition);
            r.setArriveDate(date);
            r.setArriveTime(time);
            String state;

            if(planPosition!=null && realPosition!=null && !realPosition.equals(planPosition)){
                state = "出动";
            }else{
                state = "待命";
            }
            r.setState(state);
            //计算到达时间
            String aGps = "";
            if("待命".equals(state)){
                SystemContext.setSort("vp.GPSTime");
                SystemContext.setOrder("asc");
                String hql1 = "select vp.GPSTime from" +
                        " Vehicle v,GpsBackup vp where v.OBUId=vp.devIDNO and v.company='"+companyName+"' and  v.vehicleType='牵引车'  and v.isDelete=0 and" +
                        " vp.GPSTime <= '"+dateTime+"' and vp.road='"+planPosition;
                List list2 = this.list2(hql1);
                if (list2!=null && list2.size()>0){
                    Object[] obj = (Object[]) list2.get(0);
                    aGps = (String) obj[0];
                }

                if(!"".equals(aGps)){
                    r.setArriveDate(sdfD.format(sdfD.parse(aGps)));
                    r.setArriveTime(sdfT.format(sdfT.parse(aGps)));
                }else{
                    r.setArriveDate("");
                    r.setArriveTime("");
                }
            }

            report1List.add(r);
            if (getByCon(vehicleLicence,date,time)==null){
                this.add(r);
            }

        }
        return report1List;
    }

    public Report1 getByCon(String vehicleLicence,String date,String time) {
        String hql = "from Report1 where vehicleLicense=? and arriveDate=? and arriveTime=?";

        return (Report1)this.queryObject(hql,new Object[]{vehicleLicence,date,time});
    }

    public List<Report1> getList(String companyName,String date,String time) {
        String hql = "from Report1 where company='"+companyName+"' and arriveDate='"+date+"' and arriveTime='"+time+"'";

        /*String hql = "from Report1 where company='"+companyName+"' and arriveDate='"+date+"'";

        if ("上午".equals(time)){
            hql += " and (arriveTime>='00:00' and arriveTime<='11:59')";
        }else if("下午".equals(time)){
            hql += " and (arriveTime>='12:00 and arriveTime<=23:59')";
        }*/
        return this.list(hql);
    }

   /* public Pager<Report1> getLastest(String company){
        SystemContext.setSort("arriveDate");
        SystemContext.setOrder("desc");
        String hql = "from Report1 where company='"+company+"' and arriveDate=(select max(arriveDate) from Report1)";
        return this.find(hql);
    }*/

    public String getMaxDateTime(String c){
        String hql = "select max(vp.GPSTime) from GpsBackup vp,Vehicle v where v.OBUId=vp.devIDNO and v.company='"+c+"' and v.vehicleType='牵引车'  and v.isDelete=0";
        Object o = this.queryObject(hql);
        if (o!=null){
            return o.toString();
        }else{
            return null;
        }

    }

}
