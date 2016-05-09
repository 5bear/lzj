package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/16.
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
@RequestMapping(value = "**")
public class Management3Controller extends BaseController {


    @RequestMapping(value = "/Management3")
    public String history3() {
        return "management3";
    }
}