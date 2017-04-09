package com.springapp.mvc;

import com.springapp.classes.BaiduMap;
import com.springapp.entity.*;
import com.springapp.entity.Package;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.*;

/**
 * Created by as on 2016/4/18.
 */


//////////////////////////////////////////////////数据库存储RFIDcount时判断start，end


    @Controller
    @RequestMapping(value = "**")
    public class ProgressController extends BaseController {
    @RequestMapping(value="/Progress1",method = RequestMethod.GET)
    public ModelAndView home(ModelAndView modelAndView,HttpServletRequest request){
        List<Package> chengjiCompanyList=packageDao.list("from Package where company='上海成基市政建设发展有限公司' and isDelete=0");
        List<Package> gaojiaCompanyList=packageDao.list("from Package where company='上海高架养护管理有限公司' and isDelete=0");
        modelAndView.addObject("chengjiCompany", chengjiCompanyList);
        modelAndView.addObject("gaojiaCompany", gaojiaCompanyList);
        String year=request.getParameter("year");
        modelAndView.addObject("year",year);
        String month=request.getParameter("month");
        modelAndView.addObject("month",month);
        String company=request.getParameter("company");
//        try {
//            company = new String(company.getBytes("iso-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        modelAndView.addObject("company",company);
        String packageName=request.getParameter("packageName");
//        try {
//            packageName = new String(packageName.getBytes("iso-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        modelAndView.addObject("packageName",packageName);
        String Roads=request.getParameter("Roads");
//        try {
//            Roads = new String(Roads.getBytes("iso-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        modelAndView.addObject("Roads",Roads);
        modelAndView.setViewName("Progress1");
        return modelAndView;
    }
    @RequestMapping(value="/progress1-year",method = RequestMethod.GET)
    public ModelAndView homeyear(ModelAndView modelAndView,HttpServletRequest request){
        List<Package> chengjiCompanyList=packageDao.list("from Package where company='上海成基市政建设发展有限公司' and isDelete=0");
        List<Package> gaojiaCompanyList=packageDao.list("from Package where company='上海高架养护管理有限公司' and isDelete=0");
        modelAndView.addObject("chengjiCompany", chengjiCompanyList);
        modelAndView.addObject("gaojiaCompany", gaojiaCompanyList);
        modelAndView.setViewName("progress1-year");
        return modelAndView;
    }
    @RequestMapping(value="/progress1-year1",method = RequestMethod.GET)
    public ModelAndView homeyear1(ModelAndView modelAndView,HttpServletRequest request){
        List<Package> chengjiCompanyList=packageDao.list("from Package where company='上海成基市政建设发展有限公司' and isDelete=0");
        List<Package> gaojiaCompanyList=packageDao.list("from Package where company='上海高架养护管理有限公司' and isDelete=0");
        modelAndView.addObject("chengjiCompany", chengjiCompanyList);
        modelAndView.addObject("gaojiaCompany", gaojiaCompanyList);
        String company=request.getParameter("company");
//        try {
//            company = new String(company.getBytes("iso-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        modelAndView.addObject("company",company);
        String packageName=request.getParameter("packageName");
//        try {
//            packageName = new String(packageName.getBytes("iso-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        modelAndView.addObject("packageName",packageName);
        String Roads=request.getParameter("Roads");
//        try {
//            Roads = new String(Roads.getBytes("iso-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        modelAndView.addObject("Roads",Roads);
        String year=request.getParameter("year");
        modelAndView.addObject("year",year);
        modelAndView.setViewName("progress1-year");
        return modelAndView;
    }
    @RequestMapping(value="/progress1-day",method = RequestMethod.GET)
    public ModelAndView homeday(ModelAndView modelAndView,HttpServletRequest request){
        List<Package> chengjiCompanyList=packageDao.list("from Package where company='上海成基市政建设发展有限公司' and isDelete=0");
        List<Package> gaojiaCompanyList=packageDao.list("from Package where company='上海高架养护管理有限公司' and isDelete=0");
        modelAndView.addObject("chengjiCompany", chengjiCompanyList);
        modelAndView.addObject("gaojiaCompany", gaojiaCompanyList);
        String year=request.getParameter("year");
        modelAndView.addObject("year",year);
        String month=request.getParameter("month");
        modelAndView.addObject("month",month);
        String day=request.getParameter("day");
        modelAndView.addObject("day",day);
        String company=request.getParameter("company");
//        try {
//            company = new String(company.getBytes("iso-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        modelAndView.addObject("company",company);
        String packageName=request.getParameter("packageName");
//        try {
//            packageName = new String(packageName.getBytes("iso-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        modelAndView.addObject("packageName",packageName);
        String Roads=request.getParameter("Roads");
//        try {
//            Roads = new String(Roads.getBytes("iso-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        modelAndView.addObject("Roads",Roads);
        modelAndView.setViewName("progress1-day");
        return modelAndView;
    }


    @RequestMapping(value="/progress1-year/getMonthByYear",method = RequestMethod.GET)
    @ResponseBody
    public String getMonthByYear(@RequestParam(value = "year") String year,@RequestParam(value = "Roads") ArrayList<String> roads){
        HashSet hSet  =   new HashSet(roads);
        roads.clear();
        roads.addAll(hSet);
        String Roads="lineName='"+roads.get(0)+"' ";
        for(int i=1;i<roads.size()-1;i++){
            Roads+="or lineName='"+roads.get(i)+"' ";
        }
        if(roads.size()>1) {
            Roads += "or lineName='" + roads.get(roads.size() - 1) + "'";
        }
        Double ValidDistance=0.0;
        ArrayList<Double> Distance= new ArrayList<Double>();
        for(double i= 0;i<12;i++){
            Distance.add(0.0);
        }
        ArrayList<Double> Coverage= new ArrayList<Double>();
        for(double i= 0;i<12;i++){
            Coverage.add(0.0);
        }
        Double realDistance = 0.0;
        int totaldays=0;
        double totalValidDistance=0.0;
        double totalRealDistance=0.0;
        double totalCount=0.0;
        double totalRealCount=0.0;
        String m="from Mileage where ("+Roads+") and mydate like '%"+year+"%'order by mydate";
        List<Mileage> validDistance = mileageDao.findAll(m);
        if(validDistance.size()!=0) {
            List<Mileage> mileages = new ArrayList<Mileage>();
            for (Mileage distance : validDistance) {
                Mileage s = new Mileage();
                s.setMydate(distance.getMydate());
                s.setValidDistance(distance.getValidDistance());
                s.setCount(distance.getCount());
                s.setRealcount(distance.getRealcount());
                s.setCoverage(distance.getCoverage());
                mileages.add(s);
            }

            if ((Integer.parseInt(year) % 4 == 0 && Integer.parseInt(year) % 100 != 0) || Integer.parseInt(year) % 400 == 0)
                totaldays = 366;
            else
                totaldays = 365;
            String Roads1 = "line='" + roads.get(0) + "' ";
            for (int i = 1; i < roads.size() - 1; i++) {
                Roads1 += "or line='" + roads.get(i) + "' ";
            }
            if (roads.size() > 1) {
                Roads1 += "or line='" + roads.get(roads.size() - 1) + "'";
            }
            String m1="from Line where (" + Roads1 + ")and isDelete=0";
            List<Line> Linename = lineDao.findAll(m1);
            for (Line a : Linename) {
                int time = 0;
                List<Package> packageList = packageDao.list("from Package where isDelete='0' and roads like '%" + a.getLine() + "%'and runtime like '" + year + "%'");
                if(packageList.size()!=0) {
                    BigDecimal b1 = new BigDecimal(packageList.get(0).getTime());
                    BigDecimal b2 = new BigDecimal(totaldays);
                    time = b1.divide(b2, 0, BigDecimal.ROUND_HALF_UP).intValue();
                    //四舍五入取整数转int
                    if (packageList.get(0).getTime() > 0 && time == 0)
                        time = 1;
                }
                realDistance += Double.parseDouble(a.getRealDistance()) * time;
            }
            DecimalFormat df = new DecimalFormat("######0.00");
            int d = 1;//每个月扫了几天
            int f = 1;
            if (mileages.size() != 0) {
                String Month = mileages.get(0).getMydate().substring(5, 7);
                String Day = mileages.get(0).getMydate().substring(8, 10);
                Double count = 0.0;
                Double realCount = 0.0;
                for (int i = 0; i < mileages.size(); i++) {
                    if (Month.equals(mileages.get(i).getMydate().substring(5, 7))) {
                        if (!Day.equals(mileages.get(i).getMydate().substring(8, 10))) {
                            d ++;
                            f++;
                            Day = mileages.get(i).getMydate().substring(8, 10);
                        }
                        ValidDistance += mileages.get(i).getValidDistance();
                        count += mileages.get(i).getCount();
                        realCount += mileages.get(i).getRealcount();
                        int a = Integer.parseInt(mileages.get(i).getMydate().substring(5, 7)) - 1;
                        if(realDistance!=0 || d !=0)
                            Distance.set(a, Double.parseDouble(df.format(ValidDistance / (realDistance * d) * 100)));
                        else
                            Distance.set(a,0.0);
                        if(count==0)
                            Coverage.set(a, 0.0);
                        else
                            Coverage.set(a, Double.parseDouble(df.format(realCount / count * 100)));
                        totalValidDistance+=mileages.get(i).getValidDistance();
                        totalRealDistance = realDistance * f;
                        totalCount+=mileages.get(i).getCount();
                        totalRealCount+= mileages.get(i).getRealcount();
                    } else {
                        d = 1;
                        ValidDistance = 0.0;
                        Month = mileages.get(i).getMydate().substring(5, 7);
                        Day = mileages.get(i).getMydate().substring(8, 10);
                        count = 0.0;
                        realCount = 0.0;

                        i--;
                    }
                }
                System.out.print(d);
            }
        }

        Distance.addAll(Coverage);
        Distance.add(totalValidDistance/totalRealDistance*100);
        if(totalCount==0)
            Distance.add(0.0);
        else
            Distance.add(totalRealCount/totalCount*100);

        return JSONArray.fromObject(Distance).toString();
    }
    @RequestMapping(value="/progress1/getDayByMonth",method = RequestMethod.GET)
    @ResponseBody
    public String getDayByMonth(@RequestParam(value = "year") String year,@RequestParam(value="month")String month,@RequestParam(value = "Roads") ArrayList<String> roads){
        HashSet hSet  =   new HashSet(roads);
        roads.clear();
        roads.addAll(hSet);
        String Roads="lineName='"+roads.get(0)+"' ";
        for(int i=1;i<roads.size()-1;i++){
            Roads+="or lineName='"+roads.get(i)+"' ";
        }
        if(roads.size()>1) {
            Roads += "or lineName='" + roads.get(roads.size() - 1) + "'";
        }
        Double ValidDistance=0.0;
        Double realDistance = 0.0;
        int totaldays = 0;
        int days=0;
        double totalValidDistance=0.0;
        double totalRealDistance=0.0;
        double totalCount=0.0;
        double totalRealCount=0.0;
        if(month.equals("02")) {
            if ((Integer.parseInt(year) % 4 == 0 && Integer.parseInt(year) % 100 != 0) || Integer.parseInt(year) % 400 == 0)
                days = 29;
            else
                days = 28;
        }
        else if(month.equals("01")||month.equals("03")||month.equals("05")||month.equals("07")||month.equals("08")||month.equals("10")||month.equals("12"))
            days=31;
        else
            days=30;
        ArrayList<Double> Distance= new ArrayList<Double>();
        for(double i= 0;i<days;i++){
            Distance.add(0.0);
        }
        ArrayList<Double> Coverage= new ArrayList<Double>();
        for(double i= 0;i<days;i++){
            Coverage.add(0.0);
        }
        String m="from Mileage where ("+Roads+") and mydate like '"+year+"-"+month+"%'order by mydate";
        List<Mileage> validDistance = mileageDao.findAll(m);
        if(validDistance.size()!=0) {
        List<Mileage> mileages = new ArrayList<Mileage>();
            for (Mileage distance : validDistance) {
                Mileage s = new Mileage();
                s.setMydate(distance.getMydate());
                s.setValidDistance(distance.getValidDistance());
                s.setCount(distance.getCount());
                s.setRealcount(distance.getRealcount());
                s.setCoverage(distance.getCoverage());
                mileages.add(s);
            }

            if ((Integer.parseInt(year) % 4 == 0 && Integer.parseInt(year) % 100 != 0) || Integer.parseInt(year) % 400 == 0)
                totaldays = 366;
            else
                totaldays = 365;
            String Roads1 = "line='" + roads.get(0) + "' ";
            for (int i = 1; i < roads.size() - 1; i++) {
                Roads1 += "or line='" + roads.get(i) + "' ";
            }
            if (roads.size() > 1) {
                Roads1 += "or line='" + roads.get(roads.size() - 1) + "'";
            }
            String m1="from Line where (" + Roads1 + ")and isDelete=0";
            List<Line> Linename = lineDao.findAll(m1);
            for (Line a : Linename) {
                int time = 0;
                List<Package> packageList = packageDao.list("from Package where isDelete='0' and roads like '%" + a.getLine() + "%'and runtime like '" + year + "%'");
                if(packageList.size()!=0) {
                    BigDecimal b1 = new BigDecimal(packageList.get(0).getTime());
                    BigDecimal b2 = new BigDecimal(totaldays);
                    time = b1.divide(b2, 0, BigDecimal.ROUND_HALF_UP).intValue();
                    //四舍五入取整数转int
                    if (packageList.get(0).getTime() > 0 && time == 0)
                        time = 1;
                }
                realDistance += Double.parseDouble(a.getRealDistance()) * time;
            }
            DecimalFormat df = new DecimalFormat("######0.00");

            String Day = mileages.get(0).getMydate().substring(8, 10);
            Double count = 0.0;
            Double realCount = 0.0;
            int d = 1;
            for (int i = 0; i < mileages.size(); i++) {
                if (Day.equals(mileages.get(i).getMydate().substring(8, 10))) {
                    ValidDistance += mileages.get(i).getValidDistance();
                    count += mileages.get(i).getCount();
                    realCount += mileages.get(i).getRealcount();
                    int a = Integer.parseInt(mileages.get(i).getMydate().substring(8, 10)) - 1;
                    if(realDistance==0)
                        Distance.set(a, 0.0);
                    else
                        Distance.set(a, Double.parseDouble(df.format(ValidDistance / (realDistance) * 100)));
                    if(count==0)
                        Coverage.set(a, 0.0);
                    else
                        Coverage.set(a, Double.parseDouble(df.format(realCount / count * 100)));
                    totalValidDistance+=mileages.get(i).getValidDistance();
                    totalRealDistance= realDistance*d;
                    totalCount+=mileages.get(i).getCount();
                    totalRealCount+= mileages.get(i).getRealcount();
                } else {
                    d++;
                    ValidDistance = 0.0;
                    Day = mileages.get(i).getMydate().substring(8, 10);
                    count = 0.0;
                    realCount = 0.0;
                    i--;
                }
            }
        }
        Roads = roads.get(0);
        for (int i = 1; i < roads.size() - 1; i++) {
            Roads += roads.get(i);
        }
        if (roads.size() > 1) {
            Roads += roads.get(roads.size() - 1);
        }
        String str = "from Remark where DateTime like '"+year+"-"+month+"%'";
        List<Remark> remarkList = remarkDao.findAll(str,Remark.class);
        if(remarkList.size()!=0) {
            for (Remark x : remarkList) {
                if (x.getLine().equals(Roads)) {
                    int day = Integer.parseInt(x.getDateTime().substring(x.getDateTime().length()-2,x.getDateTime().length()));
                    Distance.set(day-1,Double.parseDouble(x.getTheoryDistance()));
                    Coverage.set(day-1,Double.parseDouble(x.getTheoryCorvage()));
                }
            }
        }
         Distance.addAll(Coverage);
        Distance.add(totalValidDistance/totalRealDistance*100);
        if(totalCount==0)
            Distance.add(0.0);
        else
            Distance.add(totalRealCount/totalCount*100);
        return JSONArray.fromObject(Distance).toString();
    }

    @RequestMapping(value="/progress1-day/getDay",method = RequestMethod.GET)
    @ResponseBody
    public String getDay(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month,@RequestParam(value = "day") String day,@RequestParam(value = "Roads") ArrayList<String> roads){
        ArrayList<Double> Distance=null;
        try {
            HashSet hSet = new HashSet(roads);
            roads.clear();
            roads.addAll(hSet);
            hSet = null;
            String Roads = "lineName='" + roads.get(0) + "' ";
            for (int i = 1; i < roads.size() - 1; i++) {
                Roads += "OR lineName='" + roads.get(i) + "' ";
            }
            if (roads.size() > 1) {
                Roads += "OR lineName='" + roads.get(roads.size() - 1) + "'";
            }
            Double ValidDistance = 0.0;
            Distance = new ArrayList<Double>();
            for (int a = 0; a < 2; a++) {
                Distance.add(0.0);
            }
            ArrayList<Double> Coverage = new ArrayList<Double>();
            for (int a = 0; a < 3; a++) {
                Coverage.add(0.0);
            }
            Double realDistance = 0.0;
            int totaldays = 0;
            String m = "from Mileage where  mydate like '%" + year + "-" + month + "-" + day + "%' and (" + Roads + ") order by mydate";
            List<Mileage> validDistance = mileageDao.findAll(m);
            if (validDistance.size() != 0) {
                List<Mileage> mileages = new ArrayList<Mileage>();
                for (Mileage distance : validDistance) {
                    Mileage s = new Mileage();
                    s.setMydate(distance.getMydate());
                    s.setValidDistance(distance.getValidDistance());
                    s.setCount(distance.getCount());
                    s.setRealcount(distance.getRealcount());
                    s.setCoverage(distance.getCoverage());
                    mileages.add(s);
                }

                if ((Integer.parseInt(year) % 4 == 0 && Integer.parseInt(year) % 100 != 0) || Integer.parseInt(year) % 400 == 0)
                    totaldays = 366;
                else
                    totaldays = 365;
                String Roads1 = "line='" + roads.get(0) + "' ";
                for (int i = 1; i < roads.size() - 1; i++) {
                    Roads1 += "or line='" + roads.get(i) + "' ";
                }
                if (roads.size() > 1) {
                    Roads1 += "or line='" + roads.get(roads.size() - 1) + "'";
                }
                String m1 = "from Line where (" + Roads1 + ")and isDelete=0";
                List<Line> Linename = lineDao.findAll(m1);
                for (Line a : Linename) {
                    int time = 0;
                    List<Package> packageList = packageDao.list("from Package where isDelete='0' and roads like '%" + a.getLine() + "%'and runtime like '" + year + "%'");
                    if (packageList.size() != 0) {
                        BigDecimal b1 = new BigDecimal(packageList.get(0).getTime());
                        BigDecimal b2 = new BigDecimal(totaldays);
                        time = b1.divide(b2, 0, BigDecimal.ROUND_HALF_UP).intValue();
                        //四舍五入取整数转int
                        if (packageList.get(0).getTime() > 0 && time == 0)
                            time = 1;
                        b1 = null;
                        b2 = null;
                    }
                    realDistance += Double.parseDouble(a.getRealDistance()) * time;
                }
                Linename = null;
                DecimalFormat df = new DecimalFormat("######0.00");
                Double count = 0.0;
                Double realCount = 0.0;
                for (int i = 0; i < mileages.size(); i++) {
                    ValidDistance += mileages.get(i).getValidDistance();
                    count += mileages.get(i).getCount();
                    realCount += mileages.get(i).getRealcount();
                    if (realDistance == 0)
                        Distance.set(0, 0.0);
                    else
                        Distance.set(0, Double.parseDouble(df.format(ValidDistance / (realDistance) * 100)));
                    Distance.set(1, ValidDistance);
                    if (count == 0)
                        Coverage.set(0, 0.0);
                    else
                        Coverage.set(0, Double.parseDouble(df.format(realCount / count * 100)));
                    Coverage.set(1, realCount);
                    Coverage.set(2, count);

                }
            }
            Roads = roads.get(0);
            for (int i = 1; i < roads.size() - 1; i++) {
                Roads += roads.get(i);
            }
            if (roads.size() > 1) {
                Roads += roads.get(roads.size() - 1);
            }
            String str = "from Remark where DateTime like '"+year+"-"+month+"-"+day+"'";
            List<Remark> remarkList = remarkDao.findAll(str,Remark.class);
            if(remarkList.size()!=0) {
                for (Remark x : remarkList) {
                    if (x.getLine().equals(Roads)) {
                        Distance.set(0,Double.parseDouble(x.getTheoryDistance()));
                        Coverage.set(0,Double.parseDouble(x.getTheoryCorvage()));
                    }
                }
            }
            Distance.set(1,Distance.get(0)*realDistance/100);
            Coverage.set(1,Coverage.get(0)*Coverage.get(2)/100);
            validDistance = null;
            Distance.addAll(Coverage);
            return JSONArray.fromObject(Distance).toString();
        }catch (Exception e){
            return "fail";
        }finally {
            Distance=null;
        }
    }


    @RequestMapping(value="/progress1/AllPackage",method = RequestMethod.GET)
    @ResponseBody
    public String AllPackage(@RequestParam(value = "company") String company){
        List<Line> Linename=lineDao.findAll("from Line where company= '"+company+"' and isDelete=0",Line.class);
        return JSONArray.fromObject(Linename).toString();
    }
    @RequestMapping(value="/progress1/AllCompany",method = RequestMethod.GET)
    @ResponseBody
    public String getMonthByYearAllCompany(@RequestParam(value = "company") String company){
        List<Line> LineName = new ArrayList<Line>();
        if(company.equals("养护中心"))
            LineName=lineDao.findAll("from Line where isDelete=0",Line.class);
        else if(company.equals("上海成基市政建设发展有限公司"))
            LineName=lineDao.findAll("from Line where isDelete=0 and company = '上海成基市政建设发展有限公司'",Line.class);
        else if(company.equals("上海高架养护管理有限公司"))
            LineName=lineDao.findAll("from Line where isDelete=0 and company = '上海高架养护管理有限公司'",Line.class);
        return JSONArray.fromObject(LineName).toString();
    }
    @RequestMapping(value="/progress1/setRemark",method = RequestMethod.POST)
    @ResponseBody
    public String setRemark(@RequestParam(value = "year") String year,
                            @RequestParam(value = "Roads") ArrayList<String> roads,
                            @RequestParam(value = "RealDistance") String RealDistance,
                            @RequestParam(value = "RealCorvage") String RealCorvage,
                            @RequestParam(value = "TheoryDistance") String TheoryDistance,
                            @RequestParam(value = "TheoryCorvage") String TheoryCorvage,
                            @RequestParam(value = "Company") String Company,
                            @RequestParam(value = "Remark") String Remark){
        String Roads = roads.get(0);
        for (int i = 1; i < roads.size() - 1; i++) {
            Roads += roads.get(i);
        }
        if (roads.size() > 1) {
            Roads += roads.get(roads.size() - 1);
        }
        String str = "from Remark where DateTime = '"+year+"'";
        List<Remark> remarkList = remarkDao.findAll(str,Remark.class);
        int count = 0 ;
        if(remarkList.size() == 0){
            Remark newRemark = new Remark();
            newRemark.setDateTime(year);
            newRemark.setLine(Roads);
            newRemark.setRealCorvage(RealCorvage);
            newRemark.setRealDistance(RealDistance);
            newRemark.setTheoryDistance(TheoryDistance);
            newRemark.setTheoryCorvage(TheoryCorvage);
            newRemark.setCompany(Company);
            newRemark.setRemark(Remark);
            remarkDao.save(newRemark);
        }
        else{
            for(Remark x : remarkList){
                if(x.getLine().equals(Roads)){
                    x.setDateTime(year);
                    x.setLine(Roads);
                    x.setRealCorvage(RealCorvage);
                    x.setRealDistance(RealDistance);
                    x.setTheoryDistance(TheoryDistance);
                    x.setTheoryCorvage(TheoryCorvage);
                    x.setCompany(Company);
                    x.setRemark(Remark);
                    remarkDao.update(x);
                    count++;
                    break;
                }
            }
            if(count == 0){
                Remark newRemark = new Remark();
                newRemark.setDateTime(year);
                newRemark.setLine(Roads);
                newRemark.setRealCorvage(RealCorvage);
                newRemark.setRealDistance(RealDistance);
                newRemark.setTheoryDistance(TheoryDistance);
                newRemark.setTheoryCorvage(TheoryCorvage);
                newRemark.setCompany(Company);
                newRemark.setRemark(Remark);
                remarkDao.save(newRemark);
            }
        }
        return "success";
    }
    @RequestMapping(value="/progress1/getRemark",method = RequestMethod.GET)
    @ResponseBody
    public String getReamrk(@RequestParam(value = "year") String year,
                            @RequestParam(value = "Roads") ArrayList<String> roads){
        String Roads = roads.get(0);
        for (int i = 1; i < roads.size() - 1; i++) {
            Roads += roads.get(i);
        }
        if (roads.size() > 1) {
            Roads += roads.get(roads.size() - 1);
        }
        String str = "from Remark where DateTime = '"+year+"'";
        List<Remark> remarkList = remarkDao.findAll(str,Remark.class);
        Remark newRemark = new Remark();
        int count = 0 ;
        if(remarkList.size() == 0){
            newRemark.setRealCorvage("");
            newRemark.setRealDistance("");
            newRemark.setRemark("");
        }
        else{
            for(Remark x : remarkList){
                if(x.getLine().equals(Roads)){
                    newRemark.setRealCorvage(x.getRealCorvage());
                    newRemark.setRealDistance(x.getRealDistance());
                    newRemark.setRemark(x.getRemark());
                    count++;
                    break;
                }
            }
            if(count == 0){
                newRemark.setRealCorvage("");
                newRemark.setRealDistance("");
                newRemark.setRemark("");
            }
        }

        return JSONArray.fromObject(newRemark).toString();
    }
//    @RequestMapping(value="/progress1/YearGetRfid",method = RequestMethod.POST)
//    @ResponseBody
//    public String YearGetRfid(@RequestParam(value = "year") String year,@RequestParam(value = "Roads") String[] roads){
//        String Roads="road='"+roads[0]+"'";
//        for(int i=1;i<roads.length;i++){
//            Roads+="or road='"+roads[i]+"'";
//        }
//        List<RFID> zadao=rfidDao.findAll("from RFID where isDelete = 0 and ("+Roads+") order by zhadao",RFID.class);
//        List<RFID> all = new ArrayList<RFID>();
//        for(RFID g :zadao){
//            RFID s =new RFID();
//            s.setSerialNumber(g.getSerialNumber());
//            s.setZhadao(g.getZhadao());
//            all.add(s);
//        }
//        List<String> zadao1 = new ArrayList<String>();
//        int realcount=0;
//        int count =0;
//        String m="";
//        String n="";
//        ArrayList<Integer> Coverage= new ArrayList<Integer>();
//        for(int i= 0;i<12;i++){
//            Coverage.add(0);
//        }
//        if(all.size()>0) {
//            count = 1;   //匝道数
//            zadao1.add(all.get(0).getZhadao());
//            for (int i = 0; i < all.size() - 1; i++) {
//                m = all.get(i).getZhadao();
//                n = all.get(i + 1).getZhadao();
//                if (!m.equals(n)) {
//                    zadao1.add(all.get(i + 1).getZhadao());
//                    count++;
//                }
//            }
//            String month;
//            for (int j = 1; j <= 12; j++) {
//                realcount=0;
//                if (j < 10)
//                    month = "0" + j;
//                else
//                    month = j + "";
//                List<String> AllSerialNumber=vehiclePosDao.findAll("select distinct serialNumber from VehiclePos where ArmTime like '" + year + "-" + month + "%'");
//                List<VehiclePos> SerialNumber=  new ArrayList<VehiclePos>();
//                    for (String g : AllSerialNumber) {
//                        if(g!=null) {
//                            VehiclePos h = new VehiclePos();
//                            h.setSerialNumber(g);
//                            SerialNumber.add(h);
//                        }
//                    }
//
//                ArrayList<String> zadao2 =new ArrayList<String>();
//                if(SerialNumber.size()!=0){
//                    for (int i = 0; i < SerialNumber.size(); i++) {
//                        for(int f = 0; f < all.size(); f++){
//                        if(SerialNumber.get(i).getSerialNumber()!=null && SerialNumber.get(i).getSerialNumber().equals(all.get(f).getSerialNumber())) {
//                                zadao2.add(all.get(f).getZhadao());
//                            }
//                        }
//
//                    }
//                    HashSet hSet  =   new HashSet(zadao2);
//                    zadao2.clear();
//                    zadao2.addAll(hSet);
//
//                }
//                realcount=zadao2.size();
//                BigDecimal b1 = new BigDecimal(realcount*100);
//                BigDecimal b2 = new BigDecimal(count);
//                int k = b1.divide(b2, 2, BigDecimal.ROUND_HALF_UP).intValue();
//                Coverage.set(j - 1, k);
//            }
//        }
//        return JSONArray.fromObject(Coverage).toString();
//    }
//    @RequestMapping(value="/progress1/MonthGetRfid",method = RequestMethod.POST)
//    @ResponseBody
//    public String MonthGetRfid(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month,@RequestParam(value = "Roads") String[] roads){
//        String Roads="road='"+roads[0]+"'";
//        for(int i=1;i<roads.length;i++){
//            Roads+="or road='"+roads[i]+"'";
//        }
//        List<RFID> zadao=rfidDao.findAll("from RFID where isDelete = 0 and ("+Roads+") order by zhadao",RFID.class);
//        List<RFID> all = new ArrayList<RFID>();
//        for(RFID g :zadao){
//            RFID s =new RFID();
//            s.setSerialNumber(g.getSerialNumber());
//            s.setZhadao(g.getZhadao());
//            all.add(s);
//        }
//        List<String> zadao1 = new ArrayList<String>();
//        int realcount=0;
//        int count =0;
//        String m="";
//        String n="";
//        int days=0;
//        ArrayList<Integer> Coverage= new ArrayList<Integer>();
//        if(month.equals("02")) {
//            if ((Integer.parseInt(year) % 4 == 0 && Integer.parseInt(year) % 100 != 0) || Integer.parseInt(year) % 400 == 0)
//                days = 29;
//            else
//                days = 28;
//        }
//        else if(month.equals("01")||month.equals("03")||month.equals("05")||month.equals("07")||month.equals("08")||month.equals("10")||month.equals("12"))
//            days=31;
//        else
//            days=31;
//        for(int i= 0;i<days;i++){
//            Coverage.add(0);
//        }
//        if(all.size()>0) {
//            count = 1;   //匝道数
//            zadao1.add(all.get(0).getZhadao());
//            for (int i = 0; i < all.size() - 1; i++) {
//                m = all.get(i).getZhadao();
//                n = all.get(i + 1).getZhadao();
//                if (!m.equals(n)) {
//                    zadao1.add(all.get(i + 1).getZhadao());
//                    count++;
//                }
//            }
//            String day;
//            for (int j = 1; j <= days; j++) {
//                realcount=0;
//                if (j < 10)
//                    day = "0" + j;
//                else
//                    day = j + "";
//
//                List<String> AllSerialNumber=vehiclePosDao.findAll("select distinct serialNumber from VehiclePos where ArmTime like '" + year + "-" + month + "-" + day+ "%'");
//                List<VehiclePos> SerialNumber=  new ArrayList<VehiclePos>();
//                for (String g : AllSerialNumber) {
//                    if(g!=null) {
//                        VehiclePos h = new VehiclePos();
//                        h.setSerialNumber(g);
//                        SerialNumber.add(h);
//                    }
//                }
//
//                ArrayList<String> zadao2 =new ArrayList<String>();
//                if(SerialNumber.size()!=0){
//                    for (int i = 0; i < SerialNumber.size(); i++) {
//                        for(int f = 0; f < all.size(); f++){
//                            if(SerialNumber.get(i).getSerialNumber()!=null && SerialNumber.get(i).getSerialNumber().equals(all.get(f).getSerialNumber())) {
//                                zadao2.add(all.get(f).getZhadao());
//                            }
//                        }
//
//                    }
//                    HashSet hSet  =   new HashSet(zadao2);
//                    zadao2.clear();
//                    zadao2.addAll(hSet);
//                }
//                realcount=zadao2.size();
//                BigDecimal b1 = new BigDecimal(realcount*100);
//                BigDecimal b2 = new BigDecimal(count);
//                int k = b1.divide(b2, 2, BigDecimal.ROUND_HALF_UP).intValue();
//                Coverage.set(j - 1, k);
//            }
//        }
//        return JSONArray.fromObject(Coverage).toString();
//    }
//    @RequestMapping(value="/progress1/DayGetRfid",method = RequestMethod.POST)
//    @ResponseBody
//    public String DayGetRfid(@RequestParam(value = "year") String year,@RequestParam(value = "month") String month,@RequestParam(value = "day") String day,@RequestParam(value = "Roads") String[] roads){
//        String Roads="road='"+roads[0]+"'";
//        for(int i=1;i<roads.length;i++){
//            Roads+="or road='"+roads[i]+"'";
//        }
//        List<RFID> zadao=rfidDao.findAll("from RFID where isDelete = 0 and ("+Roads+") order by zhadao",RFID.class);
//        List<RFID> all = new ArrayList<RFID>();
//        for(RFID g :zadao){
//            RFID s =new RFID();
//            s.setSerialNumber(g.getSerialNumber());
//            s.setZhadao(g.getZhadao());
//            all.add(s);
//        }
//        long size;
//        List<String> zadao1 = new ArrayList<String>();
//        int realcount=0;
//        int count =0;
//        String m="";
//        String n="";
//        ArrayList<Integer> Coverage= new ArrayList<Integer>();
//        for(int i=0;i<3;i++)
//            Coverage.add(0);
//        if(all.size()>0) {
//            count = 1;   //匝道数
//            zadao1.add(all.get(0).getZhadao());
//            for (int i = 0; i < all.size() - 1; i++) {
//                m = all.get(i).getZhadao();
//                n = all.get(i + 1).getZhadao();
//                if (!m.equals(n)) {
//                    zadao1.add(all.get(i + 1).getZhadao());
//                    count++;
//                }
//            }
//            realcount=0;
//            List<String> AllSerialNumber=vehiclePosDao.findAll("select distinct serialNumber from VehiclePos where ArmTime like '" + year + "-" + month + "-" + day+ "%'");
//            List<VehiclePos> SerialNumber=  new ArrayList<VehiclePos>();
//            for (String g : AllSerialNumber) {
//                if(g!=null) {
//                    VehiclePos h = new VehiclePos();
//                    h.setSerialNumber(g);
//                    SerialNumber.add(h);
//                }
//            }
//
//            ArrayList<String> zadao2 =new ArrayList<String>();
//            if(SerialNumber.size()!=0){
//                for (int i = 0; i < SerialNumber.size(); i++) {
//                    for(int f = 0; f < all.size(); f++){
//                        if(SerialNumber.get(i).getSerialNumber()!=null && SerialNumber.get(i).getSerialNumber().equals(all.get(f).getSerialNumber())) {
//                            zadao2.add(all.get(f).getZhadao());
//                        }
//                    }
//
//                }
//                HashSet hSet  =   new HashSet(zadao2);
//                zadao2.clear();
//                zadao2.addAll(hSet);
//            }
//                realcount=zadao2.size();
//                BigDecimal b1 = new BigDecimal(realcount*100);
//                BigDecimal b2 = new BigDecimal(count);
//                int k = b1.divide(b2, 2, BigDecimal.ROUND_HALF_UP).intValue();
//                Coverage.set(0, k);
//                Coverage.set(1, realcount);
//                Coverage.set(2, count);
//            }
//
//        return JSONArray.fromObject(Coverage).toString();
//    }
}
