package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/19.
 */
import com.springapp.dao.MaintainLogDao;
import com.springapp.entity.MaintainLog;
import com.springapp.dao.VehicleDao;
import com.springapp.entity.Package;
import com.springapp.entity.Vehicle;
import com.springapp.entity.Line;
import com.springapp.dao.LineDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping(value = "**")
public class MaintainLogController extends BaseController {

    @RequestMapping(value="/MaintainLog", method=RequestMethod.GET)
    public ModelAndView list()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("MaintainLogIndex");
        modelAndView.addObject("MaintainLogList", maintainLogDao.getList());//获取表中所有的数据

        modelAndView.addObject("CyList",vehicleDao.getCyList());
        modelAndView.addObject("CqList",vehicleDao.getCqList());
        modelAndView.addObject("CxList",vehicleDao.getCxList());
        modelAndView.addObject("GyList",vehicleDao.getGyList());
        modelAndView.addObject("GqList",vehicleDao.getGqList());
        modelAndView.addObject("GxList",vehicleDao.getGxList());

        modelAndView.addObject("date1","");
        modelAndView.addObject("date2","");
        return modelAndView;


    }

    @RequestMapping(value = "/MaintainLogAdd0")
    public ModelAndView add0()
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("MaintainLogAdd");
        modelAndView.addObject("VehicleList",vehicleDao.getList());
        modelAndView.addObject("LineList",lineDao.getList());
        return modelAndView;
    }



    @RequestMapping(value = "/MaintainLogAdd1",method =RequestMethod.POST)
    @ResponseBody
    public String add1(@RequestParam(value = "vehicleLicence") String vehicleLicence,
                       @RequestParam(value = "principal") String principal,
                       @RequestParam(value = "road") String road,
                       @RequestParam(value = "eventType") String eventType,
                       @RequestParam(value = "_date") String _date,
                       @RequestParam(value = "remark") String remark,
                       @RequestParam(value = "time") String time)
    {
        System.out.println(vehicleLicence+"+"+principal);
        MaintainLog mtl = new MaintainLog();
        Vehicle vehicle=vehicleDao.getByVehicleLicence(vehicleLicence);
        String company=vehicle.getCompany();
        mtl.setVehicleLicence(vehicleLicence);
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
        maintainLogDao.save(mtl);
        return "success";
    }

    @RequestMapping(value = "/MaintainLogEdit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") String id)
    {
        MaintainLog mtl = maintainLogDao.getById(Long.parseLong(id));
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("MaintainLogEdit");
        modelAndView.addObject("MaintainLog_edit", mtl);
        modelAndView.addObject("VehicleList",vehicleDao.getList());
        modelAndView.addObject("LineList",lineDao.getList());
        return modelAndView;
    }

    @RequestMapping(value = "/MaintainLogEdit1", method = RequestMethod.POST)
    @ResponseBody
    public String edit1(@RequestParam(value = "id") String id,
                        @RequestParam(value = "vehicleLicence") String vehicleLicence,
                        @RequestParam(value = "principal") String principal,
                        @RequestParam(value = "road") String road,
                        @RequestParam(value = "eventType") String eventType,
                        @RequestParam(value = "dayTime") String dayTime,
                        @RequestParam(value = "time") String time,
                        @RequestParam(value = "remark") String remark)
    {
        MaintainLog mtl=maintainLogDao.getById(Long.parseLong(id));
        Vehicle vehicle=vehicleDao.getByVehicleLicence(vehicleLicence);
        String company=vehicle.getCompany();
        mtl.setVehicleLicence(vehicleLicence);
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

    @RequestMapping(value = "/MaintainLogDelete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")String id){
        MaintainLog mtl=maintainLogDao.getById(Long.parseLong(id));
        mtl.setIsDelete(1);
        mtl.setDeleteTime(simpleDateFormat.format(new Date()));
        maintainLogDao.update(mtl);
        return "success";
    }


    @RequestMapping(value="/MaintainLogSearchByTime",method = RequestMethod.GET)
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
    }

    @RequestMapping(value="/MaintainLogSearch",method = RequestMethod.GET)
    public ModelAndView search(@RequestParam(value = "search") String search)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("MaintainLogList");
        List<MaintainLog> maintainLogList=maintainLogDao.findAll("from MaintainLog where isDelete='0' and vehicleLicence='"+search+"'",MaintainLog.class);
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
    }


    @RequestMapping(value="/MaintainLogDetail",method = RequestMethod.GET)
    public ModelAndView get(@RequestParam(value = "id") String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        MaintainLog mtl=maintainLogDao.getById(Long.parseLong(id));
        modelAndView.setViewName("MaintainLogDetail");
        modelAndView.addObject("MaintainLog_detail", mtl);
        return modelAndView;
    }


}

