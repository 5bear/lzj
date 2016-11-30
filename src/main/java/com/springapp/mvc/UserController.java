package com.springapp.mvc;

import com.springapp.classes.MD5;
import com.springapp.entity.Account;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    @RequestMapping(value = "/UserAdd",method = RequestMethod.GET)
    public ModelAndView UserAdd(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("UserAdd");
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
    @RequestMapping(value = "/PersonalInfo",method = RequestMethod.GET)
    public ModelAndView PersonalInfo(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        HttpSession session=request.getSession();
        String user= (String) session.getAttribute("username");
        try{
            Account account=userDao.getByUsername(user);
            modelAndView.addObject(account);
        }catch (Exception e){
            System.out.print("error");
        }
        modelAndView.setViewName("personalManagement");
        return modelAndView;
    }
    @RequestMapping(value = "/User/get",method = RequestMethod.GET)
    @ResponseBody
    public String add(@RequestParam(value = "findName")String findName){
        return JSONArray.fromObject(userDao.getAccount(findName)).toString();
    }
    @RequestMapping(value = "/User/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestParam(value = "account")String account,@RequestParam(value = "username")String username,@RequestParam(value = "password")String password,@RequestParam(value = "power")String power,@RequestParam(value = "company")String company,
                      @RequestParam(value = "phoneNum")String phoneNum,@RequestParam(value = "remark")String remark){
        Account inAccout=userDao.getByAccount(account);
        Account inUsername=userDao.getByUsername(username);
        if(inAccout!=null||inUsername!=null)
            return "duplicated";
        Account a=new Account();
        a.setAccount(account);
        a.setUsername(username);
        a.setPassword(MD5.MD5Encode(password));
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
        if(userDao.isDuplicated(a))
            return "duplicated";
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
    @RequestMapping(value = "/User/changePwd",method = RequestMethod.POST)
    @ResponseBody
    public String changePwd(@RequestParam(value = "id")Long id,@RequestParam(value = "newPwd")String newPwd){
        Account account=userDao.getById(id);
        account.setPassword(MD5.MD5Encode(newPwd));
        userDao.update(account);
        return "success";
    }
    @RequestMapping(value = "/User/myEdit",method = RequestMethod.POST)
    @ResponseBody
    public String myEdit(@RequestParam(value = "id")Long id,@RequestParam(value = "username")String username, @RequestParam(value = "phoneNum")String phoneNum){
        Account a=userDao.getById(id);
        a.setUsername(username);
        a.setPhoneNum(phoneNum);
        userDao.update(a);
        return "success";
    }
}
