package com.springapp.entity;

import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/5/22.
 * 牵引车辆位置信息报表
 */
@Entity
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "Report1")
public class Report1 {
    private Long id;
    private String company;//公司
    private String vehicleLicense;//车牌号
    private String planPosition; //计划待命位置
    private String realPosition; //实际待命位置
    private String arriveDate; //到达日期
    private String arriveTime; //到达时间
    private String state;// 状态：出动，待命

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }


    public String getvehicleLicense() {
        return vehicleLicense;
    }

    public void setvehicleLicense(String vehicleLicense) {
        this.vehicleLicense = vehicleLicense;
    }

    public String getPlanPosition() {
        return planPosition;
    }

    public void setPlanPosition(String planPosition) {
        this.planPosition = planPosition;
    }

    public String getRealPosition() {
        return realPosition;
    }

    public void setRealPosition(String realPosition) {
        this.realPosition = realPosition;
    }

    public String getArriveDate() {
        return arriveDate;
    }

    public void setArriveDate(String arriveDate) {
        this.arriveDate = arriveDate;
    }

    public String getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(String arriveTime) {
        this.arriveTime = arriveTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
