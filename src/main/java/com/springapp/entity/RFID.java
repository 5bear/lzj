package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/4/1.
 * RFID
 */
@Entity
@Table(name = "RFID")
public class RFID {
    private Long id;
    private String equipNum;//设备编号
    private Double lng;//经度
    private Double lat;//纬度
    private String serialNumber;//序列号
    private String road;//所属路段
    private Long roadId;//作业线路id

    @Column(length = 45)
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Column()
    public Long getRoadId() {
        return roadId;
    }

    public void setRoadId(Long roadId) {
        this.roadId = roadId;
    }

    private String company;//所属公司
    private String zhadao;//布设闸道
    private String direction;//方向
    private String installPos;//安装位置
  /*  private String installPos2;//安装位置2*/
    private int isDelete;
    private String createTime;//添加时间
    private String editTime;//修改时间
    private String deleteTime;//删除时间
    @Column()
    public int getIsDelete(){
        return isDelete;
    }
    public void setIsDelete(int isDelete){
        this.isDelete=isDelete;
    }

    @Column(length = 45,name = "equipNum")
    public String getEquipNum() {
        return equipNum;
    }

    public void setEquipNum(String equipNum) {
        this.equipNum = equipNum;
    }
    @Column(length = 45,name = "zhadao")
    public String getZhadao() {
        return zhadao;
    }

    public void setZhadao(String zhadao) {
        this.zhadao = zhadao;
    }
    @Column(name = "direction")
    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }
    @Column(length = 45,name = "installPos1")
    public String getInstallPos() {
        return installPos;
    }

    public void setInstallPos(String installPos1) {
        this.installPos = installPos1;
    }
    @Column(length = 45,name = "serialNumber")
    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @Column(length = 45,name = "lng")
    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }
    @Column(length = 45,name = "lat")
    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }
    @Column(length = 45,name = "road")
    public String getRoad() {
        return road;
    }

    public void setRoad(String road) {
        this.road = road;
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
