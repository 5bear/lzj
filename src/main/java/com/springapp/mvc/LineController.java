package com.springapp.mvc;

import com.springapp.classes.JsonUtil;
import com.springapp.classes.model.AjaxObj;
import com.springapp.entity.*;
import com.springapp.entity.Package;
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
import java.awt.*;
import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * Created by ZhanShaoxiong on 2016/4/10.
 * 作业线路
 */
@Controller
@RequestMapping(value = "**")
public class LineController extends BaseController{

    @RequestMapping(value = "/getLine",method = RequestMethod.POST)
    @ResponseBody
    public String getLine(@RequestParam(value = "company") String company) {

        AjaxObj ao = new AjaxObj();
        List<Line> vs = lineDao.getList(company);
        ao.setResult(0);
        ao.setObj(vs);

        return JsonUtil.getInstance().obj2json(ao);
    }

    @RequestMapping(value = "/line",method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request,HttpSession session){
        ModelAndView modelAndView=new ModelAndView();
        String pn=request.getParameter("pn");
        String company=request.getParameter("company");
        String lcompany= (String) session.getAttribute("company");
        if(company==null)
            company=lcompany;
        String lineName=request.getParameter("lineName");
        if(lineName==null)
            lineName="";
        int pageNum=1,start=0,end=0;
        if(pn!=null&&!pn.equals(""))
            pageNum=Integer.parseInt(pn);
        start = (pageNum - 1) * 10;
        List<Line>lineList=lineDao.getList(company,lineName);
        int totalPage;
        if(lineList.size()%10==0)
            totalPage=lineList.size()/10;
        else
            totalPage=lineList.size()/10+1;
        request.setAttribute("company",company);
        request.setAttribute("lineName",lineName);
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<Line>myList=lineDao.getByPage(start,10,company,lineName);
        modelAndView.addObject("lineList",myList);
        modelAndView.setViewName("plan2");
        return modelAndView;
    }
    @RequestMapping(value="/drawLine",method = RequestMethod.GET)
    public ModelAndView manage(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        String id=request.getParameter("id");
        if(id!=null&&id!="") {
            Line line = lineDao.getById(Long.parseLong(id));
            modelAndView.addObject("line",line);
        }
        List<Line>cjList=lineDao.getListByCompany("上海成基市政建设发展有限公司");
        List<Line>gjyhList=lineDao.getListByCompany("上海高架养护管理有限公司");
        List<Package>packages=packageDao.getList();
        modelAndView.addObject("packages",packages);
        modelAndView.addObject("cjList",cjList);
        modelAndView.addObject("gjyhList",gjyhList);
        modelAndView.setViewName("plan2_add");

        return modelAndView;
    }
    @RequestMapping(value = "/line/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(HttpServletRequest request, String pointString, @RequestParam(value = "realDistance")String realDistance, @RequestParam(value = "packageName")String packageName, @RequestParam(value = "packageId")Long packageId, @RequestParam(value = "company")String company, @RequestParam(value = "lineName")String lineName, @RequestParam(value = "startCoord")String startCoord, @RequestParam(value = "coords")String coords, @RequestParam(value = "endCoord")String endCoord,
                      @RequestParam(value = "direction")String direction, @RequestParam(value = "directionType")String directionType/*,@RequestParam(value = "remark")String remark*/){
        if(lineDao.isDuplicated(null,lineName))
            return "duplicated";
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        Line line=new Line();
        if(realDistance.equals("")||realDistance!=null)
        line.setRealDistance(realDistance);
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
        saveVehicleLine(line,pointString);
        List<Package> packages = packageDao.list("from Package where packageName = '"+packageName+"'");
        String allRoads = packages.get(0).getRoads();
        allRoads +=","+lineName;
        packages.get(0).setRoads(allRoads);
        packageDao.update(packages);
        return "success";
    }

    public void saveVehicleLine(Line line,String pointString){
        String []pointList=pointString.split(";");
        if(pointList!=null){
            for(String point:pointList){
                String []points=point.split(",");
                VehicleLine vehicleLine=new VehicleLine();
                vehicleLine.setLng(Long.parseLong(points[0]));
                vehicleLine.setLat(Long.parseLong(points[1]));
                vehicleLine.setLine(line);
                baseDao.save(vehicleLine);
            }
        }
    }
    @RequestMapping(value = "/line/edit",method = RequestMethod.POST)
    @ResponseBody
    public String edit(HttpServletRequest request,String pointString,@RequestParam(value = "id")String id,@RequestParam(value = "realDistance")String realDistance,@RequestParam(value = "company")String company,@RequestParam(value = "lineName")String lineName,@RequestParam(value = "packageName")String packageName,@RequestParam(value = "packageId")Long packageId,@RequestParam(value = "startCoord")String startCoord,@RequestParam(value = "coords")String coords,@RequestParam(value = "endCoord")String endCoord,
                      @RequestParam(value = "direction")String direction,@RequestParam(value = "directionType")String directionType/*@RequestParam(value = "inputId")String inputId,*//*@RequestParam(value = "remark")String remark*/){

        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        Line line=lineDao.getById(Long.parseLong(id));
           if(lineDao.isDuplicated(line,lineName))
            return "duplicated";
        if(realDistance.equals("")||realDistance!=null)
            line.setRealDistance(realDistance);
        String roads = line.getLine();
        if(!roads.equals(lineName)){
            List<Package> packages = packageDao.list("from Package where packageName = '"+packageName+"'");
            String allRoads = packages.get(0).getRoads();
            String[] road;
            road=allRoads.split(",");
            allRoads="";
            for(int i=0;i<road.length;i++){
                if(!road[i].equals(roads))
                    allRoads+=road[i]+",";
                else
                    allRoads+=lineName+",";
            }
            allRoads=allRoads.substring(0,allRoads.length()-1);
            packages.get(0).setRoads(allRoads);
            packageDao.update(packages);
        }
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
       /* line.setInputId(Long.parseLong(inputId));
        Account account =userDao.getById(Long.parseLong(inputId));
        line.setInputMan(account.getUsername());*/
        /*line.setRemark(remark);*/
        lineDao.update(line);
        List<VehicleLine>deleteList=lineDao.findAll("from VehicleLine as v where v.line=?",VehicleLine.class,new Object[]{line});
        for(VehicleLine vehicleLine:deleteList){
            lineDao.delete(vehicleLine);
        }
        saveVehicleLine(line,pointString);
        return "success";
    }
    @RequestMapping(value = "/line/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")String id){
        Line line=lineDao.getById(Long.parseLong(id));
        List<RFID>rfidList=rfidDao.getListByRoad(line.getLine());
        if(rfidList!=null&&rfidList.size()>0)
            return "fail";
        List<VehicleLine>vehicleLineList=lineDao.findAll("from VehicleLine as v where v.line=?",VehicleLine.class,new Object[]{line});
        for(VehicleLine vehicleLine:vehicleLineList){
            lineDao.delete(vehicleLine);
        }
        List<MaintainLog>maintainLogs=baseDao.findAll("from MaintainLog where road=?",MaintainLog.class,new Object[]{line.getLine()});
        if(maintainLogs!=null) {
            for (MaintainLog maintainLog : maintainLogs) {
                maintainLog.setIsDelete(1);
                baseDao.update(maintainLog);
            }
        }
        List<Mileage>mileageList=mileageDao.getByLine(line);
        for(Mileage mileage:mileageList){
            mileageDao.delete(mileage);
        }
       try{
           String roads = line.getLine();
           String packageName = line.getPackgeName();
           List<Package> packages = packageDao.list("from Package where packageName = '"+packageName+"'");
           String allRoads = packages.get(0).getRoads();
           String[] road;
           road=allRoads.split(",");
           allRoads="";
           for(int i=0;i<road.length;i++){
               if(!road[i].equals(roads))
                   allRoads+=road[i]+",";
               if(allRoads.equals(""))
                   allRoads+=",";
           }
           allRoads=allRoads.substring(0,allRoads.length()-1);
           packages.get(0).setRoads(allRoads);
           packageDao.update(packages);
       }catch (Exception e){
           System.out.print("Error!");
       }
        lineDao.delete(line);
        return "success";
    }
    @RequestMapping(value = "/line/deleteByCoords",method = RequestMethod.POST)
    @ResponseBody
    public String deleteByCoords(@RequestParam(value = "startCoord")String startCoord,@RequestParam(value = "endCoord")String endCoord){
        Line line=lineDao.getByCoords(startCoord,endCoord);
        String roads = line.getLine();
        String packageName = line.getPackgeName();
        List<Package> packages = packageDao.list("from Package where packageName = '"+packageName+"'");
        String allRoads = packages.get(0).getRoads();
        String[] road;
        road=allRoads.split(",");
        allRoads="";
        for(int i=0;i<road.length;i++){
            if(!road[i].equals(roads))
                allRoads+=road[i]+",";
            if(allRoads.equals(""))
                allRoads+=",";
        }
        allRoads=allRoads.substring(0,allRoads.length()-1);
        packages.get(0).setRoads(allRoads);
        packageDao.update(packages);
        lineDao.delete(line);
        return "success";
    }

    @RequestMapping(value = "/line/list",method = RequestMethod.GET)
    @ResponseBody
    public String list(){
       List<Line> lineList=lineDao.getList();
        return JSONArray.fromObject(lineList).toString();
    }

    @RequestMapping(value = "/line/get",method = RequestMethod.GET)
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
    @RequestMapping(value = "/line/getByName",method = RequestMethod.GET)
    @ResponseBody
    public String getByName(@RequestParam(value = "lineName")String lineName){
        List<Line> lineList=lineDao.getByName(lineName);
        return JSONArray.fromObject(lineList).toString();
    }
    @RequestMapping(value = "/line/getByCoords",method = RequestMethod.GET)
    @ResponseBody
    public String getByCoords(@RequestParam(value = "startCoord")String startCoord,@RequestParam(value = "endCoord")String endCoord){
        Line line=lineDao.getByCoords(startCoord,endCoord);
        return JSONObject.fromObject(line).toString();
    }
    //通过包件id获取作业线路
    @RequestMapping(value = "/line/getByPackage",method = RequestMethod.GET)
    @ResponseBody
    public String getByCoords(@RequestParam(value = "packageId")Long packageId){
        List<Line> lineList=lineDao.getListByPackage(packageId);
        return JSONArray.fromObject(lineList).toString();
    }
}
