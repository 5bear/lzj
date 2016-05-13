package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/5/9.
 */
@Entity
public class VehiclePos {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    private Long id;
    private String devIDNO;
    private Long lng;
    private Long lat;
    private String direction;
    private int speed;
    private String HDD;//00是不存在 01是存在 10是断电

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

    private int isDrive;//0表示正在作业，1表示静止
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
