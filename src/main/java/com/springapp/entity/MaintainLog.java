package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by yanglin on 16/4/19.
 * 养护日志
 */
@Entity
@Table(name="MaintainLog")
public class MaintainLog {
    private Long id;
    private String company;//所属公司
    private String vehicleLicence;//车辆牌照
    private String principal;//负责人
    private String road;//路段信息
    private String eventType;//事件类型
    private String dayTime;//日期
    private String remark;//事件介绍
    private String time;//发生时间(!!!!!!这里是什么类型!!!!!!!)
    private int isDelete;
    private String createTime;//添加时间
    private String editTime;//修改时间
    private String deleteTime;//删除时间

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    @Column(length = 45,name = "company")
    public String getCompany() {
        return company;
    }
    public void setCompany(String company) {
        this.company = company;
    }

    @Column(length = 45,name = "vehicleLicence")
    public String getVehicleLicence() { return vehicleLicence; }
    public void setVehicleLicence(String vehicleLicence) { this.vehicleLicence = vehicleLicence; }

    @Column(length = 45,name = "principal")
    public String getPrincipal() { return principal; }
    public void setPrincipal(String principal) { this.principal = principal; }

    @Column(length = 45,name = "road")
    public String getRoad() { return road; }
    public void setRoad(String road) { this.road = road;}

    @Column(length = 45,name = "eventType")
    public String getEventType() { return eventType; }
    public void setEventType(String eventType) { this.eventType = eventType;}

    @Column(length = 45,name = "dayTime")
    public String getDayTime() { return dayTime; }
    public void setDayTime(String dayTime) { this.dayTime = dayTime;}

    @Column(length = 255,name = "remark")
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Column(length = 45,name = "time")
    public String getTime() { return time; }
    public void setTime(String time) { this.time = time;}

    @Column(length =10,name="isDelete")
    public int getIsDelete(){return isDelete;}
    public void setIsDelete(int isDelete){this.isDelete=isDelete;}

    @Column(length = 45,name = "createTime")
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Column(length = 45,name = "deleteTime")
    public String getDeleteTime() {
        return deleteTime;
    }
    public void setDeleteTime(String deleteTime) {
        this.deleteTime = deleteTime;
    }

    @Column(length = 45,name = "editTime")
    public String getEditTime() {
        return editTime;
    }
    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }

}

