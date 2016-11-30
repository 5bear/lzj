package com.springapp.mvc;

import com.springapp.entity.Line;
import com.springapp.entity.RFID;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/4/4.
 *RFID增删改查
 */
@Controller
@RequestMapping(value = "/RFID")
public class RFIDController extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("base3");
        String company= (String) session.getAttribute("company");
        if(company.equals("养护中心")){
            List<Line>lineList=lineDao.getList();
            modelAndView.addObject("lineList",lineList);
            List<Line>cjList= lineDao.getListByCompany("上海成基市政建设发展有限公司");
            modelAndView.addObject("cjList",cjList);
            List<Line>gjyhList= lineDao.getListByCompany("上海高架养护管理有限公司");
            modelAndView.addObject("gjygList",gjyhList);
        }else if(company.equals("上海高架养护管理有限公司")){
            List<Line>lineList=lineDao.getListByCompany("上海高架养护管理有限公司");
            modelAndView.addObject("lineList",lineList);
            List<Line>gjyhList= lineDao.getListByCompany("上海高架养护管理有限公司");
            modelAndView.addObject("gjygList",gjyhList);
        }else{
            List<Line>lineList=lineDao.getListByCompany("上海成基市政建设发展有限公司");
            modelAndView.addObject("lineList",lineList);
            List<Line>cjList= lineDao.getListByCompany("上海成基市政建设发展有限公司");
            modelAndView.addObject("cjList",cjList);
        }
        return modelAndView;
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestParam(value = "equipNum") String equipNum, @RequestParam(value = "lng") Double lng, @RequestParam(value = "lat") Double lat, @RequestParam(value = "serialNumber") String serialNumber,
                      @RequestParam(value = "roadId") String roadId, @RequestParam(value = "zhadao") String zhadao, @RequestParam(value = "direction") String direction, @RequestParam(value = "installPos") String installPos
                      /*@RequestParam(value = "installPos2") String installPos2*/) {
        RFID rfid = new RFID();
        if(rfidDao.isDuplicated(null,serialNumber))
            return "duplicated";
        rfid.setEquipNum(equipNum);
        rfid.setLng(lng);
        rfid.setLat(lat);
        rfid.setSerialNumber(serialNumber);
        Line line=lineDao.getById(Long.parseLong(roadId));
        rfid.setRoad(line.getLine());
        rfid.setRoadId(Long.parseLong(roadId));
        rfid.setCompany(line.getCompany());
        rfid.setZhadao(zhadao);
        rfid.setDirection(direction);
        rfid.setInstallPos(installPos);
        rfid.setCreateTime(simpleDateFormat.format(new Date()));
        rfidDao.save(rfid);
        return "success";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public String edit(@RequestParam(value = "id") String id, @RequestParam(value = "equipNum") String equipNum, @RequestParam(value = "lng") Double lng, @RequestParam(value = "lat") Double lat, @RequestParam(value = "serialNumber") String serialNumber, @RequestParam(value = "roadId") String roadId, @RequestParam(value = "zhadao") String zhadao, @RequestParam(value = "direction") String direction, @RequestParam(value = "installPos") String installPos
                      /* @RequestParam(value = "installPos2") String installPos2*/) {
        RFID rfid = rfidDao.getById(Long.parseLong(id));
        if(rfidDao.isDuplicated(rfid,serialNumber))
            return "duplicated";
        rfid.setEquipNum(equipNum);
        rfid.setLng(lng);
        rfid.setLat(lat);
        rfid.setSerialNumber(serialNumber);
        Line line=lineDao.getById(Long.parseLong(roadId));
        rfid.setRoad(line.getLine());
        rfid.setRoadId(Long.parseLong(roadId));
        rfid.setCompany(line.getCompany());
        rfid.setZhadao(zhadao);
        rfid.setDirection(direction);
        rfid.setInstallPos(installPos);
        rfid.setEditTime(simpleDateFormat.format(new Date()));
        rfidDao.update(rfid);
        return JSONObject.fromObject(rfid).toString();
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")String id){
        RFID rfid=rfidDao.getById(Long.parseLong(id));
        rfid.setIsDelete(1);
        rfid.setDeleteTime(simpleDateFormat.format(new Date()));
        rfidDao.update(rfid);
        return "success";
    }
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public String list(){
        List<RFID>rfidList=rfidDao.getList();
        return JSONArray.fromObject(rfidList).toString();
    }
    @RequestMapping(value = "/getListByRoad",method = RequestMethod.GET)
    @ResponseBody
    public String getListByRoad(@RequestParam(value = "road")String road){
        List<RFID>rfidList=rfidDao.getListByRoad(road);
        return JSONArray.fromObject(rfidList).toString();
    }

    @RequestMapping(value = "/getByNumber",method = RequestMethod.GET)
    @ResponseBody
    public String getByNumber(@RequestParam(value = "number")String number){
        RFID rfid=rfidDao.find("from RFID where isDelete=0 and serialNumber ='"+number+"'",RFID.class);
        return JSONObject.fromObject(rfid).toString();
    }
    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    public String list(@RequestParam(value = "id")String id){
        RFID rfid=rfidDao.getById(Long.parseLong(id));
        return JSONObject.fromObject(rfid).toString();
    }
}

