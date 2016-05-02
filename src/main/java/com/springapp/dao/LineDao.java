package com.springapp.dao;

import com.springapp.entity.Line;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    public List<Line>getByPage(int start,int end){
        return this.findByPage("from Line",Line.class,start,end);
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
}
