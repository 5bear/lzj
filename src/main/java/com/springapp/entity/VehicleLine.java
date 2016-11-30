package com.springapp.entity;
import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by 11369 on 2016/6/7.
 */
@Entity
public class VehicleLine {
    private Long id;
    private Line line;
    private Long lng;
    private Long lat;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "line")
    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
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
}
