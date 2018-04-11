package com.gottaboy.girl.web.controller;

import com.gottaboy.girl.properties.GirlProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
//@Controller
public class HelloController {

    @Value("${cupSize}")
    private String cupSize;

    @Value("${age}")
    private String age;

    @Value("${content}")
    private String content;

    @Autowired
    private GirlProperties girlProperties;

    @RequestMapping(value={"/hello","/hi"},method = RequestMethod.GET)
    public String say(){
//        return "hello world Spring Boot";
//        return cupSize + age;
//        return content;
        return girlProperties.getCupSize();
//        return "index";
    }
}
