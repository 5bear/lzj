package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by ZhanShaoxiong on 2016/5/5.
 */
@Controller
@RequestMapping(value = "/plan3")
public class Plan3Controller extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView("plan3");
        return modelAndView;
    }
}

