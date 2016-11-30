package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/4/3.
 * 包件
 */
@Entity
@Table(name="Package")
public class Package {
    private Long id;
    private String company;//所属公司
    private String packageName;//包件名称
    private double realDistance;  //实际总里程
    private double distance;//总里程
    private String roads;//包含路段名称
    private String inputMan;//录入人
    private Long inputId;//录入人id
    private int time;//次数
    private String remark;//备注
    private int isDelete;
    private String runtime;//包件执行时间
    private String createTime;//添加时间
    private String editTime;//修改时间
    private String deleteTime;//删除时间


    @Column(name = "inputId")
    public Long getInputId() {
        return inputId;
    }

    public void setInputId(Long inputId) {
        this.inputId = inputId;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(length = 45,name = "company")
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
    @Column(length = 45,name = "packageName")
    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    @Column(length = 45,name = "distance")
    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    @Column(length = 45,name = "realDistance")
    public double getRealDistance() {
        return realDistance;
    }

    public void setRealDistance(double realDistance) {
        this.realDistance = realDistance;
    }

    @Column(length = 255,name = "roads")
    public String getRoads() {
        return roads;
    }

    public void setRoads(String roads) {
        this.roads = roads;
    }
    @Column(length = 45,name = "inputMan")
    public String getInputMan() {
        return inputMan;
    }

    public void setInputMan(String inputMan) {
        this.inputMan = inputMan;
    }
    @Column(name = "time")
    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
    @Column(length = 255,name = "remark")
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Column()
    public int getIsDelete(){return isDelete;}
    public void setIsDelete(int isDelete){this.isDelete=isDelete;}

    @Column(length = 45,name = "runtime")
    public String getRuntime() {
        return runtime;
    }

    public void setRuntime(String runtime) {
        this.runtime = runtime;
    }

    @Column(length = 45,name = "createTime")
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Column(length = 45,name = "editTime")
    public String getEditTime() {
        return editTime;
    }

    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }
    @Column(length = 45,name = "deleteTime")
    public String getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(String deleteTime) {
        this.deleteTime = deleteTime;
    }
}
