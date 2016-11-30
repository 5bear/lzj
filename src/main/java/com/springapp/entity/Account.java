package com.springapp.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ZhanShaoxiong on 2016/4/3.
 */
@Entity
public class Account {
    private Long id;
    private String account;//账号
    private String username;
    private String password;
    private String power;//权限
    private String company;//所属部门
    private String phoneNum;//联系电话
    private Timestamp lastLogin;//最后登录时间 yyyy/MM/dd
    private String remark;
    private int viewExcpt;//是否查看异常 缺省 0 可查看

    public int getViewExcpt() {
        return viewExcpt;
    }

    public void setViewExcpt(int viewExcpt) {
        this.viewExcpt = viewExcpt;
    }

    @Column()
    public String getCenter() {
        return center;
    }

    public void setCenter(String center) {
        this.center = center;
    }
    @Column()
    public int getZoom() {
        return zoom;
    }

    public void setZoom(int zoom) {
        this.zoom = zoom;
    }

    private String center;//常用地区地图中心点
    private int zoom;//地图当前缩放比例
    @Column()
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }


    @Column
    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }


    @Column(length = 45)
    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }
    @Column(length = 45)
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
    @Column()
    public Timestamp getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }
    @Column()
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }


    @Column(length = 45,name="username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @Column(length = 45,name="password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
