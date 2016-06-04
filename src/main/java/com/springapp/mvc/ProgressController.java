package com.springapp.mvc;

import com.springapp.entity.MaintainProgress;
import com.springapp.entity.Package;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by as on 2016/4/18.
 */
    @Controller
    @RequestMapping(value = "**")
    public class ProgressController extends BaseController {
    @RequestMapping(value="/Progress1",method = RequestMethod.GET)
    public ModelAndView home(ModelAndView modelAndView,HttpServletRequest request){
        List<Package> chengjiCompanyList=packageDao.list("from Package where company='上海成基市政建设发展有限公司' and isDelete=0");
        List<Package> gaojiaCompanyList=packageDao.list("from Package where company='上海高架养护管理有限公司' and isDelete=0");
        modelAndView.addObject("chengjiCompany", chengjiCompanyList);
        modelAndView.addObject("gaojiaCompany", gaojiaCompanyList);
        String year=request.getParameter("year");
        modelAndView.addObject("year",year);
        String month=request.getParameter("month");
        modelAndView.addObject("month",month);
        String company=request.getParameter("company");
        modelAndView.addObject("company",company);
        String packagename=request.getParameter("packagename");
        modelAndView.addObject("packagename",packagename);
        String roads=request.getParameter("roads");
        modelAndView.addObject("roads",roads);
        modelAndView.setViewName("Progress1");
        return modelAndView;
    }
    @RequestMapping(value="/progress1-year",method = RequestMethod.GET)
    public ModelAndView homeyear(ModelAndView modelAndView){
        List<Package> chengjiCompanyList=packageDao.list("from Package where company='上海成基市政建设发展有限公司' and isDelete=0");
        List<Package> gaojiaCompanyList=packageDao.list("from Package where company='上海高架养护管理有限公司' and isDelete=0");
        modelAndView.addObject("chengjiCompany", chengjiCompanyList);
        modelAndView.addObject("gaojiaCompany", gaojiaCompanyList);
        modelAndView.setViewName("progress1-year");
        return modelAndView;
    }
    @RequestMapping(value="/progress1-day",method = RequestMethod.GET)
    public ModelAndView homeday(ModelAndView modelAndView,HttpServletRequest request){
        List<Package> chengjiCompanyList=packageDao.list("from Package where company='上海成基市政建设发展有限公司' and isDelete=0");
        List<Package> gaojiaCompanyList=packageDao.list("from Package where company='上海高架养护管理有限公司' and isDelete=0");
        modelAndView.addObject("chengjiCompany", chengjiCompanyList);
        modelAndView.addObject("gaojiaCompany", gaojiaCompanyList);
        String year=request.getParameter("year");
        modelAndView.addObject("year",year);
        String month=request.getParameter("month");
        modelAndView.addObject("month",month);
        String day=request.getParameter("day");
        modelAndView.addObject("day",day);
        String company=request.getParameter("company");
        modelAndView.addObject("company",company);
        String packagename=request.getParameter("packagename");
        modelAndView.addObject("packagename",packagename);
        String roads=request.getParameter("roads");
        modelAndView.addObject("roads",roads);
        modelAndView.setViewName("progress1-day");
        return modelAndView;
    }
    @RequestMapping(value="/progress1-year/getMonthByYearAll",method = RequestMethod.POST)
    @ResponseBody
    public String getMonthByYearAll(@RequestParam(value = "year") String year){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like '"+year+"%'",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }

    @RequestMapping(value="/progress1-year/getMonthByYear",method = RequestMethod.POST)
    @ResponseBody
    public String getMonthByYear(@RequestParam(value = "year") String year,@RequestParam(value = "company") String company,@RequestParam(value = "packageName") String packageName,@RequestParam(value = "Roads") String roads){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like '"+year+"%'and company like '%"+company+"%'and packName like '%"+packageName+"%'and Roads like '%"+roads+"%'",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
    @RequestMapping(value="/progress1-year/getMonthByYear1",method = RequestMethod.POST)
    @ResponseBody
    public String getMonthByYear1(@RequestParam(value = "year") String year,@RequestParam(value = "company") String company,@RequestParam(value = "packageName") String packageName){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like '"+year+"%'and company like '%"+company+"%'and packName like '%"+packageName+"%",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
    @RequestMapping(value="/progress1-year/getMonthByYearAllPackage",method = RequestMethod.POST)
    @ResponseBody
    public String getMonthByYearAllPackage(@RequestParam(value = "year") String year,@RequestParam(value = "company") String company){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like '"+year+"%'and company like '%"+company+"%'",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
    @RequestMapping(value="/Progress1/getDayByMonthAll",method = RequestMethod.POST)
    @ResponseBody
    public String getDayByMonthAll(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like '"+year+"-"+month+"%'",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
    @RequestMapping(value="/Progress1/getDayByMonth",method = RequestMethod.POST)
    @ResponseBody
    public String getDayByMonth(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month,@RequestParam(value = "company") String company,@RequestParam(value = "packageName") String packageName,@RequestParam(value = "Roads") String roads){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like '"+year+"-"+month+"%'and company like '%"+company+"%'and packName like '%"+packageName+"%'and Roads like '%"+roads+"%'",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
    @RequestMapping(value="/Progress1/getDayByMonthAllPackage",method = RequestMethod.POST)
    @ResponseBody
    public String getDayByMonthAllPackage(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month,@RequestParam(value = "company") String company){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like '"+year+"-"+month+"%'and company like '%"+company+"%'",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
    @RequestMapping(value="/Progress1/getDayByMonth1",method = RequestMethod.POST)
    @ResponseBody
    public String getDayByMonth1(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month,@RequestParam(value = "company") String company,@RequestParam(value = "packageName") String packageName){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like '"+year+"-"+month+"%'and company like '%"+company+"%'and packName like '%"+packageName+"%'",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
    @RequestMapping(value="/progress1-day/getDayAll",method = RequestMethod.POST)
    @ResponseBody
    public String getDayAll(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month,@RequestParam(value = "day") String day){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like "+year+"-"+month+"-"+day,MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
    @RequestMapping(value="/progress1-day/getDay",method = RequestMethod.POST)
    @ResponseBody
    public String getDay(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month,@RequestParam(value = "day") String day,@RequestParam(value = "company") String company,@RequestParam(value = "packageName") String packageName,@RequestParam(value = "Roads") String roads){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like "+year+"-"+month+"-"+day+"and company like "+company+"%'and packName like '%"+packageName+"%'and Roads like '%"+roads+"%'",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
    @RequestMapping(value="/progress1-day/getDay1",method = RequestMethod.POST)
    @ResponseBody
    public String getDay1(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month,@RequestParam(value = "day") String day,@RequestParam(value = "company") String company,@RequestParam(value = "packageName") String packageName){
        List<MaintainProgress> yearProgress=progressDao.findAll("from MaintainProgress where isDelete='0'and time like "+year+"-"+month+"-"+day+"and company like "+company+"%'and packName like '%"+packageName+"%'",MaintainProgress.class);
        return JSONArray.fromObject(yearProgress).toString();
    }
}
