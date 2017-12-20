package com.tourInteraction.interceptor;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.ILoginService;
import com.tourInteraction.utils.CookieUtil;
import com.tourInteraction.utils.IPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class AllInterceptor implements HandlerInterceptor {

    @Autowired
    @Qualifier(value = "loginServiceImpl")
    private ILoginService loginService ;
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        // 从session 里面获取用户名的信息
        User user = (User)session.getAttribute("user");

        //没有登录自动登录
        if (user == null || "".equals(user.toString())) {
            Cookie cookie = CookieUtil.getCookieByName(httpServletRequest, GlobalConstantKey.COOKIR_TOUR_AUTO_LOGIN);
            if(cookie != null){
                Map<String,Object> mapParam = new HashMap<String,Object>();
                mapParam.put("cookie",cookie.getValue());
                mapParam.put("clientIp", IPUtil.getRemoteIpAddr(httpServletRequest));
                mapParam.put("status",GlobalConstantKey.STATUS_OPEN);
                String username = loginService.getAutoLogin(mapParam);
                User user1 = loginService.getUserByUserNameDao(username);
                session.setAttribute("user",user1);
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
