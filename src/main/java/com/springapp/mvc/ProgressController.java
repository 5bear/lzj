package com.springapp.mvc;

import com.springapp.entity.Package;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by as on 2016/4/18.
 */
    @Controller
    @RequestMapping(value = "/Progress1")
    public class ProgressController extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(ModelAndView modelAndView){
        List<Package> packageList=packageDao.findAll("from Package",Package.class);
        modelAndView.addObject("Progress", packageList);
        modelAndView.setViewName("Progress1");
        return modelAndView;
    }
}
