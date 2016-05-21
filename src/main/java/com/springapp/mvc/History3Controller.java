package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/16.
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
@RequestMapping(value = "**")
public class History3Controller extends BaseController {


    @RequestMapping(value = "/History3")
    public String history3() {
        return "history3";
    }

    @RequestMapping(value = "/history3-check")
    public String history3check() {
        return "history3-check";
    }
}
