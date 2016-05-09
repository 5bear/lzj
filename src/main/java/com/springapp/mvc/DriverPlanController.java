package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/16.
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;




@Controller
@RequestMapping(value = "**")
public class DriverPlanController extends BaseController {


    @RequestMapping(value = "/DriverPlan")
    public String driverPlan() {

        return "plan4";
    }

    @RequestMapping(value = "/DriverPlanEdit")
    public String driverPlanEdit() {
        return "plan4-edit";
    }

}