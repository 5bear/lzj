package com.springapp.dao;

import com.springapp.entity.eFence;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/4.
 *
 */
@Repository
public class eFenceDao extends BaseDao {
    public eFence getById(Long id){
        return this.get(eFence.class,id);
    }
    public eFence getByCoords(String coords){
        return this.find("from eFence where coords=?",eFence.class,new Object[]{coords});
    }
    /*public void deleteByCoords(String coords){
        eFence eFence=this.getByCoords(coords);
        eFence.setIsDelete(1);
        this.update(eFence);
    }*/
    public List<eFence>getList(){
        return this.findAll("from eFence where isDelete=0",eFence.class);
    }
    public List<eFence>getListByCompany(String company){
        return this.findAll("from eFence where company=? and isDelete=0",eFence.class,new Object[]{company});
    }
}
