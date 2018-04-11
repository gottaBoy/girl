package com.gottaboy.girl.web.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.Map;
//${springMacroRequestContext.contextPath}
@Controller
public class LoginController {

//    @RequestMapping(value="/login",method=RequestMethod.GET)
//    public String login(){
//        return "login";
//    }

    @RequestMapping(value="/login")
    public String login(HttpServletRequest request, Map<String, Object> map) throws Exception{
        System.out.println("LoginController.login()");
        if (SecurityUtils.getSubject().isAuthenticated() && HttpMethod.GET.equals(request.getMethod())) {
            return "redirect:/";
        }
        // 登录失败从request中获取shiro处理的异常信息。
        // shiroLoginFailure:就是shiro异常类的全类名.
        String exception = (String) request.getAttribute("shiroLoginFailure");
        System.out.println("exception=" + exception);
        String msg = "";
        if (exception != null) {
            if (UnknownAccountException.class.getName().equals(exception)) {
                System.out.println("UnknownAccountException -- > 账号不存在：");
                msg = "UnknownAccountException -- > 账号不存在：";
            } else if (IncorrectCredentialsException.class.getName().equals(exception)) {
                System.out.println("IncorrectCredentialsException -- > 密码不正确：");
                msg = "IncorrectCredentialsException -- > 密码不正确：";
            } else if ("kaptchaValidateFailed".equals(exception)) {
                System.out.println("kaptchaValidateFailed -- > 验证码错误");
                msg = "kaptchaValidateFailed -- > 验证码错误";
            } else {
                msg = "else >> "+exception;
                System.out.println("else -- >" + exception);
            }
        }
        map.put("msg", msg);
        // 此方法不处理登录成功,由shiro进行处理
        return "login";
    }

    @RequestMapping(value="/ajaxLogin",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> submitLogin(@RequestParam("username")String username, @RequestParam("password") String password, @RequestParam("vcode")String vcode, @RequestParam("rememberMe")Boolean rememberMe) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        if(vcode==null||vcode==""){
            resultMap.put("status", 500);
            resultMap.put("message", "验证码不能为空！");
            return resultMap;
        }
        Session session = SecurityUtils.getSubject().getSession();
        //转化成小写字母
        vcode = vcode.toLowerCase();
        String v = (String) session.getAttribute("_code");
        //还可以读取一次后把验证码清空，这样每次登录都必须获取验证码
        //session.removeAttribute("_come");
        if(!vcode.equals(v)){
            resultMap.put("status", 500);
            resultMap.put("message", "验证码错误！");
            return resultMap;
        }
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password,rememberMe);
            SecurityUtils.getSubject().login(token);
            resultMap.put("status", 200);
            resultMap.put("message", "登录成功");
        } catch (UnknownAccountException e) {
            resultMap.put("status", 500);
            resultMap.put("message", "账号不存在！");
        }catch(IncorrectCredentialsException e1){
            resultMap.put("status", 500);
            resultMap.put("message", "密码错误！");
        }catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("message", "账号不存在");
        }
        return resultMap;
    }

//    @RequestMapping("/login1")
//    public String login(HttpServletRequest request) throws Exception{
//        System.out.println("LoginController.login()");
//        // 登录失败从request中获取shiro处理的异常信息。
//        // shiroLoginFailure:就是shiro异常类的全类名.
//        String exception = (String) request.getAttribute("shiroLoginFailure");
//        System.out.println("exception=" + exception);
//        String msg = "";
//        if (exception != null) {
//            if (UnknownAccountException.class.getName().equals(exception)) {
//                System.out.println("UnknownAccountException -- > 账号不存在：");
//                msg = "UnknownAccountException -- > 账号不存在：";
//            } else if (IncorrectCredentialsException.class.getName().equals(exception)) {
//                System.out.println("IncorrectCredentialsException -- > 密码不正确：");
//                msg = "IncorrectCredentialsException -- > 密码不正确：";
//            } else if ("kaptchaValidateFailed".equals(exception)) {
//                System.out.println("kaptchaValidateFailed -- > 验证码错误");
//                msg = "kaptchaValidateFailed -- > 验证码错误";
//            } else {
//                msg = "error";
//                System.out.println("else -- >" + exception);
//            }
//        }
//        return msg;
//    }
}
