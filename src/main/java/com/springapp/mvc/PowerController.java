package com.springapp.mvc;

import com.springapp.entity.Auth;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZhanShaoxiong on 2016/4/25.
 */
@Controller
@RequestMapping(value="Power")
public class PowerController extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView("management2");
        return modelAndView;
    }
    @RequestMapping(value = "/editPower",method = RequestMethod.POST)
    @ResponseBody
    public String editPower(@RequestParam (value = "chooses")String chooses){
        String []powers1=chooses.split("!");
        for(String s:powers1){
            String []powers2=s.split("#")[0].split(",");
            String pageName=s.split("#")[1];
            String []roles={"领导","监理","养护公司管理","普通用户"};
            for(int i=0;i<4;i++){
                boolean flag=true;
                Auth auth =powerDao.get(pageName,roles[i]);
                if(auth ==null) {
                    auth = new Auth();
                    flag=false;
                }
                auth.setPageName(pageName);
                auth.setRole(roles[i]);
                auth.setPower(i);
                int m=i*2,v=m+1;
                auth.setManagement(powers2[m]);
                auth.setVisit(powers2[v]);
                if(flag)
                    powerDao.update(auth);
                else
                    powerDao.save(auth);
            }
        }
        return "success";
    }
    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    public String get(){
        String[]pageNames={"停车场管理","车辆管理","RFID管理","包件管理","电子围栏","监控规则","养护作业计划","作业路线管理","布点计划","驾驶员计划",
                "养护进度监控","实时监控","养护日志管理","历史线路查询","历史视频查询","异常查询","报表查询","网络状态"};
        List<Map> mapList=new ArrayList<Map>();
        for(String pageName:pageNames){
            List<Auth>authList=powerDao.getByPagename(pageName);
            Map map=new HashMap();
            map.put(pageName,authList);
            mapList.add(map);
        }
        return JSONArray.fromObject(mapList).toString();
    }
}
