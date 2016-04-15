package com.springapp.mvc;

import com.springapp.entity.Rules;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestParam(value = "CleanCarDeviate") Double CleanCarDeviate, @RequestParam(value = "PullCarDeviate") Double PullCarDeviate, @RequestParam(value = "ViewCarDeviate") Double ViewCarDeviate,
                      @RequestParam(value = "CleanCarSpeed") Double CleanCarSpeed,
                      @RequestParam(value = "PullCarSpeed") Double PullCarSpeed, @RequestParam(value = "ViewCarSpeed") Double ViewCarSpeed, @RequestParam(value = "Times") Double Times, @RequestParam(value = "StartTime") String StartTime,
                      @RequestParam(value = "EndTime") String EndTime) {
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
        return "success";
    }
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public String edit(@RequestParam(value = "CleanCarDeviate1") Double CleanCarDeviate, @RequestParam(value = "PullCarDeviate1") Double PullCarDeviate, @RequestParam(value = "ViewCarDeviate1") Double ViewCarDeviate,
                      @RequestParam(value = "CleanCarSpeed1") Double CleanCarSpeed,
                      @RequestParam(value = "PullCarSpeed1") Double PullCarSpeed, @RequestParam(value = "ViewCarSpeed1") Double ViewCarSpeed,
                      @RequestParam(value = "Times1") Double Times, @RequestParam(value = "StartTime1") String StartTime,
                      @RequestParam(value = "EndTime1") String EndTime) {
        Rules rules =rulesDao.getList().get(0);//只有一条数据
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
        return "success";
    }
    @RequestMapping(value = "/list",method = RequestMethod.POST)
    @ResponseBody
    public String list(){
        List<Rules> rulesList=rulesDao.getList();
        return JSONArray.fromObject(rulesList).toString();
    }
}
