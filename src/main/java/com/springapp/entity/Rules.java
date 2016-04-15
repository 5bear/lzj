package com.springapp.entity;

/**
 * Created by shigaolei on 2016/4/12.
 */
import javax.persistence.*;

@Entity
@Table(name = "Rules")
public class Rules {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column()
    public Double getTimes() {
        return Times;
    }

    public void setTimes(Double times) {
        Times = times;
    }

    private Long id;
    private Double CleanCarDeviate;
    private Double PullCarDeviate;
    private Double ViewCarDeviate;
    private Double CleanCarSpeed;
    private Double PullCarSpeed;
    private Double ViewCarSpeed;
    private Double Times;
    private String StartTime;
    private String EndTime;

    @Column(length = 45,name = "CleanCarDeviate")
    public Double getCleanCarDeviate() {
        return CleanCarDeviate;
    }

    public void setCleanCarDeviate(Double CleanCarDeviate) {
        this.CleanCarDeviate = CleanCarDeviate;
    }

    @Column(length = 45,name = "PullCarDeviate")
    public Double getPullCarDeviate() {
        return PullCarDeviate;
    }

    public void setPullCarDeviate(Double PullCarDeviate) {
        this.PullCarDeviate = PullCarDeviate;
    }

    @Column(length = 45,name = "ViewCarDeviate")
    public Double getViewCarDeviate() {
        return ViewCarDeviate;
    }

    public void setViewCarDeviate(Double ViewCarDeviate) {
        this.ViewCarDeviate = ViewCarDeviate;
    }

    @Column(length= 45,name="CleanCarSpeed")
    public Double getCleanCarSpeed(){return CleanCarSpeed;}

    public void setCleanCarSpeed(Double CleanCarSpeed){this.CleanCarSpeed=CleanCarSpeed;}

    @Column(length= 45,name="PullCarSpeed")
    public Double getPullCarSpeed(){return PullCarSpeed;}

    public void setPullCarSpeed(Double PullCarSpeed){this.PullCarSpeed=PullCarSpeed;}

    @Column(length= 45,name="ViewCarSpeed")
    public Double getViewCarSpeed(){return ViewCarSpeed;}

    public void setViewCarSpeed(Double ViewCarSpeed){this.ViewCarSpeed=ViewCarSpeed;}

    @Column(length= 45,name="StartTime")
    public String getStartTime(){return StartTime;}

    public void setStartTime(String StartTime){this.StartTime=StartTime;}

    @Column(length= 45,name="EndTime")
    public String getEndTime(){return EndTime;}

    public void setEndTime(String EndTime){this.EndTime=EndTime;}
}
