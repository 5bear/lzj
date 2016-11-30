package com.springapp.mvc;

import com.springapp.entity.Package;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by as on 2016/4/20.
 */
@Controller
@RequestMapping(value = "/plan1")
public class Plan1Controller extends BaseController{
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(ModelAndView modelAndView){
        modelAndView.setViewName("Plan1");
        return modelAndView;
    }
    @RequestMapping(value="/search",method = RequestMethod.GET)
    @ResponseBody
    public String getMilliage(@RequestParam(value = "company") String company,@RequestParam(value = "year") String year){
        List<Package> packageList=packageDao.list("from Package where isDelete='0' and company like '%"+company+"%'and runtime like '"+year+"%'");
        return JSONArray.fromObject(packageList).toString();
    }
    @RequestMapping(value="/getYear",method = RequestMethod.GET)
    @ResponseBody
    public String getYear(@RequestParam(value = "company") String company){
        List<Package> yearList=packageDao.list("from Package where isDelete='0' and company like '%"+company+"%'");
        return JSONArray.fromObject(yearList).toString();
    }
}
