package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/17.
 */

import com.springapp.classes.model.Pager;
import com.springapp.entity.Line;
import com.springapp.entity.Package;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//import net.sf.json.JSONObject;
//import com.sun.xml.internal.bind.v2.runtime.reflect.Lister;


@Controller
@RequestMapping(value = "**")
public class PackageController extends BaseController {


    @RequestMapping(value = "/Package/list", method = RequestMethod.GET)
    public ModelAndView list(@RequestParam(required = false) String name,HttpSession session) {
        if (name == null) {
            name = "";
        }
        ModelAndView modelAndView = new ModelAndView();
        List<Package> packageList = packageDao.getList();
        if (packageList != null) {
            for (int i = 0; i < packageList.size(); i++) {
                Package pac = packageList.get(i);
                Long id = pac.getId();
                List<Line> lineList = lineDao.getListByPackage(id);
                String roads = "";
                double realDistance = 0.00;
                for (int j = 0; j < lineList.size(); j++) {
                    Line line = lineList.get(j);
                    if (j < lineList.size() - 1) {
                        roads = roads + line.getLine() + ",";
                    } else {
                        roads = roads + line.getLine();
                    }
                    double temp=0;
                    try{
                        temp =  Double.parseDouble(line.getRealDistance());
                        BigDecimal b   =   new   BigDecimal(temp);
                        temp   =   b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                   }catch (Exception e){
                       temp=0;
                   }
                        realDistance = realDistance +temp;

                }
                BigDecimal b   =   new   BigDecimal(realDistance);
                realDistance   =   b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                pac.setRoads(roads);
                pac.setRealDistance(realDistance*pac.getTime());
                packageDao.update(pac);
            }

        }

        modelAndView.setViewName("PackageIndex");
        String company = String.valueOf(session.getAttribute("company"));
        Pager<Package> pp = packageDao.getPager(name,company);
        if(pp!=null){
            for (Package p:pp.getDatas()){
                BigDecimal b   =   new   BigDecimal(p.getDistance()/1000);
                double dd   =   b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                p.setDistance(dd);

                BigDecimal bd   =   new   BigDecimal(p.getRealDistance()/1000);
                double ddd   =   bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                p.setRealDistance(ddd);
            }
        }
        modelAndView.addObject("PackageList", pp);
        modelAndView.addObject("name", name);
        return modelAndView;


    }

    @RequestMapping(value = "/Package/add", method = RequestMethod.GET)
    public ModelAndView add0() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("PackageAdd");
        List<Integer> yearList = new ArrayList<Integer>();
        for (int i = 2016; i <= 2030; i++) {
            yearList.add(i);
        }
        modelAndView.addObject("yearList", yearList);
        return modelAndView;
    }


    @RequestMapping(value = "/Package/add", method = RequestMethod.POST)
    @ResponseBody
    public String add1(@RequestParam(value = "company") String company,
                       @RequestParam(value = "packageName") String packageName,
                       @RequestParam(value = "distance") String distance,
                       //@RequestParam(value = "inputMan") String inputMan,
                       @RequestParam(value = "time") String time,
                       @RequestParam(value = "runtime") String runtime,
                       @RequestParam(value = "remark") String remark,
                       HttpSession session)

    {

        //HttpSession session=request.getSession();

        if ("".equals(packageName.trim())) {
            return "null";
        }


        Package p = packageDao.getByName(packageName);
        if (p!=null) {
            return "false";
        }

        String inputMan = (String) session.getAttribute("username");
        Package pac = new Package();
        pac.setCompany(company);
        pac.setPackageName(packageName);
        if (distance!=null && !"".equals(distance.trim())){
            double d = Double.parseDouble(distance);
            BigDecimal b   =   new   BigDecimal(d);
            double   f1   =   b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
            pac.setDistance(f1*1000);
        }
        pac.setInputMan(inputMan);
        if (time!=null && !"".equals(time.trim())){
            pac.setTime(Integer.parseInt(time));
        }

        pac.setRuntime(runtime);
        pac.setRemark(remark);
        pac.setIsDelete(0);
        pac.setCreateTime(simpleDateFormat.format(new Date()));

        packageDao.add(pac);
        return "success";
    }

    @RequestMapping(value = "/Package/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") String id) {
        Package pac = packageDao.getById(Long.parseLong(id));
        BigDecimal b   =   new   BigDecimal(pac.getDistance()/1000);
        double dd   =   b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        pac.setDistance(dd);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("PackageEdit");
        List<Integer> yearList = new ArrayList<Integer>();
        for (int i = 2016; i <= 2030; i++) {
            yearList.add(i);
        }
        modelAndView.addObject("yearList", yearList);
        modelAndView.addObject("Package_edit", pac);
        return modelAndView;
    }

    @RequestMapping(value = "/Package/edit", method = RequestMethod.POST)
    @ResponseBody
    public String edit1(@RequestParam(value = "id") String id,
                        @RequestParam(value = "company") String company,
                        @RequestParam(value = "packageName") String packageName,
                        //@RequestParam(value = "roads") String roads,
                        @RequestParam(value = "distance") String distance,
                        //@RequestParam(value = "inputMan") String inputMan,
                        @RequestParam(value = "time") String time,
                        @RequestParam(value = "runtime") String runtime,
                        @RequestParam(value = "remark") String remark) {
        if ("".equals(packageName.trim())) {
            return "null";
        }
        Package pac = packageDao.getById(Long.parseLong(id));

        Package p = packageDao.getByName(packageName);

        if (p!=null && p.getId()!=pac.getId()) {
            return "false";
        }

        pac.setCompany(company);
        pac.setPackageName(packageName);
        //pac.setRoads(roads);
        if (distance!=null && !"".equals(distance.trim())){
            double d = Double.parseDouble(distance);
            BigDecimal b   =   new   BigDecimal(d);
            double   f1   =   b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
            pac.setDistance(f1*1000);
        }
        //pac.setInputMan(inputMan);
        if (time!=null && !"".equals(time.trim())){
            pac.setTime(Integer.parseInt(time));
        }
        pac.setRuntime(runtime);
        pac.setRemark(remark);
        pac.setEditTime(simpleDateFormat.format(new Date()));
        packageDao.update(pac);
        return "success";
    }


    @RequestMapping(value = "/Package/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id") String id) {
        Package pac = packageDao.getById(Long.parseLong(id));
        String r = pac.getRoads();
        if (r.equals("")) {
            pac.setIsDelete(1);
            pac.setDeleteTime(simpleDateFormat.format(new Date()));
            packageDao.update(pac);
            return "success";
        }
        return "false";
    }

   /* //根据所属公司进行模糊查询
    @RequestMapping(value="/PackageSearch",method = RequestMethod.GET)
    public ModelAndView search(@RequestParam(value = "search") String search)
    {

        System.out.println(search);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("PackageIndex");
        List<Package> packageList=packageDao.findAll("from Package where isDelete='0' and ((company like '%"+search+"%')or(packageName like '%"+search+"%'))",Package.class);
        modelAndView.addObject("PackageList", packageList);
        modelAndView.addObject("search", search);
        return modelAndView;
    }*/

    @RequestMapping(value = "/Package/get", method = RequestMethod.POST)
    @ResponseBody
    public String get() {
        List<Package> pacList = packageDao.getList();
        return JSONArray.fromObject(pacList).toString();
    }

}

