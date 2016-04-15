package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/4/3.
 * 车辆
 */
@Entity
@Table(name = "Vehicle")
public class Vehicle {
    private Long id;
    private String company;//所属公司
    private String vehicleType;//车辆类型
    private String vehicleLicence;//车辆牌照
    private String vehicleModel;//车辆型号
    private String eFence;//电子围栏
    private Long eFenceId;//
    private String remark;//备注
    private int isDelete;
    private String createTime;//添加时间
    private String editTime;//修改时间
    private String deleteTime;//删除时间

    @Column()
    public int getIsDelete(){return isDelete;}
    public void setIsDelete(int isDelete){this.isDelete=isDelete;}

    @Column(length = 45,name = "vehicleLicence")
    public String getVehicleLicence() {
        return vehicleLicence;
    }

    public void setVehicleLicence(String vehicleLicence) {
        this.vehicleLicence = vehicleLicence;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @Column(name = "eFenceId")
    public Long geteFenceId() {
        return eFenceId;
    }

    public void seteFenceId(Long eFenceId) {
        this.eFenceId = eFenceId;
    }
    @Column(length = 45,name = "company")
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
    @Column(length = 45,name = "vehicleType")
    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }
    @Column(length = 45,name = "vehicleModel")
    public String getVehicleModel() {
        return vehicleModel;
    }

    public void setVehicleModel(String vehicleModel) {
        this.vehicleModel = vehicleModel;
    }
    @Column(length = 45,name = "eFence")
    public String geteFence() {
        return eFence;
    }

    public void seteFence(String eFence) {
        this.eFence = eFence;
    }
    @Column(length = 255,name = "remark")
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Column(length = 45,name = "editTime")
    public String getEditTime() {
        return editTime;
    }

    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }
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
}
