package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/13.
 */

import com.springapp.dao.VehicleDao;
import com.springapp.entity.Vehicle;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;



@Controller
@RequestMapping(value = "/Vehicle")
public class VehicleController extends BaseController {
    /*@RequestMapping(value = "/index",method =RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Vehicle");
        return modelAndView;
    }*/

    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView home()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("VehicleIndex");
        modelAndView.addObject("VehicleList", vehicleDao.getList());//获取表中所有的数据
        modelAndView.addObject("search", "");
        return modelAndView;


    }

    @RequestMapping(value = "/add0")
    @ResponseBody
    public ModelAndView add0()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("VehicleAdd");
        modelAndView.addObject("eFenceList", eFenceDao.getList());
        return modelAndView;
    }


    @RequestMapping(value = "/add1")
    @ResponseBody
    public String add1(@RequestParam(value = "company") String company,
                      @RequestParam(value = "vehicleType") String vehicleType,
                      @RequestParam(value = "vehicleLicence") String vehicleLicence,
                      @RequestParam(value = "vehicleModel") String vehicleModel,
                      @RequestParam(value = "eFenceId") String eFenceId,
                      @RequestParam(value = "eFence") String eFence,
                      @RequestParam(value = "remark") String remark,
                      @RequestParam(value="isDelete") String isDelete)
    {

        Vehicle vehicle = new Vehicle();
        vehicle.setCompany(company);
        vehicle.setVehicleType(vehicleType);
        vehicle.setVehicleLicence(vehicleLicence);
        vehicle.setVehicleModel(vehicleModel);
        vehicle.seteFenceId(Long.parseLong(eFenceId));
        vehicle.seteFence(eFence);
        vehicle.setRemark(remark);
        vehicle.setIsDelete(Integer.parseInt(isDelete));
        vehicle.setCreateTime(simpleDateFormat.format(new Date()));


        vehicleDao.save(vehicle);
        return "success";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") String id)
    {
        Vehicle vehicle = vehicleDao.getById(Long.parseLong(id));
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("VehicleEdit");
        modelAndView.addObject("Vehicle_edit", vehicle);
        return modelAndView;
    }

    @RequestMapping(value = "/edit1", method = RequestMethod.POST)
    @ResponseBody
    public String edit1(@RequestParam(value = "id") String id,
                     @RequestParam(value = "company") String company,
                     @RequestParam(value = "vehicleType") String vehicleType,
                     @RequestParam(value = "vehicleLicence") String vehicleLicence,
                     @RequestParam(value = "vehicleModel") String vehicleModel,
                     @RequestParam(value = "eFenceId") String eFenceId,
                     @RequestParam(value = "eFence") String eFence,
                     @RequestParam(value = "remark") String remark)
    {
        Vehicle vehicle = vehicleDao.getById(Long.parseLong(id));
        vehicle.setCompany(company);
        vehicle.setVehicleType(vehicleType);
        vehicle.setVehicleLicence(vehicleLicence);
        vehicle.setVehicleModel(vehicleModel);
        vehicle.seteFenceId(Long.parseLong(eFenceId));
        vehicle.seteFence(eFence);
        vehicle.setRemark(remark);
        vehicle.setEditTime(simpleDateFormat.format(new Date()));
        vehicleDao.update(vehicle);
        return "success";
    }



    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")String id){
        Vehicle vehicle=vehicleDao.getById(Long.parseLong(id));
        vehicle.setIsDelete(1);
        vehicle.setDeleteTime(simpleDateFormat.format(new Date()));

        vehicleDao.update(vehicle);
        return "success";
    }

    @RequestMapping(value="/search",method = RequestMethod.GET)
    public ModelAndView search(@RequestParam(value = "search") String search)
    {
        //byte bb[];
        //bb = search.getBytes("ISO-8859-1"); //以"ISO-8859-1"方式解析name字符串
        //search= new String(bb, "UTF-8"); //再用"utf-8"格式表示name
        //search = new String (search.getBytes(Charset.forName("GBK")), "GBK");
        try{search = new String (search.getBytes(Charset.forName("utf-8")), "utf-8");}
        catch(Exception e) {}



        //search = new String (search.getBytes(Charset.forName("utf-8")), "utf-8");

        System.out.println(search);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("VehicleIndex");
        List<Vehicle> vehicleList=vehicleDao.findAll("from Vehicle where isDelete='0' and ((company like '%"+search+"%') or (vehicleType like '%"+search+"%'))",Vehicle.class);
        //List<Vehicle> vehicleList=vehicleDao.findAll("from Vehicle where isDelete='0'",Vehicle.class);
        modelAndView.addObject("VehicleList", vehicleList);
        modelAndView.addObject("search", search);
        return modelAndView;
    }

    /*@RequestMapping(value = "/list",method = RequestMethod.POST)
    @ResponseBody
    public String list(){
        List<Vehicle>vehicleList=vehicleDao.getList();
        return JSONArray.fromObject(vehicleList).toString();
    }*/


    /*@RequestMapping(value = "/get",method = RequestMethod.POST)
    @ResponseBody
    public String list(@RequestParam(value = "id")String id){
        Vehicle vehicle=vehicleDao.getById(Long.parseLong(id));
        return JSONObject.fromObject(vehicle).toString();
    }*/
}
