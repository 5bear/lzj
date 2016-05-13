package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/16.
 */


import com.springapp.entity.Park;
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
public class ParkController extends BaseController {
    /*@RequestMapping(value = "/index",method =RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Vehicle");
        return modelAndView;
    }*/

    @RequestMapping(value="/Park",method =RequestMethod.GET)
    public ModelAndView list()
    {
        System.out.println("index");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("ParkIndex");
        modelAndView.addObject("ParkList", parkDao.getList());//获取表中所有的数据
        modelAndView.addObject("search", "");
        return modelAndView;


    }

    @RequestMapping(value = "/ParkAdd0")
    public String add0()
    {
        return "ParkAdd";
    }



    @RequestMapping(value = "/ParkAdd1",method =RequestMethod.POST)
    @ResponseBody
    public String add1(@RequestParam(value = "company") String company,
                       @RequestParam(value = "parkName") String parkName,
                       @RequestParam(value = "tel") String tel,
                       @RequestParam(value = "addr") String addr,
                       @RequestParam(value = "serverIP") String serverIP)
    {
        //System.out.println("add1");

        List<Park> parkList=parkDao.getList();
        for(int i=0;i<parkList.size();i++)
        {

            Park park=parkList.get(i);
            if(parkName.equals(park.getParkName())) {
                return "false";
            }
        }
        if(parkName=="")
            return "null";
        Park park = new Park();
        park.setCompany(company);
        park.setParkName(parkName);
        park.setTel(tel);
        park.setAddr(addr);
        park.setServerIP(serverIP);
        park.setIsDelete(0);
        park.setCreateTime(simpleDateFormat.format(new Date()));
        vehicleDao.save(park);
        return "success";
    }

    @RequestMapping(value = "/ParkEdit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") String id)
    {
        Park park = parkDao.getById(Long.parseLong(id));
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("ParkEdit");
        modelAndView.addObject("Park_edit", park);
        return modelAndView;
    }

    @RequestMapping(value = "/ParkEdit1", method = RequestMethod.POST)
    @ResponseBody
    public String edit1(@RequestParam(value = "id") String id,
                        @RequestParam(value = "company") String company,
                        @RequestParam(value = "parkName") String parkName,
                        @RequestParam(value = "tel") String tel,
                        @RequestParam(value = "addr") String addr,
                        @RequestParam(value = "serverIP") String serverIP)
    {
        if(parkName=="")
            return "null";
        Park park = parkDao.getById(Long.parseLong(id));
        /*String parkNameEdit=park.getParkName();
        List<Park> parkList=parkDao.getList();
        for(int i=0;i<parkList.size();i++)
        {


            Park p=parkList.get(i);
            if(parkName!=parkNameEdit)
            {
                if(parkName.equals(p.getParkName()))
                return "false";
            }
        }*/

        park.setCompany(company);
        park.setParkName(parkName);
        park.setTel(tel);
        park.setAddr(addr);
        park.setServerIP(serverIP);
        park.setEditTime(simpleDateFormat.format(new Date()));
        vehicleDao.update(park);
        return "success";
    }



    @RequestMapping(value = "/ParkDelete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")String id){
        Park park = parkDao.getById(Long.parseLong(id));
        park.setIsDelete(1);
        park.setDeleteTime(simpleDateFormat.format(new Date()));

        vehicleDao.update(park);
        return "success";
    }

    @RequestMapping(value="/ParkSearch",method = RequestMethod.GET)
    public ModelAndView search(@RequestParam(value = "search") String search)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("ParkIndex");
        List<Park> parkList=parkDao.findAll("from Park where isDelete='0' and ((company like '%"+search+"%') or (parkName like '%"+search+"%'))",Park.class);
        modelAndView.addObject("ParkList", parkList);
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
