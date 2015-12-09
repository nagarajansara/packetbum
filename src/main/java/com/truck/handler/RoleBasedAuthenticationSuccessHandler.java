package com.truck.handler;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.truck.controller.BaseController;
import com.truck.domain.Users;
import com.truck.util.ConstException;

public class RoleBasedAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	 
    private Map<String, String> roleUrlMap;
    BaseController basecontoller=new BaseController();
    
   @Override
   public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
           Authentication authentication) throws IOException, ServletException {
	   
	   HttpSession session = request.getSession();
	   String redirectUrl="null";
       if (session != null) {
          redirectUrl = (String) session.getAttribute("targeturl");
           
           System.out.println("target-"+redirectUrl);
          
          }
	   
       if (authentication.getPrincipal() instanceof UserDetails) {
           UserDetails userDetails = (UserDetails) authentication.getPrincipal();
           String role = userDetails.getAuthorities().isEmpty() ? null : userDetails.getAuthorities().toArray()[0]
                   .toString();
           System.out.println("userss:"+role);
           Users user=new Users();
           user.setUsername(userDetails.getUsername());
           user.setRole(role);
         //  user.setRole(userDetails.getAuthorities().);
           
           try {
			basecontoller.setUserSession(request, user);
		          } catch (ConstException e) {
			// TODO Auto-generated catch block
			    e.printStackTrace();
		       }
       
           if (redirectUrl != "null") {
               // we do not forget to clean this attribute from session
        	   response.sendRedirect(request.getContextPath() + redirectUrl);
             
           }else{
                
        	   response.sendRedirect(request.getContextPath() + roleUrlMap.get(role));
           }
       }
   }
    
   public void setRoleUrlMap(Map<String, String> roleUrlMap) {
       this.roleUrlMap = roleUrlMap;
   }}
