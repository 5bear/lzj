package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/5/9.
 */
@Entity
public class VehiclePos {
    private Long id;
    private Long OBUId;
    private Double lng;
    private Double lat;
    private String direction;
    private int speed;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column
    public Long getOBUId() {
        return OBUId;
    }

    public void setOBUId(Long OBUId) {
        this.OBUId = OBUId;
    }
    @Column
    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }
    @Column
    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
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
