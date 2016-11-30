package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/13.
 */

import com.springapp.classes.FileUtil;
import com.springapp.classes.JsonUtil;
import com.springapp.classes.model.AjaxObj;
import com.springapp.entity.Line;
import com.springapp.entity.Vehicle;
import com.springapp.entity.eFence;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping(value = "**")
public class VehicleController extends BaseController {
    /*@RequestMapping(value = "/index",method =RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Vehicle");
        return modelAndView;
    }*/

    @RequestMapping(value = "/getEFence",method = RequestMethod.POST)
    @ResponseBody
    public String getLine(@RequestParam(value = "company") String company) {

        AjaxObj ao = new AjaxObj();
        List<eFence> vs = eFenceDao.getListByCompany(company);
        ao.setResult(0);
        ao.setObj(vs);

        return JsonUtil.getInstance().obj2json(ao);
    }

    @RequestMapping(value = "/getVehicleByType")
    @ResponseBody
    public String getVehicleByType(@RequestParam(value = "company") String company, @RequestParam(required = false) String type) {
        if (type == null) {
            type = "";
        }

        AjaxObj ao = new AjaxObj();
        List<Vehicle> vs = vehicleDao.getList(company, type);
        ao.setResult(0);
        ao.setObj(vs);

        return JsonUtil.getInstance().obj2json(ao);
    }

    @RequestMapping(value = "/Vehicle/list", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session,@RequestParam(required = false) String name, @RequestParam(required = false) String type) {
        if (name == null) {
            name = "";
        }
        if (type == null) {
            type = "0";
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("VehicleIndex");
        String company = String.valueOf(session.getAttribute("company"));
        modelAndView.addObject("VehicleList", vehicleDao.getPager(type, name,company));//获取表中所有的数据
        modelAndView.addObject("name", name);
        modelAndView.addObject("type", type);
        return modelAndView;

    }

    @RequestMapping(value = "/Vehicle/add", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView add0(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("VehicleAdd");
        String company = String.valueOf(session.getAttribute("company"));
        if("养护中心".equals(company)){
            company = "上海成基市政建设发展有限公司";
        }
        modelAndView.addObject("eFenceList", eFenceDao.getListByCompany(company));
        return modelAndView;
    }


    @RequestMapping(value = "/Vehicle/add", method = RequestMethod.POST)
    @ResponseBody
    public String add1(@RequestParam(value = "company") String company,
                       @RequestParam(value = "vehicleType") String vehicleType,
                       @RequestParam(value = "vehicleLicense") String vehicleLicense,
                       @RequestParam(value = "vehicleModel") String vehicleModel,
                       @RequestParam(value = "OBUId") String OBUId,
                       @RequestParam(value = "eFence") String ef,
                       @RequestParam(value = "eFenceId") String eFenceId,
                       @RequestParam(value = "remark") String remark/*,
                      @RequestParam(value="isDelete") String isDelete*/) {

        if ("".equals(vehicleLicense.trim()))
            return "null";

        Vehicle vehicle = vehicleDao.getByName(vehicleLicense);
        if (vehicle != null) {
            return "false";
        }

        vehicle = new Vehicle();
        vehicle.setCompany(company);
        vehicle.setVehicleType(vehicleType);
        vehicle.setvehicleLicense(vehicleLicense);
        vehicle.setVehicleModel(vehicleModel);
        if (eFenceId == null || "".equals(eFenceId.trim())) {
            vehicle.seteFenceId(0L);
        }else{
            vehicle.seteFenceId(Long.parseLong(eFenceId));
        }

        vehicle.seteFence(ef);
        vehicle.setOBUId(OBUId);
        vehicle.setRemark(remark);
        vehicle.setIsDelete(0);
        vehicle.setCreateTime(simpleDateFormat.format(new Date()));

        vehicleDao.add(vehicle);
        List<Vehicle>vehicleList=vehicleDao.getList();
        /*
		导出车载设备
		* */
		FileUtil.OutToTxt(vehicleList);
        return "success";
    }

    @RequestMapping(value = "/Vehicle/edit", method = RequestMethod.GET)
    public ModelAndView edit(HttpSession session,@RequestParam(value = "id") String id) {
        Vehicle vehicle = vehicleDao.getById(Long.parseLong(id));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("VehicleEdit");
        modelAndView.addObject("Vehicle_edit", vehicle);
        String company = String.valueOf(session.getAttribute("company"));
        if("养护中心".equals(company)){
            company =vehicle.getCompany();
        }
        modelAndView.addObject("eFenceList", eFenceDao.getListByCompany(company));
        return modelAndView;
    }

    @RequestMapping(value = "/Vehicle/edit", method = RequestMethod.POST)
    @ResponseBody
    public String edit1(@RequestParam(value = "id") String id,
                        @RequestParam(value = "company") String company,
                        @RequestParam(value = "vehicleType") String vehicleType,
                        @RequestParam(value = "vehicleLicense") String vehicleLicense,
                        @RequestParam(value = "vehicleModel") String vehicleModel,
                        @RequestParam(value = "eFenceId") String eFenceId,
                        @RequestParam(value = "eFence") String ef,
                        @RequestParam(value = "OBUId") String OBUId,
                        @RequestParam(value = "remark") String remark) {
        /*List<Vehicle> vehicleList=vehicleDao.getList();
        for(int i=0;i<vehicleList.size();i++)
        {

            Vehicle vehicle=vehicleList.get(i);
            if(vehicleLicense.equals(vehicle.getvehicleLicense())) {
                return "false";
            }
        }*/
        if ("".equals(vehicleLicense.trim()))
            return "null";

        Vehicle vehicle = vehicleDao.getById(Long.parseLong(id));

        Vehicle nvehicle = vehicleDao.getByvehicleLicense(vehicleLicense);
        if (nvehicle != null && !nvehicle.getId().equals(vehicle.getId())) {
            return "false";
        }


        vehicle.setCompany(company);
        vehicle.setVehicleType(vehicleType);
        vehicle.setvehicleLicense(vehicleLicense);
        vehicle.setVehicleModel(vehicleModel);
        if (eFenceId == null || "".equals(eFenceId.trim())) {
            vehicle.seteFenceId(0L);
        }else{
            vehicle.seteFenceId(Long.parseLong(eFenceId));
        }

        vehicle.seteFence(ef);
        vehicle.setOBUId(OBUId);
        vehicle.setRemark(remark);
        vehicle.setEditTime(simpleDateFormat.format(new Date()));
        vehicleDao.update(vehicle);
        List<Vehicle>vehicleList=vehicleDao.getList();
        /*
		导出车载设备
		* */
        FileUtil.OutToTxt(vehicleList);
        return "success";
    }


    @RequestMapping(value = "/Vehicle/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id") String id) {
        Vehicle vehicle = vehicleDao.getById(Long.parseLong(id));
        vehicle.setIsDelete(1);
        vehicle.setDeleteTime(simpleDateFormat.format(new Date()));

        vehicleDao.update(vehicle);
        List<Vehicle>vehicleList=vehicleDao.getList();
        //删除布点计划
        vehicleDao.deletePosition(Long.parseLong(id));
        /*
		导出车载设备
		* */
        FileUtil.OutToTxt(vehicleList);
        return "success";
    }

   /* //利用所属公司或者车辆类型进行关键字查询
    @RequestMapping(value = "/VehicleSearch", method = RequestMethod.GET)
    public ModelAndView search(@RequestParam(value = "search") String search) {
        //byte bb[];
        //bb = search.getBytes("ISO-8859-1"); //以"ISO-8859-1"方式解析name字符串
        //search= new String(bb, "UTF-8"); //再用"utf-8"格式表示name
        //search = new String (search.getBytes(Charset.forName("GBK")), "GBK");
        try {
            search = new String(search.getBytes(Charset.forName("utf-8")), "utf-8");
        } catch (MyException e) {
        }


        //search = new String (search.getBytes(Charset.forName("utf-8")), "utf-8");

        System.out.println(search);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("VehicleIndex");
        List<Vehicle> vehicleList = vehicleDao.findAll("from Vehicle where isDelete='0' and ((company like '%" + search + "%') or (vehicleType like '%" + search + "%'))", Vehicle.class);
        //List<Vehicle> vehicleList=vehicleDao.findAll("from Vehicle where isDelete='0'",Vehicle.class);
        modelAndView.addObject("VehicleList", vehicleList);
        modelAndView.addObject("search", search);
        return modelAndView;
    }
*/
}
