package com.springapp.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2016/6/1.
 */
@Entity
@Table(name = "MyException")
public class MyException {
    private int id;
    private String vehicleLicense;
    private String vehicleType;
    private String eventDate;
    private String eventTime; //发生时间段12:00 - 13：00
    private String eventRoad; //发生路段
    private String type; // 异常类型
    private int state; // 1处理，0未处理
    private Timestamp timestamp;//gpsTime

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVehicleLicense() {
        return vehicleLicense;
    }

    public void setVehicleLicense(String vehicleLicense) {
        this.vehicleLicense = vehicleLicense;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getEventRoad() {
        return eventRoad;
    }

    public void setEventRoad(String eventRoad) {
        this.eventRoad = eventRoad;
    }
}
