package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by ZhanShaoxiong on 2016/5/9.
 */
@Controller
@RequestMapping(value = "**")
public class History2Controller {
    @RequestMapping(value = "/history2",method = RequestMethod.GET)
    public ModelAndView history2(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("history2");
        return modelAndView;
    }
}
