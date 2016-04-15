package com.springapp.mvc;

import com.springapp.entity.Account;
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

    @RequestMapping(value = "/loginCheck",method = RequestMethod.POST)
    @ResponseBody
    public String loginCheck(HttpServletRequest request,@RequestParam(value = "username")String username,@RequestParam(value = "password")String password){
        System.out.print(username+password);
        HttpSession session= request.getSession();
        List<Account> accountList =userDao.getList();
        for(Account account : accountList){
            if(username.equals(account.getUsername())){
                if (password.equals(account.getPassword())) {
                    account.setLastLogin(simpleDateFormat.format(new Date()));
                    userDao.update(account);
                    session.setAttribute("username",username);
                    return "success";
                }
                return "pwd_error";
            }
        }
        return "usr_error";
    }
}
