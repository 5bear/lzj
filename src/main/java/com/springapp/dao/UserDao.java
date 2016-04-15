package com.springapp.dao;

import com.springapp.entity.Account;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/4.
 *
 */
@Repository
public class UserDao extends BaseDao {
    public Account getById(Long id){
        return this.get(Account.class,id);
    }
    public List<Account>getList(){
        return this.findAll("from Account",Account.class);
    }
}
