package com.springapp.filter;

import org.osgi.service.component.annotations.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * Created by ZhanShaoxiong on 2016/5/2.
 */
@Component
public class AccessFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        HttpServletResponse response= (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();

        // 此处截取的url为：login.jsp
        boolean flag=url.contains(".");
        HttpSession session=request.getSession();
        String username= (String) session.getAttribute("username");
        String power=(String)session.getAttribute("power");
        if(url.contains("login")||flag){
            filterChain.doFilter(servletRequest, servletResponse);
        }else{
            if(username==null||username.equals("")){
                response.sendRedirect("login");
            }else{
                filterChain.doFilter(servletRequest, servletResponse);
            }
        }

    }

    @Override
    public void destroy() {

    }
}
