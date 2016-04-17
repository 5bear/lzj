package com.springapp.dao;

import com.springapp.entity.RFID;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/1.
 */
@Repository
public class RFIDDao extends BaseDao {
    public RFID getById(Long id){
        return this.get(RFID.class,id);
    }
    public List<RFID>getList(){
        return this.findAll("from RFID where isDelete=0",RFID.class);
    }
    public List<RFID>getListByRoad(String road){
        return this.findAll("from RFID where isDelete=0 and road=?",RFID.class,new Object[]{road});
    }
    public boolean isDuplicated(String serialNumber){
        List<RFID>rfidList=this.getList();
        for(RFID rfid:rfidList){
            if(rfid.getSerialNumber().equals(serialNumber))
                return true;
        }
        return false;
    }
}
