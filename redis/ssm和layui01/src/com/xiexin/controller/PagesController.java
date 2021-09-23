package com.xiexin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PagesController {
    @RequestMapping("/")
    public String index(){
        return "index";
    }
    @RequestMapping("/main")
    public String main(){
        return "main";
    }
    @RequestMapping("/addBusiness")
    public String addBusiness(){
        return "addBusiness";
    }
    @RequestMapping("/vuedemo000")
    public String vuedemo000(){
        return "vuedemo000";
    }
    @RequestMapping("/vuedemo001")
    public String vuedemo001(){
        return "vuedemo001";
    }
    @RequestMapping("/vuedemo002")
    public String vuedemo002(){
        return "vuedemo002";
    }
    @RequestMapping("/vuedemo003")
    public String vuedemo003(){
        return "vuedemo003";
    }

    @RequestMapping("/vuedemo0003")
    public String vuedemo0003(){
        return "vuedemo0003";
    }

    @RequestMapping("/vuexialakuang")
    public String vuexialakuang(){
        return "vuexialakuang";
    }

    @RequestMapping("/vuedemo004")
    public String vuedemo004(){
        return "vuedemo004";
    }

    @RequestMapping("/vuejichu01")
    public String vuejichu01(){
        return "vuejichu01";
    }

    @RequestMapping("/vuejichu02")
    public String vuejichu02(){
        return "vuejichu02";
    }

    @RequestMapping("/jiantouhanshu")
    public String jiantouhanshu(){
        return "jiantouhanshu";
    }

}
