package com.springapp.mvc;

import com.springapp.entity.Account;
import com.springapp.entity.Auth;
import com.springapp.entity.Rules;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by shigaolei on 2016/4/12.
 */
@Controller
@RequestMapping(value = "/Rules")
public class RulesController  extends BaseController{
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(ModelAndView modelAndView){
        modelAndView.setViewName("base6");
        return modelAndView;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public String edit(@RequestParam(value = "CleanCarDeviate1") Double CleanCarDeviate, @RequestParam(value = "PullCarDeviate1") Double PullCarDeviate, @RequestParam(value = "ViewCarDeviate1") Double ViewCarDeviate,
                      @RequestParam(value = "CleanCarSpeed1") Double CleanCarSpeed,
                      @RequestParam(value = "PullCarSpeed1") Double PullCarSpeed, @RequestParam(value = "ViewCarSpeed1") Double ViewCarSpeed,
                      @RequestParam(value = "Times1") Double Times, @RequestParam(value = "StartTime1") String StartTime,
                      @RequestParam(value = "EndTime1") String EndTime) {
        if(rulesDao.getList().isEmpty()){
            Rules rules = new Rules();
            rules.setCleanCarDeviate(CleanCarDeviate);
            rules.setPullCarDeviate(PullCarDeviate);
            rules.setViewCarDeviate(ViewCarDeviate);
            rules.setCleanCarSpeed(CleanCarSpeed);
            rules.setPullCarSpeed(PullCarSpeed);
            rules.setViewCarSpeed(ViewCarSpeed);
            rules.setTimes(Times);
            rules.setStartTime(StartTime);
            rules.setEndTime(EndTime);
            rulesDao.save(rules);
        }
        else {
            Rules rules = rulesDao.getList().get(0);//只有一条数据
            rules.setCleanCarDeviate(CleanCarDeviate);
            rules.setPullCarDeviate(PullCarDeviate);
            rules.setViewCarDeviate(ViewCarDeviate);
            rules.setCleanCarSpeed(CleanCarSpeed);
            rules.setPullCarSpeed(PullCarSpeed);
            rules.setViewCarSpeed(ViewCarSpeed);
            rules.setTimes(Times);
            rules.setStartTime(StartTime);
            rules.setEndTime(EndTime);
            rulesDao.update(rules);
        }
        return "success";
    }
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public String list(){
        List<Rules> rulesList=rulesDao.getList();
        return JSONArray.fromObject(rulesList).toString();
    }
    @RequestMapping(value = "/getPower",method = RequestMethod.GET)
    @ResponseBody
    public String getPower(@RequestParam(value = "account") String account){
        List<Account> getPower = userDao.findAll("from Account where account = '"+account+"'");
        List<Auth> powerList = new ArrayList<Auth>();
        if(getPower.size()>0) {
            if(getPower.get(0).getPower().equals("系统管理员")){
                return "success";
            }else {
                powerList = powerDao.findAll("from Auth where role = '" + getPower.get(0).getPower() + "' and pageName = '监控规则'");
                if (powerList.size() > 0) {
                    if (powerList.get(0).getManagement().equals("yes"))
                        return "success";
                    else
                        return "noPower";
                } else
                    return "noPower";
            }
        }
        else
            return "noPower";
    }
}
