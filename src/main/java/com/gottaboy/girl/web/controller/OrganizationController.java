package com.gottaboy.girl.web.controller;

import com.gottaboy.girl.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/organization")
public class OrganizationController{

//        @Autowired
//        private IOrganizationService organizationService;
        @Autowired
        private IUserService userService;

//        @RequiresPermissions("system:organization:view")
        @RequestMapping(value="/list",method = RequestMethod.GET)
        public String list() {
//            model.addAttribute("organizationList", organizationService.findAll());
              return "organization/list";
        }
}
