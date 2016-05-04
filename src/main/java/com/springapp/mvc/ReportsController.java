package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by ZhanShaoxiong on 2016/5/4.
 */
@Controller
@RequestMapping(value = "**")
public class ReportsController extends BaseController{
    @RequestMapping(value = "/reports1",method = RequestMethod.GET)
    public ModelAndView reports1(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("reports1");
        return modelAndView;
    }
    @RequestMapping(value = "/reports2",method = RequestMethod.GET)
    public ModelAndView reports2(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("reports2");
        return modelAndView;
    }
    @RequestMapping(value = "/reports3",method = RequestMethod.GET)
    public ModelAndView reports3(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("reports3");
        return modelAndView;
    }
    @RequestMapping(value = "/reports4",method = RequestMethod.GET)
    public ModelAndView reports4(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("reports4");
        return modelAndView;
    }
}
