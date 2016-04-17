package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/17.
 */
import com.springapp.dao.PackageDao;
import com.springapp.entity.Package;
import com.springapp.entity.Line;
import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;
//import com.sun.xml.internal.bind.v2.runtime.reflect.Lister;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.List;



@Controller
@RequestMapping(value = "/Package")
public class PackageController extends BaseController {


    @RequestMapping(value = "/index",method =RequestMethod.GET)
    public ModelAndView list()
    {

        ModelAndView modelAndView = new ModelAndView();
        List<Package> packageList=packageDao.getList();
        for(int i=0;i<packageList.size();i++)
        {
            Package pac=packageList.get(i);
            Long id=pac.getId();
            List<Line> lineList=lineDao.getListByPackage(id);
            String roads="";
            Long realDistance=0L;
            for(int j=0;j<lineList.size();j++)
            {
                Line line=lineList.get(j);
                if(j<lineList.size()-1)
                {
                    roads=roads+line.getLine()+",";
                }
                else
                {
                    roads=roads+line.getLine();
                }

                realDistance=realDistance+Integer.parseInt(line.getRealDistance());
            }
            pac.setRoads(roads);
            pac.setRealDistance(realDistance);
            packageDao.update(pac);
        }

        modelAndView.setViewName("PackageIndex");
        modelAndView.addObject("PackageList", packageDao.getList());
        modelAndView.addObject("search", "");
        return modelAndView;


    }

    @RequestMapping(value = "/add0")
    public String add0()
    {
        return "PackageAdd";
    }


    @RequestMapping(value = "/add1")
    @ResponseBody
    public String add1(@RequestParam(value = "company") String company,
                       @RequestParam(value = "packageName") String packageName,
                       @RequestParam(value = "distance") String distance,
                       @RequestParam(value = "inputMan") String inputMan,
                       @RequestParam(value = "time") String time,
                       @RequestParam(value = "remark") String remark)
    {

        Package pac = new Package();
        pac.setCompany(company);
        pac.setPackageName(packageName);
        pac.setDistance(Long.parseLong(distance));
        pac.setInputMan(inputMan);
        pac.setTime(Integer.parseInt(time));
        pac.setRemark(remark);
        pac.setIsDelete(0);
        pac.setCreateTime(simpleDateFormat.format(new Date()));


        packageDao.save(pac);
        return "success";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") String id)
    {
        Package pac = packageDao.getById(Long.parseLong(id));
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("PackageEdit");
        modelAndView.addObject("Package_edit", pac);
        return modelAndView;
    }

    @RequestMapping(value = "/edit1", method = RequestMethod.POST)
    @ResponseBody
    public String edit1(@RequestParam(value = "id") String id,
                        @RequestParam(value = "company") String company,
                        @RequestParam(value = "packageName") String packageName,
                        @RequestParam(value = "roads") String roads,
                        @RequestParam(value = "distance") String distance,
                        @RequestParam(value = "inputMan") String inputMan,
                        @RequestParam(value = "time") String time,
                        @RequestParam(value = "remark") String remark)
    {
        Package pac = packageDao.getById(Long.parseLong(id));
        pac.setCompany(company);
        pac.setPackageName(packageName);
        pac.setRoads(roads);
        pac.setDistance(Long.parseLong(distance));
        pac.setInputMan(inputMan);
        pac.setTime(Integer.parseInt(time));
        pac.setRemark(remark);
        pac.setEditTime(simpleDateFormat.format(new Date()));
        packageDao.update(pac);
        return "success";
    }



    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "id")String id){
        Package pac = packageDao.getById(Long.parseLong(id));
        pac.setIsDelete(1);
        pac.setDeleteTime(simpleDateFormat.format(new Date()));

        packageDao.update(pac);
        return "success";
    }

    @RequestMapping(value="/search",method = RequestMethod.GET)
    public ModelAndView search(@RequestParam(value = "search") String search)
    {

        System.out.println(search);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("PackageIndex");
        List<Package> packageList=packageDao.findAll("from Package where isDelete='0' and company like '%"+search+"%'",Package.class);
        modelAndView.addObject("PackageList", packageList);
        modelAndView.addObject("search", search);
        return modelAndView;
    }
    @RequestMapping(value = "/get",method = RequestMethod.POST)
    @ResponseBody
    public String get(){
        List<Package> pacList = packageDao.getList();
        return JSONArray.fromObject(pacList).toString();
    }

}

