package com.springapp.mvc;

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
import java.util.Date;
import java.util.List;

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
        session.removeAttribute("username");
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
                if (password.equals(account.getPassword())) {
                    account.setLastLogin(simpleDateFormat.format(new Date()));
                    userDao.update(account);
                    List<Auth> authList=powerDao.getByRole(account.getPower());
                    session.setAttribute("list",authList);
                    session.setAttribute("username",account.getUsername());
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
