package com.springapp.mvc;

import com.springapp.entity.Vehicle;
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
import java.util.ArrayList;
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
    public ModelAndView home(ModelAndView modelAndView,HttpSession session){
        modelAndView.setViewName("base5");
        String company= (String) session.getAttribute("company");
        if(company.equals("养护中心")) {
            List<eFence> cjList = eFenceDao.getListByCompany("上海成基市政建设发展有限公司");
            modelAndView.addObject("cjList", cjList);
            List<eFence> gjyhList = eFenceDao.getListByCompany("上海高架养护管理有限公司");
            modelAndView.addObject("gjyhList", gjyhList);
        }else if (company.equals("上海成基市政建设发展有限公司")){
            List<eFence> cjList = eFenceDao.getListByCompany("上海成基市政建设发展有限公司");
            modelAndView.addObject("cjList", cjList);
        }else{
            List<eFence> gjyhList = eFenceDao.getListByCompany("上海高架养护管理有限公司");
            modelAndView.addObject("gjyhList", gjyhList);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(HttpServletRequest request,@RequestParam(value = "coords")String coords,@RequestParam(value = "lng")Double lng,@RequestParam(value = "lat")Double lat,@RequestParam(value = "eFenceName")String eFenceName,@RequestParam(value = "company")String company/*, @RequestParam(value = "inputMan")String inputMan*//*,
                     @RequestParam(value = "inputId")Long inputId,@RequestParam(value = "vehicles")String vehicles,@RequestParam(value = "vehicleIds")String vehicleIds*/){

        if(eFenceDao.isDuplicated(null,eFenceName))
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
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        eFence eFence= eFenceDao.getById(Long.parseLong(id));
        if(!eFence.getCompany().equals(company)){
            List<Vehicle>vehicles=vehicleDao.getByeFence(Long.parseLong(id));
            if(vehicles!=null&&vehicles.size()>0)
                return "fail";
        }
          if(eFenceDao.isDuplicated(eFence,eFenceName))
            return "duplicated";
        eFence.setCoords(coords);
        eFence.setLng(lng);
        eFence.setLat(lat);
        String oldName = eFence.geteFence();
        if (!oldName.equals(eFenceName)){ //电子围栏名称改变 需要修改对应车辆的电子围栏名称
            vehicleDao.updateEfence(oldName,eFenceName);
        }
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
        List<Vehicle>vehicleList=vehicleDao.getByeFence(eFence.getId());
        if(vehicleList!=null&&vehicleList.size()>0)
            return "fail";
        eFence.setIsDelete(1);
        eFence.setDeleteTime(simpleDateFormat.format(new Date()));
        eFenceDao.update(eFence);
        return "success";
    }
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public String list(HttpSession session){
        String company= (String) session.getAttribute("company");
        List<eFence> eFenceList;
        if(company.equals("养护中心")){
            eFenceList=eFenceDao.getList();
        }else {
            eFenceList = eFenceDao.getListByCompany(company);
        }
        return JSONArray.fromObject(eFenceList).toString();
    }
    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    public String get(@RequestParam(value = "id")String id){
        eFence eFence= eFenceDao.getById(Long.parseLong(id));
        List<Vehicle>vehicleList=vehicleDao.getByeFence(eFence.getId());
        String vehicles="";
        String vehicleIds="";
        int size=vehicleList.size();
        for(int i=0;i<size;i++){
            if(i==0) {
                vehicleIds+=vehicleList.get(i).getId();
                vehicles+=vehicleList.get(i).getvehicleLicense();
            }else{
                vehicleIds+=","+vehicleList.get(i).getId();
                vehicles+=","+vehicleList.get(i).getvehicleLicense();
            }
        }
        eFence.setVehicleIds(vehicleIds);
        eFence.setVehicles(vehicles);
        eFenceDao.update(eFence);
        return JSONObject.fromObject(eFence).toString();
    }
    @RequestMapping(value = "/getByCoords",method = RequestMethod.GET)
    @ResponseBody
    public String getByCoords(@RequestParam(value = "coords")String coords){
        eFence eFence= eFenceDao.getByCoords(coords);
        List<Vehicle>vehicleList=vehicleDao.getByeFence(eFence.getId());
        String vehicles="";
        String vehicleIds="";
        int size=vehicleList.size();
        for(int i=0;i<size;i++){
            if(i==0) {
                vehicleIds+=vehicleList.get(i).getId();
                vehicles+=vehicleList.get(i).getvehicleLicense();
            }else{
                vehicleIds+=","+vehicleList.get(i).getId();
                vehicles+=","+vehicleList.get(i).getvehicleLicense();
            }
        }
        eFence.setVehicleIds(vehicleIds);
        eFence.setVehicles(vehicles);
        eFenceDao.update(eFence);
        return JSONObject.fromObject(eFence).toString();
    }
    @RequestMapping(value = "/getIdByCoords",method = RequestMethod.GET)
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
