package com.springapp.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ZhanShaoxiong on 2016/5/9.
 * 报警信息
 */
@Entity
public class VehiclePos {
    private Long id;
    private String serialNumber;
    private String devIDNO;
    private Long lng;
    private Long lat;
    private String direction;
    private int speed;
    private String HDD;//00是不存在 01是存在 10是断电
    private Timestamp ArmTime;//报警时间
    private int ArmType;//报警类型
    private int ArmInfo;//报警描述
    private String ArmDesc;//报警描述
    private int OilMass;//油量
    private int ParkTime;//停车时间
    private Timestamp GpsTime;//gps时间
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column()
    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    @Column
    public String getArmDesc() {
        return ArmDesc;
    }

    public void setArmDesc(String armDesc) {
        ArmDesc = armDesc;
    }

    @Column
    public Timestamp getArmTime() {
        return ArmTime;
    }

    public void setArmTime(Timestamp armTime) {
        ArmTime = armTime;
    }
    @Column
    public int getArmType() {
        return ArmType;
    }

    public void setArmType(int armType) {
        ArmType = armType;
    }
    @Column
    public int getArmInfo() {
        return ArmInfo;
    }

    public void setArmInfo(int armInfo) {
        ArmInfo = armInfo;
    }
    @Column
    public int getOilMass() {
        return OilMass;
    }

    public void setOilMass(int oilMass) {
        OilMass = oilMass;
    }
    @Column
    public int getParkTime() {
        return ParkTime;
    }

    public void setParkTime(int parkTime) {
        ParkTime = parkTime;
    }
    @Column
    public Timestamp getGpsTime() {
        return GpsTime;
    }

    public void setGpsTime(Timestamp gpsTime) {
        GpsTime = gpsTime;
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
