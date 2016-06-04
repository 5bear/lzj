package com.springapp.dao;

import com.springapp.classes.model.Pager;
import com.springapp.entity.Package;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PackageDao extends BaseDao1<Package> {
    public Package getById(Long id) {
        return this.get(id);
    }

    public List<Package> getList() {
        String hql = "from Package where isDelete = 0";
        return this.list(hql);
    }

    public Pager<Package> getPager(String con) {
        String hql = "from Package where isDelete = 0";

        if (!"".equals(con.trim())){
            hql+=" and (company like '%"+con+"%' or packageName like '%"+con+"%')";
        }
        return this.find(hql);
    }

    public Package getByName(String name) {
        String hql = "from Package where packageName = '"+name+"'";
        return (Package)this.queryObject(hql);
    }
}
