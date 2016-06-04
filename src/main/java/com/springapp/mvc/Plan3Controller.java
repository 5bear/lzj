package com.springapp.mvc;

import com.springapp.entity.Position;
import com.springapp.entity.Vehicle;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/5.
 * 布点计划
 */
@Controller
@RequestMapping(value = "/plan3")
public class Plan3Controller extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView("plan3");
        List<Position>positionList=positionDao.getList();
        modelAndView.addObject("list",positionList);
        List<Vehicle>cyList=vehicleDao.getCyList();
        List<Vehicle>cqList=vehicleDao.getCqList();
        List<Vehicle>cxList=vehicleDao.getCxList();
        List<Vehicle>gyList=vehicleDao.getGyList();
        List<Vehicle>gqList=vehicleDao.getGqList();
        List<Vehicle>gxList=vehicleDao.getGxList();
        modelAndView.addObject("cyList",cyList);
        modelAndView.addObject("cqList",cqList);
        modelAndView.addObject("cxList",cxList);
        modelAndView.addObject("gqList",gqList);
        modelAndView.addObject("gxList",gxList);
        modelAndView.addObject("gyList",gyList);
        return modelAndView;
    }

    @RequestMapping(value = "list",method = RequestMethod.POST)
    @ResponseBody
    public String list(){
        List<Position>positionList=positionDao.getList();
       return JSONArray.fromObject(positionList).toString();
    }
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public String add(Position position){
        Vehicle vehicle=vehicleDao.getByVehicleLicence(position.getVehicle());
        if(vehicle==null)
            return "fail";
        position.setVehicleId(vehicle.getId());
        positionDao.save(position);
        return JSONObject.fromObject(position).toString();
    }

    @RequestMapping(value = "delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(Long id){
        Position position=positionDao.get(Position.class,id);
        positionDao.delete(position);
        return "success";
    }
    @RequestMapping(value = "getListByVehicle",method = RequestMethod.POST)
    @ResponseBody
    public String getListByVehicle(Long vehicle){
        List<Position>positionList=positionDao.getListByVehicle(vehicle);
        return JSONArray.fromObject(positionList).toString();
    }
}

