package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by as on 2016/4/18.
 */
@Entity
@Table(name = "MaintainProgress")
public class MaintainProgress {
    private Long id;
    private String company;//所属公司
    private String packageName;//包件名称
    private String roads;//包含路段名称
    private String time;//时间
    private String distance; //里程
    private String coverage; //匝道覆盖



    @Column(length = 45,name = "coverage")
    public String getCoverage() {
        return coverage;
    }

    public void setCoverage(String coverage) {
        this.coverage = coverage;
    }

    @Column(length = 45,name = "distance")
    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    @Column(length = 45,name = "time")
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Column(length = 45,name = "company")
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @Column(length = 45,name = "PackageName")
    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    @Column(length = 255,name = "Roads")
    public String getRoads() {
        return roads;
    }

    public void setRoads(String roads) {
        this.roads = roads;
    }



}
