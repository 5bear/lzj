package com.springapp.mvc;

import com.springapp.classes.*;
import com.springapp.entity.*;
import net.sf.ezmorph.array.DoubleArrayMorpher;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/")
public class HelloController extends BaseController{
	/*@RequestMapping(method = RequestMethod.GET)
	public ModelAndView printWelcome() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("hello");
		modelAndView.addObject("message", "Hello world!");
		*//*RFID rfid=new RFID();
		rfid.setLat(Long.parseLong("100"));
		rfid.setLng(Long.parseLong("100"));
		rfid.setCreateTime(System.currentTimeMillis());
		rfid.setrId(Long.parseLong("100"));
		rfid.setRoad("caoyang");
		rfid.setSerialNumber("1000101");
		rfidDao.save(rfid);*//*
		return modelAndView;
	}*/
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}
	@RequestMapping(value = "/getMap",method = RequestMethod.GET)
	@ResponseBody
	public String getMap(HttpServletRequest request){
		HttpSession session=request.getSession();
		String username= (String) session.getAttribute("username");
		if(username==null||username=="")
			return "fail";
		Account account=userDao.getByUsername(username);
		return JSONObject.fromObject(account).toString();
	}
	@RequestMapping(value = "/NoManage",method = RequestMethod.GET)
	@ResponseBody
	public String NoManage(){
		return "NoPower";
	}
    @RequestMapping(value = "/noException",method = RequestMethod.POST)
    @ResponseBody
    public String noException(Long id,HttpSession session){
        Account account=userDao.get(Account.class,id);
        if(account.getViewExcpt()==0)
            account.setViewExcpt(1);
        else
            account.setViewExcpt(0);
        userDao.update(account);
        session.setAttribute("user",account);
        return "success";
    }
	@RequestMapping(value = "/addArea",method = RequestMethod.POST)
	@ResponseBody
	public String addArea(HttpServletRequest request,@RequestParam(value = "center")String center,@RequestParam(value = "zoom")int zoom){
		HttpSession session=request.getSession();
		String username= (String) session.getAttribute("username");
		if(username==null||username=="")
			return "fail";
		Account account=userDao.getByUsername(username);
		account.setCenter(center);
		account.setZoom(zoom);
		userDao.update(account);
		return "success";
	}
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		String company= (String) session.getAttribute("company");
		List<Vehicle>cyList=vehicleDao.getCyList();
		List<Vehicle>cqList=vehicleDao.getCqList();
		List<Vehicle>cxList=vehicleDao.getCxList();
		List<Vehicle>gyList=vehicleDao.getGyList();
		List<Vehicle>gqList=vehicleDao.getGqList();
		List<Vehicle>gxList=vehicleDao.getGxList();
		if(company!=null&&company.equals("上海成基市政建设发展有限公司")) {
			modelAndView.addObject("cyList", cyList);
			modelAndView.addObject("cqList", cqList);
			modelAndView.addObject("cxList", cxList);
		}else if(company!=null&&company.equals("上海高架养护管理有限公司")) {
			modelAndView.addObject("gqList", gqList);
			modelAndView.addObject("gxList", gxList);
			modelAndView.addObject("gyList", gyList);
		}else{
			modelAndView.addObject("cyList", cyList);
			modelAndView.addObject("cqList", cqList);
			modelAndView.addObject("cxList", cxList);
			modelAndView.addObject("gqList", gqList);
			modelAndView.addObject("gxList", gxList);
			modelAndView.addObject("gyList", gyList);
		}
		modelAndView.addObject("account",company);
		modelAndView.setViewName("index");
		return modelAndView;
	}
/*	public String getDevGps(@RequestParam(value = "devIDNO")String devIDNO){
		String filePath="D://"+devIDNO+"txt";
		FileRead fileRead=new FileRead();
		try{
			String content= fileRead.readTxtFile(filePath);
			JSONObject.toBean()
		}catch (Exception e){
			return "fail";
		}
	}*/
	@RequestMapping(value = "/getGPS",method = RequestMethod.GET)
	@ResponseBody
	public String getGPs(@RequestParam(value = "devIDNO")String devIDNO){
		String filePath="D://"+devIDNO+".txt";
		VehiclePos vehiclePos=new VehiclePos();
		FileUtil fileUtil =new FileUtil();
		try{
			String content= fileUtil.readTxtFile(filePath);
			vehiclePos= (VehiclePos) JSONObject.toBean(JSONObject.fromObject(content), VehiclePos.class);
			vehiclePosDao.save(vehiclePos);
		}catch (Exception e){
			return "fail";
		}
		return JSONObject.fromObject(vehiclePos).toString();
	}

	@RequestMapping(value = "/NoPower",method = RequestMethod.GET)
	public ModelAndView NoPower(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("NoPower");
		return modelAndView;
	}
	@RequestMapping(value = "/pingTest",method = RequestMethod.GET)
	public void ping(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String ip= request.getParameter("ip");
		pingTest.isAddressAvailable(ip);
		PrintWriter printWriter=response.getWriter();
		printWriter.print("success");
	}

	@RequestMapping(value = "/isOnline",method = RequestMethod.POST)
	@ResponseBody
	public String isOnline(String DevIDNO){
		String filePath="C://GpsData/"+DevIDNO+"_state.txt";
		try {
			String content = FileUtil.readTxtFile(filePath);
			if (content!=null&&!content.equals(""))
				return content;
		}
		catch (Exception e){
			return "Offline";
		}
		return "Offline";
	}
}