package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by ZhanShaoxiong on 2016/4/25.
 */
@Controller
@RequestMapping(value="**")
public class PowerController extends BaseController {
    @RequestMapping(value = "/Power",method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView("management2");
        return modelAndView;
    }
}
