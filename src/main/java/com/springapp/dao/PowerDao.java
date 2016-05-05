package com.springapp.dao;

import com.springapp.entity.Auth;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/4.
 */
@Repository
public class PowerDao extends BaseDao {
    public Auth get(String pageName,String role){
        return this.find("from Auth where pageName=? and role=?",Auth.class,new Object[]{pageName,role});
    }

    public List<Auth> authList(){
        return this.findAll("from Auth",Auth.class);
    }

    public List<Auth>getByRole(String role){
        return this.findAll("from Auth where role=?",new Object[]{role});
    }

    public List<Auth>getByPagename(String pageName){
        return this.findAll("from Auth where pageName=? order by power asc",new Object[]{pageName});
    }
}
