package com.springapp.dao;

import com.springapp.entity.Package;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/4.
 *
 */
@Repository
public class PackageDao extends BaseDao {
    public Package getById(Long id) {
        return this.get(Package.class, id);
    }

    public List<Package> getList() {
        return this.findAll("from Package where isDelete = 0", Package.class);
    }
}
