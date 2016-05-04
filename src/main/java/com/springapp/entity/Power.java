package com.springapp.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by ZhanShaoxiong on 2016/5/2.
 */
@Entity
public class Power {
    private Long id;
    private String pageName;
    private String role;//角色
    private int view;//0 不能访问 1 能访问
    private int manage;//0 不能管理 1 能管理
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
