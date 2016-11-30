package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/19.
 */

import com.springapp.entity.MaintainLog;
import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;


@Controller
@RequestMapping(value = "**")
public class MaintainLogController extends BaseController {

    @RequestMapping(value="/MaintainLog/list", method=RequestMethod.GET)
    public ModelAndView list(HttpSession session,@RequestParam(required = false) String vehicleLicense,@RequestParam(required = false) String startDate,@RequestParam(required = false) String endDate)
    {
        if(vehicleLicense==null){
            vehicleLicense = "";
        }
        if (startDate==null){
            startDate = "";
        }
        if (endDate==null){
            endDate = "";
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("MaintainLogIndex");
        modelAndView.addObject("MaintainLogList", maintainLogDao.getPager(vehicleLicense,startDate,endDate));//获取表中所有的数据

        String company = String.valueOf(session.getAttribute("company"));
        if ("养护中心".equals(company)){
            modelAndView.addObject("CyList",vehicleDao.getCyList());
            modelAndView.addObject("CqList",vehicleDao.getCqList());
            modelAndView.addObject("CxList",vehicleDao.getCxList());
            modelAndView.addObject("GyList",vehicleDao.getGyList());
            modelAndView.addObject("GqList",vehicleDao.getGqList());
            modelAndView.addObject("GxList",vehicleDao.getGxList());
        }else if("上海成基市政建设发展有限公司".equals(company)){
            modelAndView.addObject("CyList",vehicleDao.getCyList());
            modelAndView.addObject("CqList",vehicleDao.getCqList());
            modelAndView.addObject("CxList",vehicleDao.getCxList());
        }else if("上海高架养护管理有限公司".equals(company)){
            modelAndView.addObject("GyList",vehicleDao.getGyList());
            modelAndView.addObject("GqList",vehicleDao.getGqList());
            modelAndView.addObject("GxList",vehicleDao.getGxList());

        }


        if (!"".equals(vehicleLicense.trim())){
            Vehicle v = vehicleDao.getByvehicleLicense(vehicleLicense);
            if(v!=null){
                modelAndView.addObject("type",v.getVehicleType());
                modelAndView.addObject("company",v.getCompany());
            }

        }else {
            modelAndView.addObject("type","");
            modelAndView.addObject("company","");
        }

        modelAndView.addObject("vehicleLicense",vehicleLicense);
        modelAndView.addObject("startDate",startDate);
        modelAndView.addObject("endDate",endDate);
        return modelAndView;


    }

    @RequestMapping(value = "/MaintainLog/add", method=RequestMethod.GET)
    public ModelAndView add0(HttpSession session)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("MaintainLogAdd");
        String company = (String)session.getAttribute("company");
        modelAndView.addObject("VehicleList",vehicleDao.getList(company,""));
        modelAndView.addObject("LineList",lineDao.getList(company));
        modelAndView.addObject("company",company);
        return modelAndView;
    }



    @RequestMapping(value = "/MaintainLog/add",method =RequestMethod.POST)
    @ResponseBody
    public String add1(@RequestParam(value = "vehicleLicense") String vehicleLicense,
                       @RequestParam(value = "principal") String principal,
                       @RequestParam(value = "road") String road,
                       @RequestParam(value = "eventType") String eventType,
                       @RequestParam(value = "_date") String _date,
                       @RequestParam(value = "remark") String remark,
                       @RequestParam(value = "time") String time)
    {

        MaintainLog mtl = maintainLogDao.getByVDT(vehicleLicense,_date,time);
        if (mtl!=null){
            return "false";
        }else {
            mtl = new MaintainLog();
            Vehicle vehicle = vehicleDao.getByvehicleLicense(vehicleLicense);
            String company = vehicle.getCompany();
            mtl.setvehicleLicense(vehicleLicense);
            mtl.setPrincipal(principal);
            mtl.setRoad(road);
            mtl.setEventType(eventType);
            mtl.setDayTime(_date);
            mtl.setRemark(remark);
            mtl.setTime(time);
            mtl.setCompany(company);
            System.out.println(company);
            mtl.setIsDelete(0);
            mtl.setCreateTime(simpleDateFormat.format(new Date()));
            maintainLogDao.add(mtl);
            return "success";
        }
    }

    @RequestMapping(value = "/MaintainLog/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") String id,HttpSession session)
    {
        MaintainLog mtl = maintainLogDao.getById(Long.parseLong(id));
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("MaintainLogEdit");
        modelAndView.addObject("MaintainLog_edit", mtl);
        String company = (String)session.getAttribute("company");
        Vehicle v = vehicleDao.getByvehicleLicense(mtl.getvehicleLicense());
        String type="";
        if(v!=null){
            type = v.getVehicleType();
        }
        modelAndView.addObject("VehicleList",vehicleDao.getList(company,type));
        modelAndView.addObject("LineList",lineDao.getList(company));
        modelAndView.addObject("company",company);
        modelAndView.addObject("type",type);
        return modelAndView;
    }

    @RequestMapping(value = "/MaintainLog/edit", method = RequestMethod.POST)
    @ResponseBody
    public String edit1(@RequestParam(value = "id") String id,
                        @RequestParam(value = "vehicleLicense") String vehicleLicense,
                        @RequestParam(value = "principal") String principal,
                        @RequestParam(value = "road") String road,
                        @RequestParam(value = "eventType") String eventType,
                        @RequestParam(value = "dayTime") String dayTime,
                        @RequestParam(value = "time") String time,
                        @RequestParam(value = "remark") String remark)
    {
        MaintainLog m = maintainLogDao.getByVDT(vehicleLicense, dayTime, time);
       /* if (m!=null&&principal != null && road != null && eventType != null && remark != null && m.getPrincipal().equals(principal.trim()) && m.getRoad().equals(road.trim()) && m.getEventType().equals(eventType.trim()) && m.getRemark().equals(remark.trim())){
                return "false";
        }*/
        if(m!=null && m.getId()!=Long.parseLong(id)){
            return "false";
        } else {
            MaintainLog mtl = maintainLogDao.getById(Long.parseLong(id));
            Vehicle vehicle = vehicleDao.getByvehicleLicense(vehicleLicense);
            String company = vehicle.getCompany();
            mtl.setvehicleLicense(vehicleLicense);
            mtl.setPrincipal(principal);
            mtl.setRoad(road);
            mtl.setEventType(eventType);
            mtl.setDayTime(dayTime);
            mtl.setTime(time);
            mtl.setRemark(remark);
            mtl.setCompany(company);
            mtl.setEditTime(simpleDateFormat.format(new Date()));
            maintainLogDao.update(mtl);
            return "success";
        }
    }

    @RequestMapping(value = "/MaintainLog/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")String id){
        MaintainLog mtl=maintainLogDao.getById(Long.parseLong(id));
        mtl.setIsDelete(1);
        mtl.setDeleteTime(simpleDateFormat.format(new Date()));
        maintainLogDao.update(mtl);
        return "success";
    }


    /*@RequestMapping(value="/MaintainLogSearchByTime",method = RequestMethod.GET)
    public ModelAndView searchByTime(@RequestParam(value = "date1") String date1,
                               @RequestParam(value = "date2") String date2)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("MaintainLogList");
        List<MaintainLog> maintainLogList=maintainLogDao.findAll("from MaintainLog where isDelete='0' and (dayTime between '"+date1+"' and '"+date2+" ' )",MaintainLog.class);
        modelAndView.addObject("MaintainLogList", maintainLogList);
        modelAndView.addObject("CyList",vehicleDao.getCyList());
        modelAndView.addObject("CqList",vehicleDao.getCqList());
        modelAndView.addObject("CxList",vehicleDao.getCxList());
        modelAndView.addObject("GyList",vehicleDao.getGyList());
        modelAndView.addObject("GqList",vehicleDao.getGqList());
        modelAndView.addObject("GxList",vehicleDao.getGxList());
        modelAndView.addObject("date1",date1);
        modelAndView.addObject("date2",date2);
        return modelAndView;
    }*/

  /*  @RequestMapping(value="/MaintainLogSearch",method = RequestMethod.GET)
    public ModelAndView search(@RequestParam(value = "search") String search)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("MaintainLogList");
        List<MaintainLog> maintainLogList=maintainLogDao.findAll("from MaintainLog where isDelete='0' and vehicleLicense='"+search+"'",MaintainLog.class);
        modelAndView.addObject("MaintainLogList", maintainLogList);
        modelAndView.addObject("CyList",vehicleDao.getCyList());
        modelAndView.addObject("CqList",vehicleDao.getCqList());
        modelAndView.addObject("CxList",vehicleDao.getCxList());
        modelAndView.addObject("GyList",vehicleDao.getGyList());
        modelAndView.addObject("GqList",vehicleDao.getGqList());
        modelAndView.addObject("GxList",vehicleDao.getGxList());
        modelAndView.addObject("date1","");
        modelAndView.addObject("date2","");
        return modelAndView;
    }*/


    @RequestMapping(value="/MaintainLog/get",method = RequestMethod.GET)
    public ModelAndView get(@RequestParam(value = "id") String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        MaintainLog mtl=maintainLogDao.getById(Long.parseLong(id));
        modelAndView.setViewName("MaintainLogDetail");
        modelAndView.addObject("MaintainLog_detail", mtl);
        return modelAndView;
    }


}

