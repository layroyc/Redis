package com.xiexin.redistest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import redis.clients.jedis.JedisPool;

import java.util.List;

import static redis.clients.jedis.BinaryClient.LIST_POSITION.BEFORE;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class MyRedisTestzy {
    @Autowired
    private JedisPool jedisPool;

    /*
    * 用java代码写，把咱们班33个人的名字 形成 一个集合，
    * 运行后随机点一个人的名字，就把这个人的名字移除。 再次
    * 点名是 点 32个人的随机中的一个。
    * */
    @Test
    public void test01(){
       /* List<String> lists = new ArrayList<>();
        Long aLong = jedisPool.getResource().lpush("people", "白世纪", "陈红利", "陈世纪", "陈洋洋");
        Long llen = jedisPool.getResource().llen("people");
        System.out.println("llen = " + llen);
        //randomkey
        String s = jedisPool.getResource().randomKey();
        System.out.println("s = " + s);
        Long lrem = jedisPool.getResource().lrem("s", 0, "陈洋洋");
        System.out.println("lrem = " + lrem);
        Long llen2 = jedisPool.getResource().llen("people");
        System.out.println("llen2 = " + llen2);*/
       String[] stuNames = {"白世纪", "陈红利", "陈世纪", "陈洋洋","杜晓梦", "付春辉", "高芳芳", "郭旭",
                            "胡艺果", "贾礼博", "李雪莹", "李祎豪","林梦娇", "刘顺顺", "卢光辉", "吕亚伟",
                            "宁静静", "牛志洋", "史倩影", "宋健行","孙超阳", "孙乾力", "田君垚", "汪高洋",
                            "王学斌", "杨天枫", "杨原辉", "袁仕奇","张浩宇", "张晓宇", "张志鹏", "赵博苛","邹开源"};
        Long people = jedisPool.getResource().sadd("people", stuNames);
        for (String stuName : stuNames) {
            System.out.println("stuName = " + stuName);
        }
        String spop = jedisPool.getResource().spop("people");
        System.out.println("spop = " + spop);
    }

    /*
    * 使用 java 代码编写，
    * 有一个双端队列集合， 里面有 10 条数据，
    * 查询出  第5个人是什么数据，
    * 左边弹出1个 ， 右边弹出1个，打印还剩多少条数据，
    * 然后，再 第3个数据前面，插入一个数据，
    * 然后，进行查询全部数据进行查看。
    *
    * */
    @Test
    public void test02(){
        jedisPool.getResource().lpush("person","陈子昂","张养浩","李白","杜甫","白居易","司马光","杜牧","李商隐","关汉卿","苏轼");
        //查询出  第5个人是什么数据
        String lindex = jedisPool.getResource().lindex("person", 4);
        System.out.println("lindex = " + lindex);
        //左边弹出1个 ， 右边弹出1个，打印还剩多少条数据
        // 左边删除： lpop key
        //右边删除： rpop key
        jedisPool.getResource().lpop("person");
        jedisPool.getResource().rpop("person");
        Long llen = jedisPool.getResource().llen("person");
        System.out.println("llen条数 = " + llen);
        //再 第3个数据前面，插入一个数据，
        //插入： linsert key before "刘备" "王源"
        Long linsert = jedisPool.getResource().linsert("person", BEFORE, "李白", "ww");
        //进行查询全部数据进行查看
        List<String> person = jedisPool.getResource().lrange("person", 0, -1);
        for (String s : person) {
            System.out.println("s = " + s);
        }


    }


}
