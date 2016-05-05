package com.springapp.mvc;

import com.springapp.classes.pingTest;
import com.springapp.entity.*;
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
import java.io.IOException;
import java.io.PrintWriter;
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
	@RequestMapping(value = "/getMap",method = RequestMethod.POST)
	@ResponseBody
	public String getMap(HttpServletRequest request){
		HttpSession session=request.getSession();
		String username= (String) session.getAttribute("username");
		if(username==null||username=="")
			return "fail";
		Account account=userDao.getByUsername(username);
		return JSONObject.fromObject(account).toString();
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
	public ModelAndView index() {
		ModelAndView modelAndView=new ModelAndView();
		List<Line> cjList=lineDao.getListByCompany("上海成基公司");
		List<Line>gjyhList=lineDao.getListByCompany("上海高架养护公司");
		List<Vehicle>cyList=vehicleDao.getCyList();
		List<Vehicle>cqList=vehicleDao.getCqList();
		List<Vehicle>cxList=vehicleDao.getCxList();
		List<Vehicle>gyList=vehicleDao.getGyList();
		List<Vehicle>gqList=vehicleDao.getGqList();
		List<Vehicle>gxList=vehicleDao.getGxList();
		modelAndView.addObject("cyList",cyList);
		modelAndView.addObject("cqList",cqList);
		modelAndView.addObject("cxList",cxList);
		modelAndView.addObject("gqList",gqList);
		modelAndView.addObject("gxList",gxList);
		modelAndView.addObject("gyList",gyList);
		modelAndView.addObject("cjList",cjList);
		modelAndView.addObject("gjyhList",gjyhList);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	@RequestMapping(value = "/line",method = RequestMethod.GET)
	public ModelAndView line(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("line");
		return modelAndView;
	}
	@RequestMapping(value = "/RFID",method = RequestMethod.GET)
	public ModelAndView RFID(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("RFID");
		return modelAndView;
	}

	@RequestMapping(value = "/NoPower",method = RequestMethod.GET)
	public ModelAndView NoPower(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("NoPower");
		return modelAndView;
	}
	@RequestMapping(value = "/ping",method = RequestMethod.POST)
	@ResponseBody
	public String pint(HttpServletRequest request,@RequestParam(value = "ip")String ip){
		/*String ip= request.getParameter("ip");*/
		pingTest.isAddressAvailable(ip);
		return "success";
	}
	@RequestMapping(value = "/pingTest",method = RequestMethod.GET)
	public void ping(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String ip= request.getParameter("ip");
		pingTest.isAddressAvailable(ip);
		PrintWriter printWriter=response.getWriter();
		printWriter.print("success");
	}
}