package com.springapp.classes;

import com.springapp.entity.GpsBackup;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Created by 11369 on 2016/10/22.
 */
public class LatestData {
    String devIDNO;
    String online;
    GpsBackup pos;
    JSONArray rfid;

    public String getDevIDNO() {
        return devIDNO;
    }

    public void setDevIDNO(String devIDNO) {
        this.devIDNO = devIDNO;
    }

    public String getOnline() {
        return online;
    }

    public void setOnline(String online) {
        this.online = online;
    }


    public GpsBackup getPos() {
        return pos;
    }

    public void setPos(GpsBackup pos) {
        this.pos = pos;
    }

    public JSONArray getRfid() {
        return rfid;
    }

    public void setRfid(JSONArray rfid) {
        this.rfid = rfid;
    }
}
