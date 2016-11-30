package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/16.
 */

import com.springapp.classes.JsonUtil;
import com.springapp.classes.model.AjaxObj;
import com.springapp.classes.model.Pager;
import com.springapp.classes.model.SystemContext;
import com.springapp.entity.Account;
import com.springapp.entity.MyException;
import com.springapp.entity.Vehicle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;


@Controller
@RequestMapping(value = "**")
public class History3Controller extends BaseController {


    @RequestMapping(value = "/History3")
    public ModelAndView history3(HttpSession session, HttpServletRequest req, @RequestParam(required = false) String date, @RequestParam(required = false) String company, @RequestParam(required = false) String vtype, @RequestParam(required = false) String conV) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("history3");
        if (date == null) {
            date = "";
        }
        String company1 = String.valueOf(session.getAttribute("company"));
        if (company == null || "".equals(company)) {
            if ("养护中心".equals(company1)) {
                company = "养护中心";
            } else {
                company = company1;
            }
        }
        if (vtype == null) {
            vtype = "";
        }
        if (conV == null) {
            conV = "";
        }
        //  String[] vTypes = req.getParameterValues("vType");

        Pager<MyException> exceptions = exceptionDao.getPager(company, date, vtype, conV);
        SystemContext.setSort("");
        List<Vehicle> vs = vehicleDao.getList(company, vtype);
        mav.addObject("excepDatas", exceptions);
        mav.addObject("date", date);

        mav.addObject("vehicleLicense", vs);
        mav.addObject("company", company);
        mav.addObject("vtype", vtype);
        mav.addObject("conV", conV);

        return mav;
    }

    @RequestMapping(value = "/history3-check/{id}")
    public ModelAndView history3check(@PathVariable int id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("history3-check");
        MyException me = exceptionDao.get(id);
        mav.addObject("me", me);
        return mav;
    }

    @RequestMapping(value = "/getException", method = RequestMethod.POST)
    @ResponseBody
    public String getException(HttpSession session, @RequestParam(value = "id") int curId) {
        AjaxObj ao = new AjaxObj();
        String company = String.valueOf(session.getAttribute("company"));
        List<MyException> list = exceptionDao.getException(company, curId);
        ao.setResult(0);
        ao.setObj(list);
        return JsonUtil.getInstance().obj2json(ao);
    }

    @RequestMapping(value = "/confirmException", method = RequestMethod.POST)
    @ResponseBody
    public String confirmException(HttpServletRequest req) {
        AjaxObj ao = new AjaxObj();
        String[] temp = req.getParameterValues("ids[]");
        Integer[] ids = null;

        if (temp != null) {
            ids = new Integer[temp.length];
            for (int i = 0; i < temp.length; i++) {
                ids[i] = Integer.parseInt(temp[i].trim());
            }
            exceptionDao.confirmException(ids);
            ao.setResult(0);
        } else {
            ao.setResult(1);
            ao.setMsg("请勾选异常信息");
        }

        return JsonUtil.getInstance().obj2json(ao);
    }


}
