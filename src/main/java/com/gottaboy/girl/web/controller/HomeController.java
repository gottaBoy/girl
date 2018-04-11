package com.gottaboy.girl.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping({"/","/index"})
    public String index(){
        return"index";
    }

//    @RequestMapping("/")
//    public String index(@CurrentUser User loginUser, Model model) {
//        Set<String> permissions = authorizationService.findPermissions(Constants.SERVER_APP_KEY, loginUser.getId());
//        List<Resource> menus = resourceService.findMenus(permissions);
//
//        model.addAttribute("menus", menus);
//        return "index";
//    }

//    @RequestMapping({"/","/index"})
//    public ModelAndView index(){
//        ModelAndView modelAndView = new ModelAndView("/index");
//        return modelAndView;
//    }

    @RequestMapping("/403")
    public String unauthorizedRole(){
        System.out.println("------没有权限-------");
        return "/403";
    }
}
