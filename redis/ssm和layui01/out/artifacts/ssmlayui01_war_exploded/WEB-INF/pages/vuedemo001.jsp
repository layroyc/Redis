<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/15
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>

<html>
<head>
    <title>第一个 Vue demo</title>
</head>
<body>
    <div>
        学习 插值表达式{{}}
        Vue 常用在 单个页面项目中，什么叫做单个页面项目，常用于手机移动端，指的是 整个项目 只有1个 页面。
        通过 锚点  来 跳转 ，没有a ，这个锚点的跳转叫做路由
        单个页面项目的 优缺点
        优点：都是HTML 代码运行流畅，可以 有很多组件 可以重复使用
        缺点：不利于seo 百度的收录
    </div>

    <h1>讲解 jquery 和 我们的 Vue 的不同</h1>
    <div>
        jquery: 他是 dom 驱动的，所有看到的页面 都要 一行一行的把 代码 写出来，不是自动的， 是手动的
        <h2 id="jq-helloWorld">
            <%--对比一下，在div中 插入数据  你好，世界--%>

        </h2>
    </div>
    <div id="app">
        vue 因为是单页面的，所以必须只有1个 根标签。 以上h1 和 div 都不归 Vue负责<br>
        插值表达式 1， 他可以直接调用 js 中的方法
                  2.他可以进行计算
                  3.可以 用加号 拼接  就是 和 加法计算 不同
                  4.插值表达式，显示 对象的格式  xxx点yyy
                  5.插值表达式，可以做三目（三元）运算，非常重要
        <h2>
            {{sayHello}}<br>    <%--{{是插值表达式}}--%>
            {{sayEating}}<br>
            {{sayEating}}的长度是 {{sayEating.length}}<br>
            {{lightLine}}<br>
            {{apple.pname}}的价格是：{{apple.price / 100}} 元/斤<br>
            {{apple.pname}}的价格是：{{apple.price+''+100}} 元/斤<br>
            <%--当前apple的价格能不能买得起--%>
            当前{{apple.pname}}的价格,哦{{apple.price/100>3.9 ? '太贵了': '价格还算划算,买吧'}}<br>

            使用v-if，当前{{apple.pname}}的价格为<br>
            <div v-if="apple.price/100>3.9">
                    <span style="color: red">太贵了，买不起</span>
            </div>
            <div v-else>
                <span style="color: greenyellow">便宜了，超划算</span>
            </div>
            <br>
            <div v-if="apple.price/100>3.9">
                <span style="color: red">太贵了</span>
            </div>
            <div v-else-if="apple.price/100>3">
                <span style="color: yellow">考虑一下</span>
            </div>
            <div v-else-if="apple.price/100>0">
                <span style="color: green">可以买</span>
            </div>

            <%--刚刚学完vue 的插值表达式，那么 知道 vue的根本核心是这样的，把数据显示到前端
            如果只使用插值表达式显示数据，那么 他的  显示数据的内容 大概就只有这4种，
            果想要达到更强的效果，那么插值表达式是不能够满足的，所以就有了新的方法，叫做指令
            因为 前端 界面是HTML的， 插值表达式 他只能 对 文本信息 做出 数据的渲染。。。 没有对 标签 做出数据的增强
            那么我们就要学习更强的， 就是叫做指令，就是用来弥补插值表达式的不足！！！
            比如说 动态的 改变 金钱的颜色， 超过 2元的是 红色   低于 2元 是 绿色--%>

            <%--上面的改变颜色 不太好实现，那么 我们就引用出来了指令  指令是应用在HTML标签上的
            指令(Directives) 是带有v- 前缀的特殊 attribute 。 指令 attribute 的值预期是 单个JavaScript 表达式（v-for 是例外情况，稍后进行讨论）。
            指令的职责是，当表达式的值改变，其产生连带的影响，响应式的作用于DOM--%>

            <%--学习以下指令 v-text    v-html--%>
            <%--v-text 其实就是 插值表达式--%>
            <br>
            <span v-text="apple.pname"></span>的价格是：{{apple.price / 100}} 元/斤</span><br>
            <%--v-text 的优点: 可以显示出 data数据中的 所有数据--%>
            <span v-text="vtext"></span><br> <%--v-text  不编译文本中的 HTML信息--%>
            <span v-html="vhtml"></span><br><%-- v-html  编译文本中的 HTML信息   一般这个用的比较多，应用场景是：超过50的变颜色--%>
            <span>{{vtext}}</span><br> <%--插值表达式也不编译文本的信息  与v-text 一样--%>
            <%--{{vtext}}想要正常的显示{{}}内容 是不行的--%>
            <span v-pre>{{vtext}}</span>

        </h2>
    </div>
<script>
    $(function () {
        //使用jquery

        //jq的思想，找到同名称是 id xx 的DOM，给他添加数据
        //如果我想改变 显示效果，改成你好，王源， 需要改变jq的代码
        //那么比较频繁，因为 你好世界，没有存统一的变量的地方
        //var str="你好，王源"
        //jquery 的缺点，数据没有同意的地方存储
        $("#jq-helloWorld").text("你好，世界")


        //学习 Vue ，Vue和java很像很像
        var vm = new Vue({
            //new vue()括弧中，小括弧中，一般放的都是{}，而大括号就是json，对象，k-v结构
            //这个大括弧中， 放的就是vue的选项，选项在vue官网可以看到有几个？
            //作业：写出vue选项的 思维导图！！！
            el:'#app',    //把HTML中的 div id 为APP的dom元素 作为了 挂载点
                        //什么叫做挂载点：vue 是以数据驱动的，new vue 中都是诞生数据
                        //有了数据，就需要一个dom元素，显示数据， 张三是元数据。
            data:{
                sayHello:'你好，世界',
                sayEating:'加油，加油',
                lightLine:'发射',
                apple:{
                    pid:2,
                    pname:"红富士",//vue是数据驱动的？  什么是数据驱动，就是数据一改变，前端也进行改变
                    price:358  //单价分  ----显示给前端后，显示元
                },
                vtext:'<h1>你看我是标题不</h1>',
                vhtml:'<h1>你看我是标题不</h1>'

            }
        });
    });
</script>
</body>
</html>
