package com.springapp.mvc;

import com.springapp.entity.Package;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by as on 2016/5/9.
 */
@Controller
@RequestMapping(value = "**")
public class Progress2Controller extends BaseController{
    @RequestMapping(value="/progress2",method = RequestMethod.GET)
    public ModelAndView home(ModelAndView modelAndView){
        modelAndView.setViewName("progress2");
        return modelAndView;
    }
    @RequestMapping(value="/progress2-1",method = RequestMethod.GET)
    public ModelAndView home1(ModelAndView modelAndView){
        modelAndView.setViewName("progress2-1");
        return modelAndView;
    }
}
