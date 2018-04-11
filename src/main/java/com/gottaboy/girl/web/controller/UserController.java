package com.gottaboy.girl.web.controller;

import com.github.pagehelper.PageInfo;
import com.gottaboy.girl.bean.User;
import com.gottaboy.girl.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

//@RestController
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    /**
     * 用户查询.
     * @return
     */
//    @RequiresPermissions("system:user:view")//权限管理;
    @RequestMapping(value="/list")
    public String list(Model model){
        model.addAttribute("test",1);
        return "user/list";
    }

//    @GetMapping(value="/userQuery")
    @RequestMapping(value="/query")
    @ResponseBody
    public Map<String, Object> querylist(@RequestParam(value="pageNum")Integer pageNum, @RequestParam(value="pageSize")Integer pageSize) {
        PageInfo<User> page = userService.getPageInfo(pageNum, pageSize);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rows", page.getList());
        map.put("total", page.getTotal());
        return map;
    }

//    @RequiresPermissions("system:user:add")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String create(User user) {
        userService.createUser(user);
        return "success";
    }

//    @RequiresPermissions("system:user:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String update(@PathVariable("id") Long id,User user) {
        User tempUser = userService.findOne(id);
        tempUser.setUsername(user.getUsername());
        tempUser.setRealname(user.getRealname());
        userService.updateUser(tempUser);
        return "success";
    }

//    @RequiresPermissions("system:user:delete")//权限管理;
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String update(@PathVariable("id") Long id) {
        User user = userService.findOne(id);
        return "success";
    }

}
