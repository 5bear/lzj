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
public class HistoryController1 extends BaseController {
    @RequestMapping(value = "/history1",method = RequestMethod.GET)
    public ModelAndView history1(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("history1");
        return modelAndView;
    }
}
