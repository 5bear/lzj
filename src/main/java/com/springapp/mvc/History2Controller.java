package com.springapp.mvc;

import com.springapp.classes.FTPClientExample;
import com.springapp.entity.Package;
import com.springapp.entity.Vehicle;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.net.ftp.FTPClient;
import java.lang.Thread;
import java.lang.Runnable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by as on 2016/5/25.
 */
@Controller
@RequestMapping(value = "**")
public class History2Controller extends BaseController {
    @RequestMapping(value = "/history2", method = RequestMethod.GET)
    public ModelAndView history2video(@RequestParam(value="id",required = false) String id,@RequestParam(value="company",required = false) String company,@RequestParam(value="year",required = false) String year,
                                      @RequestParam(value="start",required = false) String start,@RequestParam(value="end",required = false) String end,@RequestParam(value="veLicense",required = false) String veLicense) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("history2");
        List<Vehicle> vehicleLicense=vehicleDao.list("from Vehicle where isDelete=0");
        modelAndView.addObject("vehicleLicense", vehicleLicense);
        if(company==null && id==null && veLicense == null) {
            modelAndView.addObject("year", "");
            modelAndView.addObject("start", "");
            modelAndView.addObject("end", "");
            return modelAndView;
        }
        List<String> List = new ArrayList<String>();
        FTPClientExample ftp = new FTPClientExample();
        if(company=="CJcompany") {
            try {
                List = ftp.CJbegin(id.toString(),year.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                List = ftp.GJbegin(id.toString(),year.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        modelAndView.addObject("veLicense", veLicense);
        modelAndView.addObject("FileList", List);
        modelAndView.addObject("id", id);
        modelAndView.addObject("company", company);
        modelAndView.addObject("year", year);
        modelAndView.addObject("start", start);
        modelAndView.addObject("end", end);

        return modelAndView;
    }
    @RequestMapping(value="/history2/search",method = RequestMethod.GET)
    @ResponseBody
    public String search(@RequestParam(value = "vehicleLicense") String vehicleLicense){
        List<Vehicle> packageList=vehicleDao.list("from Vehicle where isDelete=0 and vehicleLicense='"+vehicleLicense+"'");
        return JSONArray.fromObject(packageList).toString();
    }

}

