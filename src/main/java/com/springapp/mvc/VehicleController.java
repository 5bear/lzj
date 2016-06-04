package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/13.
 */

import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;


@Controller
@RequestMapping(value = "**")
public class VehicleController extends BaseController {
    /*@RequestMapping(value = "/index",method =RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Vehicle");
        return modelAndView;
    }*/

    @RequestMapping(value = "/Vehicle", method = RequestMethod.GET)
    public ModelAndView home(@RequestParam(required = false) String name,@RequestParam(required = false) String type) {
        if (name == null) {
            name = "";
        }
        if (type == null) {
            type = "0";
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("VehicleIndex");
        modelAndView.addObject("VehicleList", vehicleDao.getPager(type,name));//获取表中所有的数据
        modelAndView.addObject("name", name);
        modelAndView.addObject("type", type);
        return modelAndView;

    }

    @RequestMapping(value = "/VehicleAdd0")
    @ResponseBody
    public ModelAndView add0() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("VehicleAdd");
        modelAndView.addObject("eFenceList", eFenceDao.getList());
        return modelAndView;
    }


    @RequestMapping(value = "/VehicleAdd1", method=RequestMethod.POST)
    @ResponseBody
    public String add1(@RequestParam(value = "company") String company,
                       @RequestParam(value = "vehicleType") String vehicleType,
                       @RequestParam(value = "vehicleLicence") String vehicleLicence,
                       @RequestParam(value = "vehicleModel") String vehicleModel,
                       @RequestParam(value = "OBUId") String OBUId,
                       @RequestParam(value = "eFence") String ef,
                       @RequestParam(value = "eFenceId") String eFenceId,
                       @RequestParam(value = "remark") String remark/*,
                      @RequestParam(value="isDelete") String isDelete*/) {

        if ("".equals(vehicleLicence.trim()))
            return "null";

        Vehicle vehicle = vehicleDao.getByName(vehicleLicence);
        if (vehicle!=null) {
            return "false";
        }

        vehicle = new Vehicle();
        vehicle.setCompany(company);
        vehicle.setVehicleType(vehicleType);
        vehicle.setVehicleLicence(vehicleLicence);
        vehicle.setVehicleModel(vehicleModel);
        if (eFenceId!=null && !"".equals(eFenceId.trim())){
            vehicle.seteFenceId(Long.parseLong(eFenceId));
        }

        vehicle.seteFence(ef);
        vehicle.setOBUId(OBUId);
        vehicle.setRemark(remark);
        vehicle.setIsDelete(0);
        vehicle.setCreateTime(simpleDateFormat.format(new Date()));

        vehicleDao.add(vehicle);
        return "success";
    }

    @RequestMapping(value = "/VehicleEdit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") String id) {
        Vehicle vehicle = vehicleDao.getById(Long.parseLong(id));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("VehicleEdit");
        modelAndView.addObject("Vehicle_edit", vehicle);
        modelAndView.addObject("eFenceList", eFenceDao.getList());
        return modelAndView;
    }

    @RequestMapping(value = "/VehicleEdit1", method = RequestMethod.POST)
    @ResponseBody
    public String edit1(@RequestParam(value = "id") String id,
                        @RequestParam(value = "company") String company,
                        @RequestParam(value = "vehicleType") String vehicleType,
                        @RequestParam(value = "vehicleLicence") String vehicleLicence,
                        @RequestParam(value = "vehicleModel") String vehicleModel,
                        @RequestParam(value = "eFenceId") String eFenceId,
                        @RequestParam(value = "eFence") String ef,
                        @RequestParam(value = "OBUId") String OBUId,
                        @RequestParam(value = "remark") String remark) {
        /*List<Vehicle> vehicleList=vehicleDao.getList();
        for(int i=0;i<vehicleList.size();i++)
        {

            Vehicle vehicle=vehicleList.get(i);
            if(vehicleLicence.equals(vehicle.getVehicleLicence())) {
                return "false";
            }
        }*/
        if ("".equals(vehicleLicence.trim()))
            return "null";

        Vehicle vehicle = vehicleDao.getById(Long.parseLong(id));

        Vehicle nvehicle = vehicleDao.getByVehicleLicence(vehicleLicence);
        if (nvehicle!=null && !nvehicle.getId().equals(vehicle.getId())){
            return "false";
        }


        vehicle.setCompany(company);
        vehicle.setVehicleType(vehicleType);
        vehicle.setVehicleLicence(vehicleLicence);
        vehicle.setVehicleModel(vehicleModel);
        if (eFenceId!=null && !"".equals(eFenceId.trim())){
            vehicle.seteFenceId(Long.parseLong(eFenceId));
        }

        vehicle.seteFence(ef);
        vehicle.setOBUId(OBUId);
        vehicle.setRemark(remark);
        vehicle.setEditTime(simpleDateFormat.format(new Date()));
        vehicleDao.update(vehicle);
        return "success";
    }


    @RequestMapping(value = "/VehicleDelete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id") String id) {
        Vehicle vehicle = vehicleDao.getById(Long.parseLong(id));
        vehicle.setIsDelete(1);
        vehicle.setDeleteTime(simpleDateFormat.format(new Date()));

        vehicleDao.update(vehicle);
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
