package com.springapp.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by ZhanShaoxiong on 2016/5/2.
 */
@Entity
public class Auth implements Serializable{
    private Long id;
    private String pageName;
    private String role;//角色

    @Column
    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    private int power;//权值
    private String visit;//0 不能访问 1 能访问
    private String management;//0 不能管理 1 能管理
    @Column
    public String getVisit() {
        return visit;
    }

    public void setVisit(String visit) {
        this.visit = visit;
    }
    @Column
    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }
    @Column
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    @Column
    public String getManagement() {
        return management;
    }

    public void setManagement(String management) {
        this.management = management;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
