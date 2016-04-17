package com.springapp.mvc;

import com.springapp.entity.Account;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/17.
 */
@Controller
@RequestMapping(value = "**")
public class UserController extends BaseController{
    @RequestMapping(value = "/UserManage",method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView();
        List<Account>accounts=userDao.getList();
        modelAndView.addObject("List",accounts);
        modelAndView.setViewName("management1");
        return modelAndView;
    }
    @RequestMapping(value = "/User",method = RequestMethod.GET)
    public ModelAndView UserAdd(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        String id=request.getParameter("id");
        try{
            Account account=userDao.getById(Long.parseLong(id));
            modelAndView.addObject(account);
        }catch (Exception e){
            System.out.print("error");
        }
        modelAndView.setViewName("management1-edit");
        return modelAndView;
    }
    @RequestMapping(value = "/User/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestParam(value = "account")String account,@RequestParam(value = "username")String username,@RequestParam(value = "power")String power,@RequestParam(value = "company")String company,
                      @RequestParam(value = "phoneNum")String phoneNum,@RequestParam(value = "remark")String remark){
        Account a=new Account();
        a.setAccount(account);
        a.setUsername(username);
        a.setPower(power);
        a.setCompany(company);
        a.setPhoneNum(phoneNum);
        a.setRemark(remark);
        userDao.save(a);
        return "success";
    }
    @RequestMapping(value = "/User/edit",method = RequestMethod.POST)
    @ResponseBody
    public String edit(@RequestParam(value = "id")Long id,@RequestParam(value = "account")String account,@RequestParam(value = "username")String username,@RequestParam(value = "power")String power,
                       @RequestParam(value = "company")String company, @RequestParam(value = "phoneNum")String phoneNum,@RequestParam(value = "remark")String remark){
        Account a=userDao.getById(id);
        a.setAccount(account);
        a.setUsername(username);
        a.setPower(power);
        a.setCompany(company);
        a.setPhoneNum(phoneNum);
        a.setRemark(remark);
        userDao.update(a);
        return "success";
    }
    @RequestMapping(value = "/User/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")Long id){
        userDao.delete(Account.class,id);
        return "success";
    }
}
