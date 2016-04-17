package com.springapp.dao;

import com.springapp.entity.Park;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/4.
 *
 */
@Repository
public class ParkDao extends BaseDao {
    public Park getById(Long id) {
        return this.get(Park.class, id);
    }

    public List<Park> getList() {
        return this.findAll("from Park where isDelete='0'", Park.class);
    }
}
