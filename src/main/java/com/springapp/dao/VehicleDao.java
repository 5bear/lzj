package com.springapp.dao;


import com.springapp.classes.model.Pager;
import com.springapp.classes.model.SystemContext;
import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class VehicleDao extends BaseDao1<Vehicle> {

    public void deletePosition(Long vid){
        String hql = "delete from Position where vehicleId=?";
        this.updateByHql(hql,vid);
    }


    public Vehicle getById(Long id){
        return this.get(id);
    }
    public Pager<Vehicle> getPager(String type,String con,String company){

        String hql = "from Vehicle where isDelete=0";
        if (!"0".equals(type.trim())){
            hql+=" and vehicleType='"+type+"'";
        }
        if(!"养护中心".equals(company)){
            hql+=" and company='"+company+"'";
        }
        if (!"".equals(con.trim())){
            hql += " and (company like '%"+con+"%' or vehicleLicense like '%"+con+"%' or vehicleModel like '%"+con+"%')";
        }
        return this.find(hql);

    }

    public List<Vehicle> getList(String company,String type){

        String hql = "from Vehicle where isDelete=0" ;
        if(!"养护中心".equals(company)){
            hql+=" and company='"+company+"'";
        }

        if(!"".equals(type)){
            hql+=" and vehicleType='"+type+"'";
        }
        return this.list(hql);

    }
    public List<Vehicle> getList(){

        String hql = "from Vehicle where isDelete=0";
        return this.list(hql);

    }
    public List<Vehicle> getListOBUID(){

        String hql = "from Vehicle where isDelete=0 and OBUId !=''";
        return this.list(hql);

    }
    public void updateEfence(String oldName,String newName){

        String hql = "update Vehicle v set v.eFence=? where v.isDelete=0 and v.vehicleType='巡视车' and v.eFence=?";
        this.updateByHql(hql, new Object[]{newName,oldName});

    }
    public Vehicle getByvehicleLicense(String vehicleLicense)
    {
        String hql = "from Vehicle where isDelete=0 and vehicleLicense='"+vehicleLicense+"'";
        return (Vehicle)this.queryObject(hql);
    }



    public Vehicle getByName(String name) {
        String hql = "from Vehicle where isDelete=0 and vehicleLicense='"+name+"'";
        return (Vehicle)this.queryObject(hql);
    }

  public List<Vehicle> getCList(){
        return this.list("from Vehicle where isDelete=0 and company='上海成基市政建设发展有限公司'");
    }

    public List<Vehicle> getGList(){
        return this.list(("from Vehicle where isDelete=0 and company='上海高架养护管理有限公司'"));
    }

    public List<Vehicle> getXList(){
        return this.list(("from Vehicle where isDelete=0 and vehicleType='巡视车'"));
    }

    public List<Vehicle> getYList(){
        return this.list(("from Vehicle where isDelete=0 and vehicleType='清扫车'"));
    }

    public List<Vehicle> getQList(){
        return this.list(("from Vehicle where isDelete=0 and vehicleType='牵引车'"));
    }

    public List<Vehicle> getCyList(){
        return this.list("from Vehicle where isDelete=0 and company='上海成基市政建设发展有限公司' and vehicleType='清扫车'");
    }
    public List<Vehicle> getCqList(){
        return this.list("from Vehicle where isDelete=0 and company='上海成基市政建设发展有限公司' and vehicleType='牵引车'");
    }
    public List<Vehicle> getCxList(){
        return this.list("from Vehicle where isDelete=0 and company='上海成基市政建设发展有限公司' and vehicleType='巡视车'");
    }
    public List<Vehicle> getGyList(){
        return this.list("from Vehicle where isDelete=0 and company='上海高架养护管理有限公司' and vehicleType='清扫车'");
    }
    public List<Vehicle> getGqList(){
        return this.list("from Vehicle where isDelete=0 and company='上海高架养护管理有限公司' and vehicleType='牵引车'");
    }
    public List<Vehicle> getGxList(){
        return this.list("from Vehicle where isDelete=0 and company='上海高架养护管理有限公司' and vehicleType='巡视车'");
    }
    public List<Vehicle> getByeFence(Long id){
        String hql = "from Vehicle where eFenceId=? and isDelete=0";
        return this.list(hql,id);
    }
}
