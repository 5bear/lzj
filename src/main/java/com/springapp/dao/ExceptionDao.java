package com.springapp.dao;

import com.springapp.classes.model.Pager;
import com.springapp.classes.model.SystemContext;
import com.springapp.entity.MyException;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/6/1.
 */
@Repository
public class ExceptionDao extends BaseDao1<MyException> {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    public List<MyException> getException(String company,int id){
        Date date = new Date();
        String hql = "from MyException where id>? and state=0 and eventDate='"+sdf.format(date)+"'";
        if(!"养护中心".equals(company)){
            hql+=" and vehicleLicense in (select vehicleLicense from Vehicle where company='"+company+"' and isDelete=0)";
        }
        return this.list(hql,id);
    }

    public Pager<MyException> getPager(String company,String date,String vTypes ,String conV){
        SystemContext.setSort("eventDate,eventTime");
        SystemContext.setOrder("desc");

        String hql = "from MyException where 1=1";
        if(!"养护中心".equals(company)){
            hql+=" and vehicleLicense in (select vehicleLicense from Vehicle where company='"+company+"' and isDelete=0)";
        }
        if (!"".equals(date)){
            hql+=" and eventDate='"+date+"'";
        }

        if (!"".equals(vTypes)){
            hql+=" and vehicleType='"+vTypes+"'";
        }
        if (!"".equals(conV)){
            hql+=" and vehicleLicense='"+conV+"'";
        }

        return this.find(hql);
    }

    public void confirmException(Integer[] ids){
        MyException me;
        if(ids!=null){
            for (Integer id:ids){
               me = this.get(id);
                me.setState(1); //状态设置为查看
                this.update(me);
            }
        }
    }
}
