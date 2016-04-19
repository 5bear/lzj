package com.springapp.dao;

import com.springapp.entity.Package;
import com.sun.javaws.progress.Progress;

import java.util.List;

/**
 * Created by as on 2016/4/18.
 */
public class ProgressDao extends BaseDao {
    public Progress getById(Long id){
        return this.get(Progress.class,id);
    }
    public List<Package> getNameList() {
        return this.findAll("from Package where isDelete = 0", Package.class);
    }
}
