package com.xiexin.redistest;
/*
* redis测试 测试和ssm项目结合
* ssm 项目 如何使用 redis 第一种方式：使用 jedis  类似于jdbc
*   //第一步：在applicationContext.xml 中 注释去掉
*   //第二步： 把 db.properties 中的把 redis 配置的注释去掉
*
*   springmvc 中的单元测试
*   为什么使用juint单元测试，因为 在框架中，传统的main方法 已经无法处理，
*   如 req 请求，等等。  无法满足 测试需求了
*   单元测试的好处是  在最小的代码单元结构中 找到 bug ,最快速的找到bug所在地方
*   迅速解决，1个 dao方法1个测试，1个controller 1个测试，1个service 1个测试
*
*
* */

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import redis.clients.jedis.JedisPool;

import java.util.List;
import java.util.Map;
import java.util.Set;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring的Junit测试
@ContextConfiguration({"classpath:applicationContext.xml"})//模拟ssm 框架运行后加载xml容器
public class MyRedisTest {
    @Autowired
    private JedisPool jedisPool;

    //测试string 类型
    @Test
    public void test01() throws InterruptedException {
        String pcode = jedisPool.getResource().set("pcode","123456");
        System.out.println("pcode = " + pcode);
        //查询pcode在不在，如果在，把他设置成 120秒倒计时,并且在 10s后 输出倒计时
        Boolean b = jedisPool.getResource().exists("pcode");
        System.out.println("pcode = " + pcode);
        if(b){
            System.out.println("key 存在");
            String s = jedisPool.getResource().setex("pcode", 120, "7788");
            //并且在 10s后 输出倒计时
            Thread.sleep(1000*10);
            Long ttl = jedisPool.getResource().ttl("pcode");
            System.out.println("ttl = " + ttl);
            //输出完成后，将 该key 设置成 永久的key
            jedisPool.getResource().persist("pcode");//注意，这个不是-1
            Long aLong =jedisPool.getResource().ttl("pcode");
            System.out.println("aLong = " + aLong);

            /*Long pcode1 = jedisPool.getResource().expire("pcode", 120);
            String pcode2 = jedisPool.getResource().set("pcode","7788");
            Long pcode3 = jedisPool.getResource().ttl("pcode");
            System.out.println("pcode3 = " + pcode3);*/
        }else{
            System.out.println(" 键不存在 " );
        }
    }

    //测试 string 常用类型
    @Test
    public void stringTest(){
        //查询所有的key keys *
        Set<String> keys = jedisPool.getResource().keys("*");
        for (String key : keys) {
           // System.out.println("key = " + key);
            String value = jedisPool.getResource().get(key);
            System.out.println("key = " + key+"  "+"value = " + value);
            //自增
            Long incr = jedisPool.getResource().incr(key);
            System.out.println("incr = " + incr);
            String value1 = jedisPool.getResource().get(key);
            System.out.println("key = " + key+"  "+"value1 = " + value1);

        }
    }

    //测试hash
    @Test
    public void hashTest(){
        Long hset = jedisPool.getResource().hset("food", "name", "苹果");
        jedisPool.getResource().hset("food", "color", "黑色");
        System.out.println("hset = " + hset);

        //查
        String hget = jedisPool.getResource().hget("food", "color");
        System.out.println("hget = " + hget);
        //查key
        Set<String> food = jedisPool.getResource().hkeys("food");
        for (String s : food) {
            System.out.println("s = " + s);
        }
        List<String> name = jedisPool.getResource().hvals("name");
        for (String s : name) {
            System.out.println("s = " + s);
        }
        //查kv
        Map<String, String> food1 = jedisPool.getResource().hgetAll("food");
        for (String s : food1.keySet()) {
            System.out.println("s = " + s);
        }
    }

    //测试list
    @Test
    public void listTest(){
        Long lpush = jedisPool.getResource().lpush("names", "唐僧","孙悟空","八戒");
        List<String> names = jedisPool.getResource().lrange("names", 0, -1);
        for (String name : names) {
            System.out.println("name = " + name);
        }
        //删除
        String names1 = jedisPool.getResource().lpop("names");
        System.out.println("names1 = " + names1);

    }

    //测试set
    @Test
    public void setTest(){
        jedisPool.getResource().sadd("pnames", "zhangsan", "lisi");
        //遍历
        Set<String> pnames = jedisPool.getResource().smembers("pnames");
        for (String pname : pnames) {
            System.out.println("pname = " + pname);
        }
        //查询多少条
        Long pnames1 = jedisPool.getResource().scard("pnames");
        System.out.println("pnames1 = " + pnames1);

        //指定删除
        jedisPool.getResource().srem("pnames","zhangsan");
        //随机删除
        jedisPool.getResource().spop("pnames");
    }

    //测试zset 有序的集合
    @Test
    public void zsetTest(){
        //增加
        jedisPool.getResource().zadd("znames",1.0,"大娃");
        jedisPool.getResource().zadd("znames",2.0,"二娃");
        jedisPool.getResource().zadd("znames",3.0,"三娃");
        jedisPool.getResource().zadd("znames",4.0,"四娃");
        jedisPool.getResource().zadd("znames",5.0,"五娃");
        //遍历
        Set<String> znames = jedisPool.getResource().zrange("znames", 0, -1);
        for (String zname : znames) {
            System.out.println("zname = " + zname);
        }
        //查条数
        Long znames1 = jedisPool.getResource().zcard("znames");
        System.out.println("znames1 = " + znames1);
        //指定删除
        Long zrem = jedisPool.getResource().zrem("znames", "大娃");
        System.out.println("zrem = " + zrem);
    }
}
