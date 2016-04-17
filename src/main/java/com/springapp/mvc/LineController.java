package com.springapp.mvc;

import com.springapp.entity.Line;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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
 * Created by ZhanShaoxiong on 2016/4/10.
 * 作业线路
 */
@Controller
@RequestMapping(value = "**")
public class LineController extends BaseController{
    @RequestMapping(value = "/line",method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("plan2");
        List<Line>lineList=lineDao.getList();
        modelAndView.addObject("lineList",lineList);
        return modelAndView;
    }
    @RequestMapping(value="/drawLine",method = RequestMethod.GET)
    public ModelAndView manage(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("plan2_add");
        List<Line>cjList=lineDao.getListByCompany("上海成基公司");
        List<Line>gjyhList=lineDao.getListByCompany("上海高架养护公司");
        modelAndView.addObject("cjList",cjList);
        modelAndView.addObject("gjyhList",gjyhList);
        return modelAndView;
    }
    @RequestMapping(value = "/line/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(HttpServletRequest request,@RequestParam(value = "realDistance")String realDistance,@RequestParam(value = "packageName")String packageName,@RequestParam(value = "packageId")Long packageId,@RequestParam(value = "company")String company,@RequestParam(value = "lineName")String lineName,@RequestParam(value = "startCoord")String startCoord,@RequestParam(value = "lng")Double lng,@RequestParam(value = "lat")Double lat,@RequestParam(value = "coords")String coords,@RequestParam(value = "endCoord")String endCoord,
                      @RequestParam(value = "direction")String direction, @RequestParam(value = "directionType")String directionType/*,@RequestParam(value = "remark")String remark*/){
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        Line line=new Line();
        line.setRealDistance(realDistance);
        line.setLng(lng);
        line.setLat(lat);
        line.setCompany(company);
        line.setLine(lineName);
        line.setStartCoord(startCoord);
        line.setCoords(coords);
        line.setEndCoord(endCoord);
        line.setDirection(direction);
        line.setDirectionType(directionType);
        line.setPackgeName(packageName);
        line.setPackgeId(packageId);
        line.setInputMan(username);
      /*  line.setInputId(Long.parseLong(inputId));
        Account account =userDao.getById(Long.parseLong(inputId));
        line.setInputMan(account.getUsername());*/
      /*  line.setRemark(remark);*/
        lineDao.save(line);
        return "success";
    }

    @RequestMapping(value = "/line/edit",method = RequestMethod.POST)
    @ResponseBody
    public String edit(HttpServletRequest request,@RequestParam(value = "id")String id,@RequestParam(value = "company")String company,@RequestParam(value = "lineName")String lineName,@RequestParam(value = "packageName")String packageName,@RequestParam(value = "packageId")Long packageId,/*,@RequestParam(value = "startCoord")String startCoord,@RequestParam(value = "coords")String coords,@RequestParam(value = "endCoord")String endCoord,*/
                      @RequestParam(value = "direction")String direction,@RequestParam(value = "directionType")String directionType/*@RequestParam(value = "inputId")String inputId,*//*@RequestParam(value = "remark")String remark*/){
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        Line line=lineDao.getById(Long.parseLong(id));
        line.setCompany(company);
        line.setLine(lineName);
      /*  line.setStartCoord(startCoord);
        line.setCoords(coords);
        line.setEndCoord(endCoord);*/
        line.setDirection(direction);
        line.setDirectionType(directionType);
        line.setInputMan(username);
        line.setPackgeId(packageId);
        line.setPackgeName(packageName);
       /* line.setInputId(Long.parseLong(inputId));
        Account account =userDao.getById(Long.parseLong(inputId));
        line.setInputMan(account.getUsername());*/
        /*line.setRemark(remark);*/
        lineDao.update(line);
        return "success";
    }
    @RequestMapping(value = "/line/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")String id){
        Line line=lineDao.getById(Long.parseLong(id));
        line.setIsDelete(1);
        lineDao.update(line);
        return "success";
    }
    @RequestMapping(value = "/line/deleteByCoords",method = RequestMethod.POST)
    @ResponseBody
    public String deleteByCoords(@RequestParam(value = "startCoord")String startCoord,@RequestParam(value = "endCoord")String endCoord){
        Line line=lineDao.getByCoords(startCoord,endCoord);
        line.setIsDelete(1);
        lineDao.update(line);
        return "success";
    }

    @RequestMapping(value = "/line/list",method = RequestMethod.POST)
    @ResponseBody
    public String list(){
       List<Line> lineList=lineDao.getList();
        return JSONArray.fromObject(lineList).toString();
    }

    @RequestMapping(value = "/line/get",method = RequestMethod.POST)
    @ResponseBody
    public String get(@RequestParam(value = "id")String id){
        Line line=lineDao.getById(Long.parseLong(id));
        return JSONObject.fromObject(line).toString();
    }
    @RequestMapping(value = "/line/getIdByCoords",method = RequestMethod.POST)
    @ResponseBody
    public String getIdByCoords(@RequestParam(value = "startCoord")String startCoord,@RequestParam(value = "endCoord")String endCoord){
        Line line=lineDao.getByCoords(startCoord,endCoord);
        try{
            return line.getId().toString();
        }catch (Exception e){
            return "error";
        }
    }
    @RequestMapping(value = "/line/getByCoords",method = RequestMethod.POST)
    @ResponseBody
    public String getByCoords(@RequestParam(value = "startCoord")String startCoord,@RequestParam(value = "endCoord")String endCoord){
        Line line=lineDao.getByCoords(startCoord,endCoord);
        return JSONObject.fromObject(line).toString();
    }
    //通过包件id获取作业线路
    @RequestMapping(value = "/line/getByPackage",method = RequestMethod.POST)
    @ResponseBody
    public String getByCoords(@RequestParam(value = "packageId")Long packageId){
        List<Line> lineList=lineDao.getListByPackage(packageId);
        return JSONArray.fromObject(lineList).toString();
    }
}
