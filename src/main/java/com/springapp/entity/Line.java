package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/4/3.
 * 作业线路
 */
@Entity
@Table(name="Line")
public class Line {
    private Long id;
    private String company;//所属公司
    private String line;//线路名称
    private String startCoord;//开始坐标

    private Double lng;//定位

    @Column()
    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    @Column()
    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    private Double lat;
    @Column()
    public String getCoords() {
        return coords;
    }

    public void setCoords(String coords) {
        this.coords = coords;
    }

    private String coords;//生成线路的点集合
    private String endCoord;//结束坐标
    private String direction;//方向

    @Column()
    public String getRealDistance() {
        return realDistance;
    }

    public void setRealDistance(String realDistance) {
        this.realDistance = realDistance;
    }

    private String realDistance;//实际路程
    @Column()
    public String getDirectionType() {
        return directionType;
    }

    public void setDirectionType(String directionType) {
        this.directionType = directionType;
    }

    private String directionType;//方向类型
    private String inputMan;//录入人
    private Long inputId;//录入人id
    private String remark;//备注
    private int isDelete;
    private String createTime;//添加时间
    private String editTime;//修改时间
    private String deleteTime;//删除时间

    @Column()
    public int getIsDelete(){return isDelete;}
    public void setIsDelete(int isDelete){this.isDelete=isDelete;}

    @Column(length = 45,name = "direction")
    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
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
    @Column(length = 45,name = "line")
    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }
    @Column(length = 45,name = "startCoord")
    public String getStartCoord() {
        return startCoord;
    }

    public void setStartCoord(String startCoord) {
        this.startCoord = startCoord;
    }
    @Column(length = 45,name = "endCoord")
    public String getEndCoord() {
        return endCoord;
    }

    public void setEndCoord(String endCoord) {
        this.endCoord = endCoord;
    }
    @Column(length = 45,name = "inputMan")
    public String getInputMan() {
        return inputMan;
    }

    public void setInputMan(String inputMan) {
        this.inputMan = inputMan;
    }
    @Column(name = "inputId")
    public Long getInputId() {
        return inputId;
    }

    public void setInputId(Long inputId) {
        this.inputId = inputId;
    }
    @Column(length = 255,name = "remark")
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
