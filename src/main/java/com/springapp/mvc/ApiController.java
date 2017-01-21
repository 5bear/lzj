package com.springapp.mvc;

import com.springapp.classes.model.Pager;
import com.springapp.entity.Vehicle;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by 11369 on 2017/1/20.
 */
@Controller
@RequestMapping(value = "Api")
public class ApiController extends BaseController {
    @RequestMapping(value = "/vehicle/list",method = RequestMethod.GET)
    @ResponseBody
    public String vehicleList(@RequestParam(required = false) String name, @RequestParam(required = false) String type , @RequestParam(required = false) String company) {
        if (name == null) {
            name = "";
        }
        if (type == null) {
            type = "0";
        }
        if(company == null){
            company = "养护中心";
        }else if(company.equals("CJ")){
            company = "上海成基市政建设发展有限公司";
        }else if(company.equals("GJ")){
            company = "上海高架养护管理有限公司";
        }else
            company = "";
        List<Vehicle> vehicles = apiDao.vehicleList(type, name,company);
        return JSONArray.fromObject(vehicles).toString();
    }

}
