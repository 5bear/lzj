package com.springapp.mvc;

import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/4.
 */
@Controller
@RequestMapping(value = "**")
public class HistoryController1 extends BaseController {
    @RequestMapping(value = "/history1",method = RequestMethod.GET)
    public ModelAndView history1(HttpSession session){
        ModelAndView modelAndView=new ModelAndView();
        String company= (String) session.getAttribute("company");
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
        List<Vehicle>vehicleList=company.equals("养护中心")?vehicleDao.getList():baseDao.findAll("from Vehicle where isDelete=0 and company='"+company+"'",Vehicle.class);
        modelAndView.addObject("list",vehicleList);
        modelAndView.setViewName("history1");
        return modelAndView;
    }
}
