package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/4/3.
 * 电子围栏
 */
@Entity
@Table(name = "eFence")
public class eFence {
    private Long id;
    private Double lat;//纬度
    private String coords;//形成围栏的点的坐标
    private String eFence;//名称
    private String company;//所属公司
    private String inputMan;//录入人
    private Long inputId;//录入人id
    private String vehicles;//相关车辆车牌
    private String vehicleIds;//相关车辆id集合
    private int isDelete;
    @Column()
    public String getCoords() {
        return coords;
    }

    public void setCoords(String coords) {
        this.coords = coords;
    }
    private Double lng;//经度

    @Column
    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }
    @Column
    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }
    @Column(length = 45)
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    @Column()
    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }
    @Column(length = 45)
    public String getEditTime() {
        return editTime;
    }

    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }
    @Column(length = 45)
    public String getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(String deleteTime) {
        this.deleteTime = deleteTime;
    }

    private String createTime;
    private String editTime;
    private String deleteTime;
    @Column(length = 45,name = "inputMan")
    public String getInputMan() {
        return inputMan;
    }

    public void setInputMan(String inputMan) {
        this.inputMan = inputMan;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @Column(length = 45,name = "eFence")
    public String geteFence() {
        return eFence;
    }

    public void seteFence(String eFence) {
        this.eFence = eFence;
    }
    @Column(length = 45,name = "company")
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
    @Column(name = "inputId")
    public Long getInputId() {
        return inputId;
    }

    public void setInputId(Long inputId) {
        this.inputId = inputId;
    }
    @Column(length = 255,name = "vehicles")
    public String getVehicles() {
        return vehicles;
    }

    public void setVehicles(String vehicles) {
        this.vehicles = vehicles;
    }
    @Column(length = 45,name = "vehicleIds")
    public String getVehicleIds() {
        return vehicleIds;
    }

    public void setVehicleIds(String vehicleIds) {
        this.vehicleIds = vehicleIds;
    }
}
