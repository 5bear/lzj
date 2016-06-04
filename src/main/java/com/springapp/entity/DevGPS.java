package com.springapp.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ZhanShaoxiong on 2016/6/2.
 */
@Entity
public class DevGPS {
    private Long id;
    private String devIDNO;
    private Long lng;
    private Long lat;
    private String direction;
    private int speed;
    private String HDD;//00是不存在 01是存在 10是断电
    private Timestamp GPSTime;
    private int isDrive;//0表示正在作业，1表示静止
    private int overSpeed;//超速 0 1

    @Column
    public int getOverSpeed() {
        return overSpeed;
    }

    public void setOverSpeed(int overSpeed) {
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
    public int getIsDrive() {
        return isDrive;
    }

    public void setIsDrive(int isDrive) {
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
    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }
}
