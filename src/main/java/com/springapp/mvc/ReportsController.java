package com.springapp.mvc;

import com.springapp.classes.model.FileService;
import com.springapp.entity.Report1;
import com.springapp.entity.Report2;
import com.springapp.entity.Report3;
import com.springapp.entity.Report4;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ZhanShaoxiong on 2016/5/4.
 */
@Controller
@RequestMapping(value = "**")
public class ReportsController extends BaseController{
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
    private static SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm");
    @RequestMapping(value = "/reports1", method = RequestMethod.GET)
    public ModelAndView report1(HttpSession session,@RequestParam(required = false) String company, @RequestParam(required = false) String date, @RequestParam(required = false) String time) throws ParseException, UnsupportedEncodingException {
        if (company == null || "".equals(company.trim())) {
            String c = String.valueOf(session.getAttribute("company"));
            if ("养护中心".equals(c)){
                company = "上海成基市政建设发展有限公司";
            }else{
                company = c;
            }

        }
        String maxDateTime = report1Dao.getMaxDateTime(company);

        if (date == null || "".equals(date.trim())) {
            if (maxDateTime!=null){
                date = sdfDate.format(sdf.parse(maxDateTime));
            }else {
                date="";
            }
        }
        if (time==null || "".equals(time.trim())){
            if (maxDateTime!=null) {
                time = sdfTime.format(sdf.parse(maxDateTime));
            }else {
                time="";
            }
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reports1");

        modelAndView.addObject("report1Datas", report1Dao.getPager(company,date,time));//获取表中所有的数据
        modelAndView.addObject("company", company);
        modelAndView.addObject("date", date);
        modelAndView.addObject("time", time);
        return modelAndView;
    }


    @RequestMapping("/download/reports1")
    public HttpServletResponse download1(HttpServletResponse resp,@RequestParam(value = "company") String company,@RequestParam(value = "date") String date,@RequestParam(required = false) String time) throws IOException {
       // company = new String(company.getBytes("ISO8859-1"),"UTF-8");
        FileService service = new FileService();
        String[] titles = new String[]{"公司","车牌号","计划待命位置","实际待命位置","到达日期","到达时间","状态"};
        String[] keys = new String[]{"company","vehicleLicense","planPosition","realPosition","arriveDate","arriveTime","state"};
        if (time==null){
            time="";
        }
        List<Report1> datas = report1Dao.getList(company,date,time);
        List<Map<String,Object>> dataList = new ArrayList<Map<String, Object>>();
        Map<String,Object> map;
        if (datas!=null){
            for (Report1 r:datas){
                map = new HashMap<String, Object>();
                map.put("company",r.getCompany());
                map.put("vehicleLicense",r.getvehicleLicense());
                map.put("planPosition",r.getPlanPosition());
                map.put("realPosition",r.getRealPosition());
                map.put("arriveDate",r.getArriveDate());
                map.put("arriveTime",r.getArriveTime());
                map.put("state",r.getState());
                dataList.add(map);
            }
        }


        String filename = "牵引车位置报表_"+date+"_"+time;

        return  service.outputExcel(resp, dataList, titles, keys, filename);
    }


    @RequestMapping(value = "/reports2",method = RequestMethod.GET)
    public ModelAndView reports2(HttpSession session,@RequestParam(required = false) String company, @RequestParam(required = false) String date, @RequestParam(required = false) String time) throws ParseException, UnsupportedEncodingException {
        if (company == null || "".equals(company.trim())) {
            String c = String.valueOf(session.getAttribute("company"));
            if ("养护中心".equals(c)){
                company = "上海成基市政建设发展有限公司";
            }else{
                company = c;
            }

        }
        String maxDateTime = report2Dao.getMaxDateTime();
        System.out.print("----"+maxDateTime);
        if (date == null || "".equals(date.trim())) {
            if (maxDateTime!=null){
                date = sdfDate.format(sdf.parse(maxDateTime));
            }else {
                date="";
            }
        }
        if (time==null || "".equals(time.trim())){
            if (maxDateTime!=null) {
                time = sdfTime.format(sdf.parse(maxDateTime));
            }else {
                time="";
            }
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reports2");

        modelAndView.addObject("report2Datas", report2Dao.getPager(company,date,time));//获取表中所有的数据
        modelAndView.addObject("company", company);
        modelAndView.addObject("date", date);
        modelAndView.addObject("time", time);
        return modelAndView;
    }
    @RequestMapping("/download/reports2")
    public HttpServletResponse download2(HttpServletResponse resp,@RequestParam(value = "company") String company,@RequestParam(value = "date") String date,@RequestParam(required = false) String time) throws IOException {
        //company = new String(company.getBytes("ISO8859-1"),"UTF-8");
        FileService service = new FileService();
        String[] titles = new String[]{"公司","作业车辆","车辆类型","匝道名称","作业日期","作业时间"};
        String[] keys = new String[]{"company","vehicleLicense","vehicleType","rampName","workDate","workTime"};
        if (time==null){
            time="";
        }
       /* if (endTime==null){
            endTime="";
        }*/
        List<Report2> datas = report2Dao.getList(company,date,time);
        List<Map<String,Object>> dataList = new ArrayList<Map<String, Object>>();
        Map<String,Object> map;
        if (datas!=null){
            for (Report2 r:datas){
                map = new HashMap<String, Object>();
                map.put("company",r.getCompany());
                map.put("vehicleLicense",r.getvehicleLicense());
                map.put("vehicleType",r.getVehicleType());
                map.put("rampName",r.getRampName());
                map.put("workDate",r.getWorkDate());
                map.put("workTime",r.getWorkTime());
                /*map.put("remark",r.getRemark());*/
                dataList.add(map);
            }
        }


        String filename = "养护车辆作业区域报表_"+date+"_"+time;
       /* if (!"".equals(startTime.trim())){
            filename += "_从"+startTime;
        }
        if (!"".equals(endTime.trim())){
            filename += "_到"+endTime;
        }*/
        return  service.outputExcel(resp, dataList, titles, keys, filename);
    }



    @RequestMapping(value = "/reports3",method = RequestMethod.GET)
    public ModelAndView reports3(HttpSession session,@RequestParam(required = false) String company, @RequestParam(required = false) String date, @RequestParam(required = false) String startTime, @RequestParam(required = false) String endTime) throws ParseException, UnsupportedEncodingException {

        if (company == null || "".equals(company.trim())) {
            String c = String.valueOf(session.getAttribute("company"));
            if ("养护中心".equals(c)){
                company = "上海成基市政建设发展有限公司";
            }else{
                company = c;
            }

        }
        //String maxDateTime = report3Dao.getMaxDateTime();
        if (date == null || "".equals(date.trim())) {
           /* if (maxDateTime!=null){
                date = sdfDate.format(sdf.parse(maxDateTime));
            }else {
                date="";
            }*/
            date = sdfDate.format(new Date());
        }
        if (endTime==null || "".equals(endTime.trim())){
           /* if (maxDateTime!=null) {
                endTime = sdfTime.format(sdf.parse(maxDateTime));
            }else {
                endTime="";
            }*/
            endTime = "23:59";
        }
        if (startTime==null || "".equals(startTime.trim())){
           /* if (maxDateTime!=null){
                String start = report3Dao.getStartTime(date);
                startTime = sdfTime.format(sdf.parse(start));
            }else{
                startTime="";
            }*/
            startTime = "00:00";
        }

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reports3");

        modelAndView.addObject("report3Datas", report3Dao.getPager(company,date,startTime,endTime));//获取表中所有的数据
        modelAndView.addObject("company", company);
        modelAndView.addObject("date", date);
        modelAndView.addObject("startTime", startTime);
        modelAndView.addObject("endTime", endTime);
        return modelAndView;
    }
    @RequestMapping("/download/reports3")
    public HttpServletResponse download3(HttpServletResponse resp,@RequestParam(value = "company") String company,@RequestParam(value = "date") String date,@RequestParam(required = false) String startTime,@RequestParam(required = false) String endTime) throws IOException {
        //company = new String(company.getBytes("ISO8859-1"),"UTF-8");
        FileService service = new FileService();
        String[] titles = new String[]{"公司","作业车辆","车辆类型","实际作业区域","作业日期","作业起始时间","作业结束时间","累计停留时间（分钟）","累计作业时间（分钟）","里程（千米）","备注"};
        String[] keys = new String[]{"company","vehicleLicense","vehicleType","workArea","workDate","startTime","endTime","remainTime","workTime","mile","remark"};

        if(date==null || "".equals(date)){
            date = sdfDate.format(new Date());
        }
        if (startTime==null|| "".equals(startTime.trim())){
            startTime="00:00";
        }
        if (endTime==null|| "".equals(endTime.trim())){
            endTime="23:59";
        }
        List<Report3> datas = report3Dao.getList(company,date,startTime,endTime);
        List<Map<String,Object>> dataList = new ArrayList<Map<String, Object>>();
        Map<String,Object> map;
        if (datas!=null){
            for (Report3 r:datas){
                map = new HashMap<String, Object>();
                map.put("company",r.getCompany());
                map.put("vehicleLicense",r.getvehicleLicense());
                map.put("vehicleType",r.getVehicleType());
                map.put("workArea",r.getWorkArea());
                map.put("workDate",r.getWorkDate());
                map.put("startTime",r.getStartTime());
                map.put("endTime",r.getEndTime());
                map.put("remainTime",String.valueOf(r.getRemainTime()));
                map.put("workTime",String.valueOf(r.getWorkTime()));
                int mile = r.getMile();
                double m = (double) mile/1000.00;
                BigDecimal b   =   new   BigDecimal(m);
                m   =   b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                map.put("mile",String.valueOf(m));
                map.put("remark",r.getRemark());
                dataList.add(map);
            }
        }


        String filename = "养护车辆作业情况报表_"+date+"_从"+startTime+"_到"+endTime;
      /*  if (!"".equals(startTime.trim())){
            filename += "_从"+startTime;
        }
        if (!"".equals(endTime.trim())){
            filename += "_到"+endTime;
        }*/
        return  service.outputExcel(resp, dataList, titles, keys, filename);
    }



    @RequestMapping(value = "/reports4",method = RequestMethod.GET)
    public ModelAndView reports4(HttpSession session,@RequestParam(required = false) String company, @RequestParam(required = false) String date, @RequestParam(required = false) String startTime, @RequestParam(required = false) String endTime) throws ParseException, UnsupportedEncodingException {
        if (company == null || "".equals(company.trim())) {
            String c = String.valueOf(session.getAttribute("company"));
            if ("养护中心".equals(c)){
                company = "上海成基市政建设发展有限公司";
            }else{
                company = c;
            }

        }
       // String maxDateTime = report4Dao.getMaxDateTime();
        if (date == null || "".equals(date.trim())) {
           /* if (maxDateTime!=null){
                date = sdfDate.format(sdf.parse(maxDateTime));
            }else {
                date="";
            }*/
            date = sdfDate.format(new Date());
        }
        if (endTime==null || "".equals(endTime.trim())){
           /* if (maxDateTime!=null) {
                endTime = sdfTime.format(sdf.parse(maxDateTime));
            }else {
                endTime="";
            }*/
            endTime="23:59";
        }
        if (startTime==null || "".equals(startTime.trim())){
           /* if (maxDateTime!=null){
                String start = report4Dao.getStartTime(date);
                startTime = sdfTime.format(sdf.parse(start));
            }else{
                startTime="";
            }*/
            startTime="00:00";
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reports4");

        modelAndView.addObject("report4Datas", report4Dao.getPager(company,date,startTime,endTime));//获取表中所有的数据
        modelAndView.addObject("company", company);
        modelAndView.addObject("date", date);
        modelAndView.addObject("startTime", startTime);
        modelAndView.addObject("endTime", endTime);
        return modelAndView;
    }
    @RequestMapping("/download/reports4")
    public HttpServletResponse download4(HttpServletResponse resp,@RequestParam(value = "company") String company,@RequestParam(value = "date") String date,@RequestParam(required = false) String startTime,@RequestParam(required = false) String endTime) throws IOException {
       // company = new String(company.getBytes("ISO8859-1"),"UTF-8");
        FileService service = new FileService();
        String[] titles = new String[]{"公司","作业车辆","车辆类型","车辆使用人","超速日期","起始时间","结束时间","超速时间（分）","超速里程（米）","最大速度","最小速度","原因","反馈"};
        String[] keys = new String[]{"company","vehicleLicense","vehicleType","vehicleUser","eventDate","startTime","endTime","overspeedTime","overspeedMile","maxSpeed","minSpeed","reason","feedback"};
        if (date == null || "".equals(date.trim())) {
            date = sdfDate.format(new Date());
        }
        if (endTime==null || "".equals(endTime.trim())){
            endTime="23:59";
        }
        if (startTime==null || "".equals(startTime.trim())){
            startTime="00:00";
        }
        List<Report4> datas = report4Dao.getList(company,date,startTime,endTime);
        List<Map<String,Object>> dataList = new ArrayList<Map<String, Object>>();
        Map<String,Object> map;
        if (datas!=null){
            for (Report4 r:datas){
                map = new HashMap<String, Object>();
                map.put("company",r.getCompany());
                map.put("vehicleLicense",r.getvehicleLicense());
                map.put("vehicleType",r.getVehicleType());
                map.put("vehicleUser",r.getVehicleUser());
                map.put("eventDate",r.getEventDate());
                map.put("startTime",r.getStartTime());
                map.put("endTime",r.getEndTime());
                map.put("overspeedTime",String.valueOf(r.getOverspeedTime()));
                int mile = r.getOverspeedMile();
                double m = (double) mile/1000.00;
                BigDecimal b   =   new   BigDecimal(m);
                m   =   b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                map.put("overspeedMile",String.valueOf(m));
                map.put("maxSpeed",String.valueOf(r.getMaxSpeed()));
                map.put("minSpeed",String.valueOf(r.getMinSpeed()));
                map.put("reason",r.getReason());
                map.put("feedback",r.getFeedback());
                dataList.add(map);
            }
        }


        String filename = "养护车辆超速报表_"+date+"_从"+startTime+"_到"+endTime;

        return  service.outputExcel(resp, dataList, titles, keys, filename);
    }

}
