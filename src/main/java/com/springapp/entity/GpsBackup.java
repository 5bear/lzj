package com.springapp.entity;

import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import java.sql.Timestamp;

/**
 * Created by 11369 on 2016/9/28.
 */
@Entity
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class GpsBackup {
    private Long id;
    private String devIDNO;
    private Long lng;
    private Long lat;
    private String direction;
    private String directioninfo;
    private Integer speed;
    private String timestamp;
    private String HDD;//00是不存在 01是存在 10是断电
    private Timestamp GPSTime;
    private Integer isDrive;//0表示正在作业，1表示静止
    private Integer overSpeed;//超速 0 1
    private Integer inEfence;//是否在电子围栏内,默认为0 在
    private String lineName;//所属路段名称
    private Long lineID;//所属路段id
    private String eFence;//所属电子围栏
    private Long eFenceID;//电子围栏
    private Integer mile;//与上一个点的距离
    private String road;//路段
    @Column
    public Integer getMile() {
        return mile;
    }

    public void setMile(Integer mile) {
        this.mile = mile;
    }

    @Column
    public String getDirectioninfo() {
        return directioninfo;
    }

    public void setDirectioninfo(String directioninfo) {
        this.directioninfo = directioninfo;
    }

    @Transient
    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    @Column(length = 45)
    public String geteFence() {
        return eFence;
    }

    public void seteFence(String eFence) {
        this.eFence = eFence;
    }

    @Column()
    public Long geteFenceID() {
        return eFenceID;
    }

    public void seteFenceID(Long eFenceID) {
        this.eFenceID = eFenceID;
    }

    @Column
    public Integer getInEfence() {
        return inEfence;
    }

    public void setInEfence(Integer inEfence) {
        this.inEfence = inEfence;
    }

    @Column(length = 45)
    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    @Column
    public Long getLineID() {
        return lineID;
    }

    public void setLineID(Long lineID) {
        this.lineID = lineID;
    }

    @Column
    public Integer getOverSpeed() {
        return overSpeed;
    }

    public void setOverSpeed(Integer overSpeed) {
        this.overSpeed = overSpeed;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column
    public Timestamp getGPSTime() {
        return GPSTime;
    }

    public void setGPSTime(Timestamp GPSTime) {
        this.GPSTime = GPSTime;
    }

    @Column(length = 10)
    public Integer getIsDrive() {
        return isDrive;
    }

    public void setIsDrive(Integer isDrive) {
        this.isDrive = isDrive;
    }

    @Column
    public String getHDD() {
        return HDD;
    }

    public void setHDD(String HDD) {
        this.HDD = HDD;
    }


    @Column
    public String getDevIDNO() {
        return devIDNO;
    }

    public void setDevIDNO(String devIDNO) {
        this.devIDNO = devIDNO;
    }
    @Column
    public Long getLng() {
        return lng;
    }

    public void setLng(Long lng) {
        this.lng = lng;
    }
    @Column
    public Long getLat() {
        return lat;
    }

    public void setLat(Long lat) {
        this.lat = lat;
    }
    @Column
    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }
    @Column
    public Integer getSpeed() {
        return speed;
    }

    public void setSpeed(Integer speed) {
        this.speed = speed;
    }

    @Column
    public String getRoad() {
        return road;
    }

    public void setRoad(String road) {
        this.road = road;
    }
}
