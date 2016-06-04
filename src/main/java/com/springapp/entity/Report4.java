package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/5/22.
 * 养护车辆作业情况
 */
@Entity
@Table(name = "Report4")
public class Report4 {
    private Long id;
    private String company;//公司
    private String vehicleLicence;//作业车辆车牌号
    private String vehicleType; //车辆类型
    private String vehicleUser; //车辆使用人
    private String eventDate; //事件日期
    private String startTime; //起始时间
    private String endTime; //结束时间
    private int overspeedTime; //超速时间（分钟）
    private int overspeedMile; // 超速里程（米）
    private int minSpeed; //最小速度
    private int maxSpeed; // 最大速度
    private String reason;// 原因
    private String feedback;//反馈

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getVehicleLicence() {
        return vehicleLicence;
    }

    public void setVehicleLicence(String vehicleLicence) {
        this.vehicleLicence = vehicleLicence;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getVehicleUser() {
        return vehicleUser;
    }

    public void setVehicleUser(String vehicleUser) {
        this.vehicleUser = vehicleUser;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getOverspeedTime() {
        return overspeedTime;
    }

    public void setOverspeedTime(int overspeedTime) {
        this.overspeedTime = overspeedTime;
    }

    public int getOverspeedMile() {
        return overspeedMile;
    }

    public void setOverspeedMile(int overspeedMile) {
        this.overspeedMile = overspeedMile;
    }

    public int getMinSpeed() {
        return minSpeed;
    }

    public void setMinSpeed(int minSpeed) {
        this.minSpeed = minSpeed;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(int maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
