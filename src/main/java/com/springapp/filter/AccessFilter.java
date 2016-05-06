package com.springapp.filter;

import com.springapp.entity.Auth;
import org.osgi.service.component.annotations.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by ZhanShaoxiong on 2016/5/2.
 */
@Component
public class AccessFilter implements Filter {

    public static Map myMap(){
        Map map=new HashMap();
        String[]pageNames={"停车场管理","车辆管理","RFID管理","包件管理","电子围栏","监控规则","养护作业计划","作业路线管理","布点计划","驾驶员计划",
                "养护进度监控","实时监控","养护日志管理","历史线路查询","历史视频查询","异常查询","报表查询","报表查询","报表查询","报表查询","网络状态"};
        String[]keys={"Park","Vehicle","RFID","Package","eFence","Rules","plan1","line","plan3","Driver","Progress1","Progress2","MaintainLog","history1",
                "history2","history3","reports1","reports2","reports3","reports4","management3"};
        for(int i=0;i<21;i++){
            map.put(keys[i],pageNames[i]);
        }
        return map;
    }
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        HttpServletResponse response= (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();
        String []keys=url.split("/");
        String key="";
        if(keys.length>=1)
          key=keys[keys.length-1];
        String pageName= (String) myMap().get(key);
        System.out.print(key);
        boolean flag=url.contains(".");
        HttpSession session=request.getSession();
        session.setAttribute("pageName",pageName);
        String username= (String) session.getAttribute("username");
        String power=(String)session.getAttribute("power");
        if(url.contains("login")||flag){
            filterChain.doFilter(servletRequest, servletResponse);
        }else{
            if(username==null||username.equals("")){
                response.sendRedirect("login");
            }else{
                if(key.equals("UserManage")||key.equals("User")||key.equals("Power")){
                    if(!power.equals("系统管理员"))
                        response.sendRedirect("NoPower");
                }
                List<Auth> authList= (List<Auth>) session.getAttribute("list");
                Auth myAuth=null;
                for(Auth auth:authList){
                    if(auth.getPageName().equals(pageName)){
                        myAuth=auth;
                        break;
                    }

                }
                if(myAuth!=null&&myAuth.getVisit().equals("no"))
                    response.sendRedirect("NoPower");
                else
                    filterChain.doFilter(servletRequest, servletResponse);
            }
        }

    }

    @Override
    public void destroy() {

    }
}
