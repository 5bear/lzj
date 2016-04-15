package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/4/3.
 * 布点计划
 */
@Entity
@Table(name="Position")
public class Position {
    private Long id;
    private String vehicle;//车牌
    private Long vehicleId;//车辆id
    private String driver;//驾驶员
    private String beginTime;//开始时间
    private String stopTime;//结束时间
    private int isDelete;
    private String createTime;//添加时间
    private String editTime;//修改时间
    private String deleteTime;//删除时间

    @Column()
    public int getIsDelete(){return isDelete;}
    public void setIsDelete(int isDelete){this.isDelete=isDelete;}
    @Column(length = 45,name = "beginTime")
    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @Column(length = 45,name = "vehicle")
    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }
    @Column(name = "vehicleId")
    public Long getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(Long vehicleId) {
        this.vehicleId = vehicleId;
    }
    @Column(length = 45,name = "driver")
    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }
    @Column(length = 45,name = "stopTime")
    public String getStopTime() {
        return stopTime;
    }

    public void setStopTime(String stopTime) {
        this.stopTime = stopTime;
    }
    @Column(length = 45,name = "createTime")
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    @Column(length = 45,name = "editTime")
    public String getEditTime() {
        return editTime;
    }

    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }
    @Column(length = 45,name = "deleteTime")
    public String getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(String deleteTime) {
        this.deleteTime = deleteTime;
    }
}
