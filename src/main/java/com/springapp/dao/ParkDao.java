package com.springapp.dao;

import com.springapp.classes.model.Pager;
import com.springapp.entity.Park;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ParkDao extends BaseDao1<Park> {
    public Park getById(Long id) {
        return this.get(id);
    }

   /* public List<Park> getList() {
        return this.findAll("from Park where isDelete='0'", Park.class);
    }*/

    public Pager<Park> getList(String name) {
        String hql = "from Park where isDelete='0'";
        if (!"".equals(name.trim())){
            hql+=" and parkName like '%"+name+"%'";
        }
        return this.find(hql);
    }

    public Park getByName(String name) {
        String hql = "from Park where parkName='"+name+"'";
        return (Park)this.queryObject(hql);
    }
}
