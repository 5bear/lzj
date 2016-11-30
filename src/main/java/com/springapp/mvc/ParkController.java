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

import javax.servlet.http.HttpSession;
import java.util.Date;


@Controller
@RequestMapping(value = "**")
public class ParkController extends BaseController {
    /*@RequestMapping(value = "/index",method =RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Vehicle");
        return modelAndView;
    }*/

    @RequestMapping(value = "/Park/list", method = RequestMethod.GET)
    public ModelAndView list(@RequestParam(required = false) String name,HttpSession session) {
        if (name == null) {
            name = "";
        }
        System.out.println("index");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("ParkIndex");
        String company = String.valueOf(session.getAttribute("company"));
        modelAndView.addObject("ParkList", parkDao.getList(name,company));//获取表中所有的数据
        modelAndView.addObject("name", name);
        return modelAndView;


    }

    @RequestMapping(value = "/Park/add", method = RequestMethod.GET)
    public ModelAndView add0(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("ParkAdd");
        String company = String.valueOf(session.getAttribute("company"));
        modelAndView.addObject("company", company);
        return modelAndView;
    }


    @RequestMapping(value = "/Park/add", method = RequestMethod.POST)
    @ResponseBody
    public String add1(@RequestParam(value = "company") String company,
                       @RequestParam(value = "parkName") String parkName,
                       @RequestParam(value = "tel") String tel,
                       @RequestParam(value = "addr") String addr,
                       @RequestParam(value = "serverIP") String serverIP) {
        //System.out.println("add1");

        if ("".equals(parkName.trim())){
            return "null";
        }
        Park park = parkDao.getByName(parkName);
        if (park != null) {
            return "false";
        }

        park = new Park();
        park.setCompany(company);
        park.setParkName(parkName);
        park.setTel(tel);
        park.setAddr(addr);
        park.setServerIP(serverIP);
        park.setIsDelete(0);
        park.setCreateTime(simpleDateFormat.format(new Date()));
        parkDao.add(park);
        return "success";
    }

    @RequestMapping(value = "/Park/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") String id,HttpSession session) {
        Park park = parkDao.getById(Long.parseLong(id));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("ParkEdit");
        modelAndView.addObject("Park_edit", park);
        String company = String.valueOf(session.getAttribute("company"));
        modelAndView.addObject("company", company);
        return modelAndView;
    }

    @RequestMapping(value = "/Park/edit", method = RequestMethod.POST)
    @ResponseBody
    public String edit1(@RequestParam(value = "id") String id,
                        @RequestParam(value = "company") String company,
                        @RequestParam(value = "parkName") String parkName,
                        @RequestParam(value = "tel") String tel,
                        @RequestParam(value = "addr") String addr,
                        @RequestParam(value = "serverIP") String serverIP) {
        if ("".equals(parkName.trim()))
            return "null";
        Park park = parkDao.getById(Long.parseLong(id));

        Park nPark = parkDao.getByName(parkName);
        if (nPark!=null && !nPark.getId().equals(park.getId())){
            return "false";
        }
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
        parkDao.update(park);
        return "success";
    }


    @RequestMapping(value = "/Park/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id") String id) {
        Park park = parkDao.getById(Long.parseLong(id));
        park.setIsDelete(1);
        park.setDeleteTime(simpleDateFormat.format(new Date()));

        parkDao.update(park);
        return "success";
    }

   /* @RequestMapping(value="/ParkSearch",method = RequestMethod.GET)
    public ModelAndView search(@RequestParam(value = "search") String search)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("ParkIndex");
        List<Park> parkList=parkDao.findAll("from Park where isDelete='0' and ((company like '%"+search+"%') or (parkName like '%"+search+"%'))",Park.class);
        modelAndView.addObject("ParkList", parkList);
        modelAndView.addObject("search", search);
        return modelAndView;
    }*/

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
