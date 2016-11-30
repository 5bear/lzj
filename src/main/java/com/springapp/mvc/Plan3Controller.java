package com.springapp.mvc;

import com.springapp.classes.BaiDuUtil;
import com.springapp.entity.Position;
import com.springapp.entity.Vehicle;
import javafx.geometry.Pos;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/5.
 * 布点计划
 */
@Controller
@RequestMapping(value = "/plan3")
public class Plan3Controller extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(HttpSession session){
        ModelAndView modelAndView=new ModelAndView("plan3");
        String company= (String) session.getAttribute("company");
        if(company.equals("养护中心")){
            List<Vehicle>vehicleList=vehicleDao.getList("养护中心","牵引车");
            modelAndView.addObject("list",vehicleList);
        }else{
            List<Vehicle>vehicleList=vehicleDao.getList(company,"牵引车");
            modelAndView.addObject("list",vehicleList);
        }

        return modelAndView;
    }

    @RequestMapping(value = "get",method = RequestMethod.GET)
    @ResponseBody
    public String get(@RequestParam(value = "coords")String coords){
        List<Position>positionList=positionDao.getByCoords(coords);
        return JSONArray.fromObject(positionList).toString();
    }
    @RequestMapping(value = "list",method = RequestMethod.GET)
    @ResponseBody
    public String list(HttpSession session){
        String company= (String) session.getAttribute("company");
        List<Position> positionList = null;
        if(company.equals("养护中心")) {
           positionList= positionDao.getList();
        }else{
            positionList=positionDao.findAll("from Position where company='"+company+"'", Position.class);
        }
        return JSONArray.fromObject(positionList).toString();
    }
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public String add(Position position){
        Vehicle vehicle=vehicleDao.getByvehicleLicense(position.getVehicle());
        if(vehicle==null)
            return "fail";
        if(!vehicle.getVehicleType().equals("牵引车"))
            return "success";
        List<Position>positionList=positionDao.getListAll();
        for(Position position1:positionList){
            if(position.getVehicle().equals(position1.getVehicle()))
                if(position.getBeginTime().compareTo(position1.getBeginTime())<=0&&position.getStopTime().compareTo(position1.getStopTime())<=0&&position.getStopTime().compareTo(position1.getBeginTime())>=0||position.getBeginTime().compareTo(position1.getBeginTime())>=0&&position.getStopTime().compareTo(position1.getStopTime())<=0||position.getBeginTime().compareTo(position1.getBeginTime())<=0&&position.getStopTime().compareTo(position1.getStopTime())>=0)
                    return "duplicated";
        }
        String coords="{\"lng\":"+"\""+position.getLng()+"\""+",\"lat\":"+"\""+position.getLat()+"\""+"}";
        String street= BaiDuUtil.getPosition(position.getLat(),position.getLng());
        position.setRoad(street);
        position.setCompany(vehicle.getCompany());
        position.setCoords(coords);
        position.setVehicleId(vehicle.getId());
        positionDao.save(position);
        return JSONObject.fromObject(position).toString();
    }

    @RequestMapping(value = "delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(String coords){
        List<Position> positionList=positionDao.findAll("from Position where coords=?", Position.class,new Object[]{coords});
       for(Position position:positionList){
           positionDao.delete(position);
       }
        return "success";
    }
    @RequestMapping(value = "deleteByID",method = RequestMethod.POST)
    @ResponseBody
    public String delete(Long id){
       Position position=positionDao.get(Position.class,id);
        positionDao.delete(position);
        return "success";
    }
    @RequestMapping(value = "getListByVehicle",method = RequestMethod.GET)
    @ResponseBody
    public String getListByVehicle(Long vehicle){
        List<Position>positionList=positionDao.getListByVehicle(vehicle);
        return JSONArray.fromObject(positionList).toString();
    }
}

