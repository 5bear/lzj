package com.springapp.mvc;

import com.springapp.classes.pingTest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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
	public ModelAndView home() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView modelAndView=new ModelAndView();
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