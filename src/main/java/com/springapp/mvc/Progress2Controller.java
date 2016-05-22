package com.springapp.mvc;

import com.springapp.entity.Line;
import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by as on 2016/5/9.
 */
@Controller
@RequestMapping(value = "**")
public class Progress2Controller extends BaseController{
    @RequestMapping(value="/progress2",method = RequestMethod.GET)
    public ModelAndView home(ModelAndView modelAndView,HttpServletRequest request){
        modelAndView.setViewName("progress2");
        List<Line> cjList=lineDao.getListByCompany("上海成基市政建设发展有限公司");
        List<Line>gjyhList=lineDao.getListByCompany("上海高架养护管理有限公司");
        List<Vehicle>cyList=vehicleDao.getCyList();
        List<Vehicle>cqList=vehicleDao.getCqList();
        List<Vehicle>cxList=vehicleDao.getCxList();
        List<Vehicle>gyList=vehicleDao.getGyList();
        List<Vehicle>gqList=vehicleDao.getGqList();
        List<Vehicle>gxList=vehicleDao.getGxList();
        modelAndView.addObject("cyList",cyList);
        modelAndView.addObject("cqList",cqList);
        modelAndView.addObject("cxList",cxList);
        modelAndView.addObject("gqList",gqList);
        modelAndView.addObject("gxList",gxList);
        modelAndView.addObject("gyList",gyList);
        modelAndView.addObject("cjList",cjList);
        modelAndView.addObject("gjyhList",gjyhList);
        return modelAndView;
    }
    @RequestMapping(value="/progress2-1",method = RequestMethod.GET)
    public ModelAndView home1(ModelAndView modelAndView,HttpServletRequest request){
        modelAndView.setViewName("progress2-1");
        String id=request.getParameter("id");
        modelAndView.addObject("id",id);
        return modelAndView;
    }
    @RequestMapping(value="/progress2-2",method = RequestMethod.GET)
    public ModelAndView home2(ModelAndView modelAndView,HttpServletRequest request){
        modelAndView.setViewName("progress2-2");
        String id=request.getParameter("id");
        modelAndView.addObject("id",id);
        return modelAndView;
    }
}
