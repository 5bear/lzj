package com.springapp.dao;

import com.springapp.entity.GpsBackup;
import com.springapp.entity.Line;
import com.springapp.entity.Vehicle;
import com.springapp.entity.VehicleLine;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.jca.cci.core.ConnectionCallback;
import org.springframework.stereotype.Repository;

import java.util.*;

/**
 * Created by ZhanShaoxiong on 2016/4/4.
 */
@Repository
public class LineDao extends BaseDao {
    public Line getById(Long id){
        return this.get(Line.class,id);
    }
    public Line getByCoords(String startCoord,String endCoord){
        return this.find("from Line where startCoord=? or endCoord=?",Line.class,new Object[]{startCoord,endCoord});
    }
    public List<Line> getByName(String name){
        return this.findAll("from Line where line like?", Line.class, new Object[]{'%' + name + '%'});
    }
    public List<Line>getList(){
        return this.findAll("from Line where isDelete=0",Line.class);
    }
    public List<Line>getList(String company){
        String hql = "from Line where isDelete=0";
        if(!"养护中心".equals(company)){
            hql+=" and company='"+company+"'";
        }
        return this.findAll(hql,Line.class);
    }
    public List<Line>getList(String company,String lineName){
        String hql = "from Line where isDelete=0";
        if(company!=null&&!"养护中心".equals(company)&&!"".equals(company)){
            hql+=" and company='"+company+"'";
        }
        if(lineName!=null&&!"".equals(lineName)){
            hql+=" and line like '%"+lineName+"%'";
        }
        return this.findAll(hql,Line.class);
    }
    public List<Line>getByPage(int start,int end){
        return this.findByPage("from Line",Line.class,start,end);
    }
    public List<Line>getByPage(int start,int end,String company,String lineName){
        String hql = "from Line where isDelete=0";
        if(company!=null&&!"养护中心".equals(company)&&!"".equals(company)){
            hql+=" and company='"+company+"'";
        }
        if(lineName!=null&&!"".equals(lineName)){
            hql+=" and line like '%"+lineName+"%'";
        }
        return this.findByPage(hql,Line.class,start,end);
    }
    public List<Line>getByPage(int start,int end,String company){
        String hql="from Line where company= '"+company+"'";
        return this.findByPage(hql,Line.class,start,end);
    }
    public List<Line>getListByCompany(String Company){
        return this.findAll("from Line where company=? and isDelete=0",Line.class,new Object[]{Company});
    }
    public List<Line>getListByPackage(Long packageId){
        return this.findAll("from Line where packgeId=? and isDelete=0", Line.class,new Object[]{packageId});
    }
    public boolean isDuplicated(Line old,String lineName){
        List<Line>lineList=this.getList();
        if(old==null){
            for(Line line:lineList){
                if(line.getLine().equals(lineName))
                    return true;
            }
        }else{
            for(Line line:lineList){
                if(!(line.getId()==old.getId()))
                if(line.getLine().equals(lineName))
                    return true;
            }
        }
        return false;
    }
    public Line getLine(GpsBackup devGPS, Double devite){
        List<VehicleLine>vlList=this.findAllBySql("select * from VehicleLine as v where SQRT(pow(6370693.5 * COS(v.lat/1000000*pi()/180)*(if((v.lng/1000000*pi()/180-"+devGPS.getLng()/(double)100000+"*pi()/180)>pi(),2*pi()-(v.lng/1000000*pi()/180-"+devGPS.getLng()/(double)100000+"*pi()/180),(if((v.lng/1000000*pi()/180-"+devGPS.getLng()/(double)100000+"*pi()/180)<-pi(),2*pi()+(v.lng/1000000*pi()/180-"+devGPS.getLng()/(double)100000+"*pi()/180),(v.lng/1000000*pi()/180-"+devGPS.getLng()/(double)100000+"*pi()/180))))),2) + pow(6370693.5 * (v.lat/1000000 * pi()/180 - "+devGPS.getLat()/(double)100000+"*pi()/180),2))<="+devite,VehicleLine.class);
        if(vlList==null||vlList.size()<=0)
            return null;
        Map<Line,Integer>lineMap=new HashMap<Line, Integer>();
        for(VehicleLine vehicleLine:vlList){
            Integer count=lineMap.get(vehicleLine.getLine());
            if(count==null){
                lineMap.put(vehicleLine.getLine(),1);
            }else{
                lineMap.put(vehicleLine.getLine(),count+1);
            }
        }
        return getSortMax(lineMap);
    }
    public Line getSortMax(Map<Line,Integer>lineMap){
        Iterator<Line>lines=lineMap.keySet().iterator();
        if(!lines.hasNext())
            return null;
        Line maxLine=lines.next();
        Integer max=0;
        while (lines.hasNext()){
            Line compareLine=lines.next();
            Integer compare=lineMap.get(compareLine);
            if(compare>max)
                maxLine=compareLine;
        }
        return maxLine;
    }
}
