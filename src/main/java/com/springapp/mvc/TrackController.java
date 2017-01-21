package com.springapp.mvc;

import com.springapp.classes.FileUtil;
import com.springapp.classes.HttpUtil;
import com.springapp.classes.LatestData;
import com.springapp.entity.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ZhanShaoxiong on 2016/5/24.
 */
@Controller
@RequestMapping(value = "Track")
public class TrackController extends BaseController {
    private String returnString="";
    private List<Vehicle> vehicleList=null;
    private List<Map<String, Object>> mapList=null;
    private JSONObject object;
    private JSONArray array;
    @RequestMapping(value = "getCurrentTrack",method = RequestMethod.GET)
    @ResponseBody
    public String getCurrentTrack(HttpSession session){
        try {
            String company = (String) session.getAttribute("company");
            List<GpsBackup>gpsBackupList=devGpsDao.getTodayQSTrack(company);
            vehicleList = company.equals("养护中心") ? vehicleDao.getListOBUID() : baseDao.findAll("from Vehicle where company='" + company + "' and OBUId !='' and isDelete=0 and vehicleType='清扫车'", Vehicle.class);
            mapList = new ArrayList<Map<String, Object>>();
            for (Vehicle vehicle : vehicleList) {
                Map<String, Object> map = new HashMap<String, Object>();
/*
                List<GpsBackup> devGPSList = devGpsDao.getByCurrentQSTrackDevNo(vehicle.getOBUId());
*/
                List<GpsBackup> devGPSList=new ArrayList<GpsBackup>();
                for(GpsBackup gpsBackup:gpsBackupList){
                    if(gpsBackup.getDevIDNO().equals(vehicle.getOBUId()))
                        devGPSList.add(gpsBackup);
                }
                if(devGPSList.size()>0) {
                    map.put("vehicle", vehicle);
                    map.put("list", devGPSList);
                    mapList.add(map);
                }
            }
            array=JSONArray.fromObject(mapList);
            returnString= array.toString();
            return returnString;
        }catch (Exception e){
            returnString="fail";
            return returnString;
        }finally {
            array=null;
            mapList=null;
            vehicleList=null;
        }
    }

    @RequestMapping(value = "getAllCurrentPos",method = RequestMethod.GET)
    @ResponseBody
    public String getAllCurrentPos(HttpSession session) {
        try {
            String company = (String) session.getAttribute("company");
            if (company == null)
                company = "养护中心";
            List<GpsBackup>gpsBackupList=devGpsDao.getLatestPos();
            vehicleList = company.equals("养护中心") ? vehicleDao.getListOBUID() : baseDao.findAll("from Vehicle where company='" + company + "' and OBUId !='' and isDelete=0", Vehicle.class);
            mapList = new ArrayList<Map<String, Object>>();
            for (Vehicle vehicle : vehicleList) {
                Map<String, Object> map = new HashMap<String, Object>();
                for(GpsBackup gpsBackup:gpsBackupList){
                    if(gpsBackup.getDevIDNO().equals(vehicle.getOBUId())){
                        map.put("vehicle", vehicle);
                        map.put("vehiclePos", gpsBackup);
                        mapList.add(map);
                        break;
                    }
                }
            }
            array=JSONArray.fromObject(mapList);
            returnString= array.toString();
            return returnString;
        }catch (Exception e){
            returnString="fail";
            return returnString;
        }finally {
            array=null;
            vehicleList=null;
            mapList=null;
        }
    }
    @RequestMapping(value = "getAllCurrentTrack",method = RequestMethod.GET)
    @ResponseBody
    public String getAllCurrentTrack(HttpSession session){
        try {
            String company = (String) session.getAttribute("company");
            if (company == null)
                company = "养护中心";
            vehicleList = company.equals("养护中心") ? vehicleDao.getList() : baseDao.findAll("from Vehicle where company='" + company + "'", Vehicle.class);
            mapList = new ArrayList<Map<String, Object>>();
            for (Vehicle vehicle : vehicleList) {
                Map<String, Object> map = new HashMap<String, Object>();
                if (vehicle.getOBUId() != null && !vehicle.getOBUId().equals("")) {
                    if (vehicle.getVehicleType().equals("清扫车")) {
                        List<GpsBackup> devGPSList = devGpsDao.getByCurrentQSTrackDevNo(vehicle.getOBUId());
                        eFence e = eFenceDao.getById(vehicle.geteFenceId());
                        List<RFID>returnList =  vehiclePosDao.getRFIDByCurrentTrackDevNo(vehicle.getOBUId());
                        if(returnList!=null)
                            map.put("rfid",returnList);
                        else
                            map.put("rfid","fail");
                        if (devGPSList != null && devGPSList.size() > 0) {
                            map.put("eFence", e);
                            map.put("vehicle", vehicle);
                            map.put("list", devGPSList);
                            mapList.add(map);
                        }
                        returnList=null;
                        e=null;
                        devGPSList=null;
                    } else {
                        eFence e = eFenceDao.getById(vehicle.geteFenceId());
                        List<GpsBackup> devGPSList = devGpsDao.getByCurrentTrackDevNo(vehicle.getOBUId());
                        if (devGPSList != null && devGPSList.size() > 0) {
                            map.put("eFence", e);
                            map.put("vehicle", vehicle);
                            map.put("list", devGPSList);
                            mapList.add(map);
                        }
                        e=null;
                        devGPSList=null;
                    }
                }
                vehicle=null;
                map=null;
            }
            array=JSONArray.fromObject(mapList);
            returnString= array.toString();
        }catch (Exception e){
            returnString="fail";
        }finally {
            array=null;
            vehicleList=null;
            mapList=null;
            return returnString;
        }
    }
    @RequestMapping(value = "getHistoryTrack",method = RequestMethod.GET)
    @ResponseBody
    public String getHistoryTrack(@RequestParam(value = "param")String param,@RequestParam(value = "fromDate")String fromDate,@RequestParam(value = "toDate")String toDate) throws ParseException {
        try {
            Vehicle vehicle = vehicleDao.getByvehicleLicense(param);
            if (vehicle == null)
                return "fail";
            Map<String, Object> map = new HashMap<String, Object>();
            if (vehicle.getOBUId() != null && !vehicle.getOBUId().equals("")) {
                List<GpsBackup> devGPSList = devGpsDao.getHistoryTrack(fromDate, toDate, vehicle.getOBUId());
                if (devGPSList == null || devGPSList.size() == 0)
                    return "fail";
                if (devGPSList.size() > 0) {
                    map.put("vehicle", vehicle);
                    map.put("list", devGPSList);
                }
            }
            object=JSONObject.fromObject(map);
            returnString= object.toString();
            return returnString;
        }catch (Exception e){
            returnString="fail";
            return returnString;
        }finally {
            object=null;
            vehicleList=null;
            mapList=null;
        }
    }
    private SimpleDateFormat format1=new SimpleDateFormat("yyyy-MM-dd");
    @RequestMapping(value = "getLatestPos",method = RequestMethod.GET)
    @ResponseBody
    public String getLatestPos(@RequestParam(value = "DevIDNO")String DevIDNO){
        GpsBackup devGPS=null;
        try {
            devGPS=devGpsDao.getLatestPos(DevIDNO);
        }catch (Exception e){
            return "fail";
        }
        Vehicle vehicle=baseDao.find("from Vehicle where OBUId=? and isDelete=0",Vehicle.class,new Object[]{DevIDNO});
        if(vehicle.getVehicleType().equals("清扫车")&&devGPS.getLineID()==null)
            return "fail";
        object=JSONObject.fromObject(devGPS);
        returnString= object.toString();
        object=null;
        return returnString;
    }
    @RequestMapping(value = "getLatest",method = RequestMethod.GET)
    @ResponseBody
    public String getLatest(String postString){
        String []devIDNOS=postString.split(",");
        List<LatestData>latestDataList=new ArrayList<LatestData>();
        for(String DevIDNO:devIDNOS) {
            GpsBackup devGPS;
            Map<String, String> map = new HashMap<String, String>();
            LatestData latestData=new LatestData();
            latestData.setDevIDNO(DevIDNO);
            try {
                devGPS = devGpsDao.getLatestPos(DevIDNO);
                if(devGPS==null)
                    continue;
                latestData.setPos(devGPS);
                String online = "";
                String filePath = "C://GpsData/" + DevIDNO + "_state.txt";
                try {
                    String content = FileUtil.readTxtFile(filePath);
                    if (content != null && !content.equals(""))
                        online = content;
                } catch (Exception e) {
                    online = "Offline";
                }
                if(online.equals(""))
                    online="online";
                map.put("online", online);
                latestData.setOnline(online);
                latestDataList.add(latestData);
            } catch (Exception e) {
                return "fail";
            } finally {
                array=null;
            }
        }
        returnString=JSONArray.fromObject(latestDataList).toString();
        return returnString;
    }
    private static String key = "avs3S28Dq5BjX7fCWUYjP3HA";
    public JSONObject getBaiDuPoint(Double lng,Double lat){
        try {
            String url = "http://api.map.baidu.com/geoconv/v1/?coords=" + lng + ","
                    + lat + "&output=json&ak=" + key;
            object = JSONObject.fromObject(HttpUtil.getRequest(url));
            array = JSONArray.fromObject(object.get("result"));
            return JSONObject.fromObject(array.get(0));
        }catch (Exception e){
            return null;
        }finally {
            object=null;
            array=null;
        }
    }
    @RequestMapping(value = "getLatestRFID",method = RequestMethod.GET)
    @ResponseBody
    public String getLatestRFID(HttpSession session,String devIDNO) {
        String company = (String) session.getAttribute("company");
        if (company == null)
            company = "养护中心";
        vehicleList = company.equals("养护中心") ? vehicleDao.getList() : baseDao.findAll("from Vehicle where company='" + company + "'", Vehicle.class);
        try {
            List<RFID> returnList = vehiclePosDao.getRFIDByCurrentTrackDevNo(devIDNO);
            if(returnList!=null)
                returnString=JSONArray.fromObject(returnList).toString();
            else
                returnString="fail";
            return returnString;
        }catch (Exception e){
            returnString="fail";
            System.out.print(e.getMessage());
            return returnString;
        }finally {
            array=null;
            returnString=null;
        }
    }
}
