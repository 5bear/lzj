package com.springapp.mvc;

import com.springapp.entity.eFence;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/8.
 * 电子围栏增删改查
 */
@Controller
@RequestMapping(value = "/eFence")
public class eFenceController extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(ModelAndView modelAndView){
        modelAndView.setViewName("base5");
        List<eFence>cjList=eFenceDao.getListByCompany("上海成基公司");
        List<eFence>gjyhList=eFenceDao.getListByCompany("上海高架养护公司");
        modelAndView.addObject("cjList",cjList);
        modelAndView.addObject("gjyhList",gjyhList);
        return modelAndView;
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(HttpServletRequest request,@RequestParam(value = "coords")String coords,@RequestParam(value = "lng")Double lng,@RequestParam(value = "lat")Double lat,@RequestParam(value = "eFenceName")String eFenceName,@RequestParam(value = "company")String company/*, @RequestParam(value = "inputMan")String inputMan*//*,
                     @RequestParam(value = "inputId")Long inputId,@RequestParam(value = "vehicles")String vehicles,@RequestParam(value = "vehicleIds")String vehicleIds*/){

        if(eFenceDao.isDuplicated(eFenceName))
            return "duplicated";
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        eFence eFence= new eFence();
        eFence.setCoords(coords);
        eFence.setLng(lng);
        eFence.setLat(lat);
        eFence.seteFence(eFenceName);
        eFence.setCompany(company);
        eFence.setInputMan(username);
       /* eFence.setInputMan(inputMan);
        eFence.setInputId(inputId);*/
       /* eFence.setVehicles(vehicles);
        eFence.setVehicleIds(vehicleIds);*/
        eFence.setCreateTime(simpleDateFormat.format(new Date()));
        eFenceDao.save(eFence);
        return "success";
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public String edit(HttpServletRequest request,@RequestParam(value = "id")String id,@RequestParam(value = "coords")String coords,@RequestParam(value = "lng")Double lng,@RequestParam(value = "lat")Double lat,@RequestParam(value = "eFenceName")String eFenceName,@RequestParam(value = "company")String company/*,
                      @RequestParam(value = "inputMan")String inputMan,@RequestParam(value = "inputId")String inputId,@RequestParam(value = "vehicles")String vehicles,@RequestParam(value = "vehicleIds")String vehicleIds*/){
        if(eFenceDao.isDuplicated(eFenceName))
            return "duplicated";
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        eFence eFence= eFenceDao.getById(Long.parseLong(id));
        eFence.setCoords(coords);
        eFence.setLng(lng);
        eFence.setLat(lat);
        eFence.seteFence(eFenceName);
        eFence.setCompany(company);
        eFence.setInputMan(username);
       /* eFence.setInputMan(inputMan);
        eFence.setInputId(Long.parseLong(inputId));
        eFence.setVehicles(vehicles);
        eFence.setVehicleIds(vehicleIds);*/
        eFence.setEditTime(simpleDateFormat.format(new Date()));
        eFenceDao.update(eFence);
        return "success";
    }
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")String id){
        eFence eFence= eFenceDao.getById(Long.parseLong(id));
        eFence.setIsDelete(1);
        eFence.setDeleteTime(simpleDateFormat.format(new Date()));
        eFenceDao.update(eFence);
        return "success";
    }
    @RequestMapping(value = "/deleteByCoords",method = RequestMethod.POST)
    @ResponseBody
    public String deleteByCoords(@RequestParam(value = "coords")String coords){
        eFence eFence= eFenceDao.getByCoords(coords);
        eFence.setIsDelete(1);
        eFence.setDeleteTime(simpleDateFormat.format(new Date()));
        eFenceDao.update(eFence);
        return "success";
    }
    @RequestMapping(value = "/list",method = RequestMethod.POST)
    @ResponseBody
    public String list(){
        List<eFence> eFenceList=eFenceDao.getList();
        return JSONArray.fromObject(eFenceList).toString();
    }
    @RequestMapping(value = "/get",method = RequestMethod.POST)
    @ResponseBody
    public String get(@RequestParam(value = "id")String id){
        eFence eFence= eFenceDao.getById(Long.parseLong(id));
        return JSONObject.fromObject(eFence).toString();
    }
    @RequestMapping(value = "/getByCoords",method = RequestMethod.POST)
    @ResponseBody
    public String getByCoords(@RequestParam(value = "coords")String coords){
        eFence eFence= eFenceDao.getByCoords(coords);
        return JSONObject.fromObject(eFence).toString();
    }
    @RequestMapping(value = "/getIdByCoords",method = RequestMethod.POST)
    @ResponseBody
    public String getIdByCoords(@RequestParam(value = "coords")String coords){
        eFence eFence= eFenceDao.getByCoords(coords);
        try{
            return eFence.getId().toString();
        }catch (Exception e){
            return "error";
        }
    }
}
