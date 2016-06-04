package com.springapp.mvc;

import com.springapp.entity.DevGPS;
import com.springapp.entity.Vehicle;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZhanShaoxiong on 2016/5/24.
 */
@Controller
@RequestMapping(value = "Track")
public class TrackController extends BaseController {
    @RequestMapping(value = "getCurrentTrack",method = RequestMethod.POST)
    @ResponseBody
    public String getCurrentTrack(){
        List<Vehicle>vehicleList=vehicleDao.getList();
        List<Map>mapList=new ArrayList<Map>();
        for(Vehicle vehicle:vehicleList){
            Map map=new HashMap();
            if (vehicle.getOBUId()!=null&&!vehicle.getOBUId().equals("")&&vehicle.getVehicleType().equals("清扫车")){
                List<DevGPS>devGPSList=devGpsDao.getByCurrentTrackDevNo(vehicle.getOBUId());
                if(devGPSList!=null&&devGPSList.size()>0) {
                    map.put("vehicle", vehicle);
                    map.put("list", devGPSList);
                    mapList.add(map);
                }
            }
        }
        return JSONArray.fromObject(mapList).toString();
    }
    @RequestMapping(value = "getAllCurrentTrack",method = RequestMethod.POST)
    @ResponseBody
    public String getAllCurrentTrack(){
        List<Vehicle>vehicleList=vehicleDao.getList();
        List<Map>mapList=new ArrayList<Map>();
        for(Vehicle vehicle:vehicleList){
            Map map=new HashMap();
            if (vehicle.getOBUId()!=null&&!vehicle.getOBUId().equals("")){
                List<DevGPS>devGPSList=devGpsDao.getByCurrentTrackDevNo(vehicle.getOBUId());
                if(devGPSList!=null&&devGPSList.size()>0) {
                    map.put("vehicle", vehicle);
                    map.put("list", devGPSList);
                    mapList.add(map);
                }
            }
        }
        return JSONArray.fromObject(mapList).toString();
    }
    @RequestMapping(value = "getHistoryTrack",method = RequestMethod.POST)
    @ResponseBody
    public String getHistoryTrack(@RequestParam(value = "param")String param,@RequestParam(value = "fromDate")String fromDate,@RequestParam(value = "toDate")String toDate) throws ParseException {
        Vehicle vehicle=vehicleDao.getByVehicleLicence(param);
        Map map=new HashMap();
        if (vehicle.getOBUId()!=null&&!vehicle.getOBUId().equals("")){
            List<DevGPS>devGPSList=devGpsDao.getHistoryTrack(fromDate,toDate,vehicle.getOBUId());
            if(devGPSList!=null&&devGPSList.size()>0) {
                map.put("vehicle", vehicle);
                map.put("list", devGPSList);
            }
        }
        return JSONObject.fromObject(map).toString();
    }
    @RequestMapping(value = "getLatestPos",method = RequestMethod.POST)
    @ResponseBody
    public String getLatestPos(@RequestParam(value = "DevIDNO")String DevIDNO){
        DevGPS devGPS=devGpsDao.getLatestPos(DevIDNO);
        return JSONObject.fromObject(devGPS).toString();
    }
}
