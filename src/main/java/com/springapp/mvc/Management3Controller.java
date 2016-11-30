package com.springapp.mvc;

/**
 * Created by yanglin on 16/4/16.
 */

import com.springapp.classes.JsonUtil;
import com.springapp.classes.model.AjaxObj;
import com.springapp.classes.model.TreeItem;
import com.springapp.classes.pingTest;
import com.springapp.entity.Park;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping(value = "**")
public class Management3Controller extends BaseController {

    @RequestMapping(value = "/getTreeDatas",method= RequestMethod.GET)
    @ResponseBody
    public String getTreeDatas(HttpSession session) {

        List<Park> parkcj = parkDao.getList("上海成基市政建设发展有限公司");
        List<Park> parkgj = parkDao.getList("上海高架养护管理有限公司");

        TreeItem[] cjs = new TreeItem[parkcj.size()];
        TreeItem[] gjs = new TreeItem[parkgj.size()];

        TreeItem item;
        for (int i=0;i<parkcj.size();i++){
            item = new TreeItem();
            item.setName(parkcj.get(i).getParkName());
            item.setValue(parkcj.get(i).getServerIP());
            item.setRank(parkcj.get(i).getTel());
            item.setSymbolSize(new int[]{70,70});
            if("".equals(parkcj.get(i).getServerIP())){
                item.setSymbol("image://echarts/28.png");
            }else {
                if (pingTest.isAddressAvailable(parkcj.get(i).getServerIP())) {
                    item.setSymbol("image://echarts/27.png");
                } else {
                    item.setSymbol("image://echarts/28.png");
                }
            }
            cjs[i] = item;
        }
        for (int i=0;i<parkgj.size();i++){
            item = new TreeItem();
            item.setName(parkgj.get(i).getParkName());
            item.setValue(parkgj.get(i).getServerIP());
            item.setRank(parkgj.get(i).getTel());
            item.setSymbolSize(new int[]{70,70});
            if("".equals(parkgj.get(i).getServerIP())){
                item.setSymbol("image://echarts/28.png");
            }else {
                if (pingTest.isAddressAvailable(parkgj.get(i).getServerIP())) {
                    item.setSymbol("image://echarts/27.png");
                } else {
                    item.setSymbol("image://echarts/28.png");
                }
            }
            gjs[i] = item;
        }

        TreeItem cj = new TreeItem();
        cj.setName("上海成基市政建设发展有限公司");
        cj.setValue("192.168.160.10");
        cj.setRank("");
        if (pingTest.isAddressAvailable("192.168.160.10")){
            cj.setSymbol("image://echarts/15.png");
        }else{
            cj.setSymbol("image://echarts/16.png");
        }
        cj.setSymbolSize(new int[]{90,90});
        cj.setChildren(cjs);

        TreeItem gj = new TreeItem();
        gj.setName("上海高架养护管理有限公司");
        gj.setValue("112.124.10.207");
        gj.setRank("");
        if (true){
            gj.setSymbol("image://echarts/15.png");
        }else{
            gj.setSymbol("image://echarts/16.png");
        }
        gj.setSymbolSize(new int[]{90,90});
        gj.setChildren(gjs);

        TreeItem[] cs = new TreeItem[2];
        cs[0]=cj;
        cs[1]=gj;


        TreeItem main = new TreeItem();
        main.setName("养护中心");
        main.setValue("180.168.194.2");
        main.setRank("");
        if (true){/*pingTest.isAddressAvailable("180.168.194.2")*/
            main.setSymbol("image://echarts/1.png");
        }else{
            main.setSymbol("image://echarts/2.png");
        }

        main.setSymbolSize(new int[]{90,90});
        main.setChildren(cs);

        AjaxObj ao = new AjaxObj();
        ao.setResult(0);
        ao.setObj(main);
        System.out.print("-------------------------------------------------"+JsonUtil.getInstance().obj2json(ao));
        return JsonUtil.getInstance().obj2json(ao);
    }


    @RequestMapping(value = "/Management3")
    public ModelAndView history3(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("management3");
        String company = String.valueOf(session.getAttribute("company"));
        List<Park> parks = parkDao.getList(company);
        mav.addObject("parks",parks);
        mav.addObject("size",parks.size());
        return mav;
    }

    @RequestMapping(value = "/pingIps")
    @ResponseBody
    public String pingIps(HttpServletRequest request) {
        AjaxObj ao = new AjaxObj();
        String[] ips = request.getParameterValues("ips[]");
        String[] states = new String[ips.length];
        for (int i=0;i<ips.length;i++){
            if("".equals(ips[i])){
                states[i] = "断线";
            }else{
                if (pingTest.isAddressAvailable(ips[i])){
                    states[i] = "连通";
                }else{
                    states[i] = "断线";
                }
            }

        }
        ao.setResult(0);
        ao.setObj(states);
        return JsonUtil.getInstance().obj2json(ao);
    }
}