package com.springapp.dao;

import com.springapp.entity.MaintainProgress;
import com.springapp.entity.Package;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by as on 2016/4/18.
 */
@Repository
public class MaintainProgressDao extends BaseDao {
    public MaintainProgress getById(Long id){
        return this.get(MaintainProgress.class,id);
    }
    public List<Package> getNameList() {
        return this.findAll("from Package where isDelete = 0", Package.class);
    }
}
