package com.springapp.mvc;

import com.springapp.classes.MD5;
import com.springapp.entity.Account;
import com.springapp.entity.Auth;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZhanShaoxiong on 2016/4/10.
 */
@Controller
@RequestMapping(value = "**")
public class LoginController extends BaseController{
    @RequestMapping(value = "login",method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }
    @RequestMapping(value = "logout",method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        HttpSession session=request.getSession();
        session.removeAttribute("powerMap");
        session.removeAttribute("list");
        session.removeAttribute("username");
        session.removeAttribute("account");
        session.removeAttribute("power");
        session.removeAttribute("company");
        modelAndView.setViewName("login");
        return modelAndView;
    }
    @RequestMapping(value = "/loginCheck",method = RequestMethod.POST)
    @ResponseBody
    public String loginCheck(HttpServletRequest request,@RequestParam(value = "username")String username,@RequestParam(value = "password")String password){
        System.out.print(username+password);
        HttpSession session= request.getSession();
        List<Account> accountList =userDao.getList();
        for(Account account : accountList){
            if(username.equals(account.getAccount())){
                String md5=MD5.MD5Encode(password);
                if (md5.equals(account.getPassword())) {
                    account.setLastLogin(new Timestamp(System.currentTimeMillis()));
                    userDao.update(account);
                    String[]keys={"停车场管理","车辆管理","RFID管理","包件管理","电子围栏","监控规则","养护作业计划","作业路线管理","布点计划","驾驶员计划",
                            "养护进度监控","实时监控","养护日志管理","历史线路查询","历史视频查询","异常查询","报表查询","网络状态"};
                    String[]pageNames={"Park","Vehicle","RFID","Package","eFence","Rules","plan1","line","plan3","Driver","progress1-year","progress2","MaintainLog","history1",
                            "history2","History3","reports","Management3"};
                    Map map=new HashMap();
                    for(int i=0;i<18;i++){
                        map.put(keys[i],pageNames[i]);
                    }
                    Map powerMap=new HashMap();
                    List<Auth> authList = powerDao.getByRole(account.getPower());
                    if("系统管理员".equals(account.getPower())){
                        for(String pageName:pageNames){
                            powerMap.put(pageName,"yes");
                        }
                    }else {
                        for (Auth auth : authList) {
                            powerMap.put(map.get(auth.getPageName()), auth.getVisit());
                        }
                    }
                    if(!"系统管理员".equals(account.getPower())){
                        powerMap.put("UserManage","no");
                        powerMap.put("Power","no");
                    }else{
                        powerMap.put("UserManage","yes");
                        powerMap.put("Power","yes");
                    }
                    session.setAttribute("powerMap",powerMap);
                    session.setAttribute("list",authList);
                    session.setAttribute("username",account.getUsername());
                    session.setAttribute("account",account.getAccount());
                    session.setAttribute("user",account);
                    session.setAttribute("power",account.getPower());
                    session.setAttribute("company",account.getCompany());
                    return "success";
                }
                return "pwd_error";
            }
        }
        return "usr_error";
    }
}
