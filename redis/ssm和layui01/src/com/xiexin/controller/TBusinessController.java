package com.xiexin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiexin.bean.TBusiness;
import com.xiexin.service.TBusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/tBusiness")
public class TBusinessController {
    @Autowired
    private TBusinessService tBusinessService;

    @RequestMapping("/selectTwoTable")
    @ResponseBody //返回给前端json数据
    public Map selectTwoTable(){
        List<Map> maps = tBusinessService.selectTwoTable();
        Map codeMap = new HashMap();
        codeMap.put("code",0);
        codeMap.put("data",maps);
        return codeMap;
    }

    //增加
    @RequestMapping("/insert")
    @ResponseBody
    public Map insert(@RequestBody TBusiness tBusiness){
        Map codeMap = new HashMap();
        int i = tBusinessService.insertSelective(tBusiness);
        if(i==1){
            codeMap.put("code",0);
            codeMap.put("msg","添加成功");
        }else{
            codeMap.put("code",400);
            codeMap.put("msg","添加失败");
        }
        return codeMap;
    }

    //分页
    @RequestMapping("/selectByPage")
    @ResponseBody
    public Map selectByPage(@RequestParam(defaultValue = "1",required = true,name = "page") Integer page,
                            @RequestParam(defaultValue = "2",required = true,name = "pageSize")Integer pageSize){
        //该分页可以分页查询
        //分页的第一种方法，仅限于 mybaties
        //使用的是 pageHelper 分页，基于 aop 拦截
        //page 是当前页  默认值是1      pageSize是值的条数
        //如果没有动态的查询，  直接让 expamle  为 null 就可以了
        PageHelper.startPage(page,pageSize);//这个PageHelper  拿到前端的参数
        List<TBusiness> tBusinesses =  tBusinessService.selectByExample(null);//查询全部的数据
        PageInfo<TBusiness> pageInfo = new PageInfo<>(tBusinesses);//PageHelper 进行拦截
        long total = pageInfo.getTotal();//拿到总条数
        Map codeMap = new HashMap();
        codeMap.put("code",0);
        codeMap.put("data",pageInfo);//拿到所有
        codeMap.put("total",total);
        return codeMap;
    }
}
