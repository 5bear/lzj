package com.springapp.dao;

import com.springapp.entity.RFID;
import com.springapp.entity.Rules;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by shigaolei on 2016/4/12.
 */
@Repository
public class RulesDao extends BaseDao {
    public Rules getById(Long id){
        return this.get(Rules.class,id);
    }
    public List<Rules>getList(){
        return this.findAll("from Rules",Rules.class);
    }
}
