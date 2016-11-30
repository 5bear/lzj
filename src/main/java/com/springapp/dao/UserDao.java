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
    public Account getByUsername(String username){
        return this.find("from Account where username=?",Account.class,new Object[]{username});
    }
    public Account getByAccount(String account){
        return this.find("from Account where account=?",Account.class,new Object[]{account});
    }
    public List<Account>getList(){
        return this.findAll("from Account",Account.class);
    }
    public boolean isDuplicated(Account account){
        List<Account>accounts=this.getList();
        for(Account account1:accounts){
            if(account1.getAccount().equals(account.getAccount())&&!account1.getId().equals(account.getId()))
                return true;
        }
        return false;
    }
    public List<Account> getAccount(String findName){
        String hql="from Account";
        if(findName!=null&&!findName.equals(""))
            hql+=" where username like "+"'%"+findName+"%'";
        return findAll(hql,Account.class);
    }
}
