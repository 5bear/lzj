package com.springapp.mvc;

import com.springapp.entity.Vehicle;
import com.springapp.entity.VehiclePos;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
            if (vehicle.getOBUId()!=null&&!vehicle.getOBUId().equals("")){
                List<VehiclePos>vehiclePosList=vehiclePosDao.getByCurrentTrackDevNo(vehicle.getOBUId());
                if(vehiclePosList!=null&&vehiclePosList.size()>0) {
                    map.put("vehicle", vehicle);
                    map.put("list", vehiclePosList);
                    mapList.add(map);
                }
            }
        }
        return JSONArray.fromObject(mapList).toString();
    }
    @RequestMapping(value = "getLatestPos",method = RequestMethod.POST)
    @ResponseBody
    public String getLatestPos(@RequestParam(value = "DevIDNO")String DevIDNO){
      VehiclePos vehiclePos=vehiclePosDao.getLatestPos(DevIDNO);
        return JSONObject.fromObject(vehiclePos).toString();
    }
}
