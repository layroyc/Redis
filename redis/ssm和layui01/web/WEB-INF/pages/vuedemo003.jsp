<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/16
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>v-on v-show v-for</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
</head>
<body>
    <div id="app">
        <%--v-on 后面跟的是HTML中的事件    而v-bind后面接的是HTML中的属性--%>
        <input type="button" value="点击在ul中显示 葫芦娃的列表" @:click="showHuLuWa()">
        <ul>
            <%--直接显示到页面中--%>
            <li v-for="(item,index) in hulusi" :key="hulusi.id">{{item.name}}</li>
        </ul>
    </div>
    <%--作业1：把葫芦娃数据渲染到下拉框中，当点击 大娃 后面 接上 文本, 显示力大无穷--%>
    <%--<select v-on:change="selectWaWa(hulusiSpell)" v-model="hulusiSpell">
        <option :value="item.spell" v-for="(item,index) in hulusi">{{item.name}}</option>
    </select>
    <span>{{hulusiSpell}}</span><br>--%>
    <%--v-on: 事件绑定的 缩写是 @--%>
    <select v-model="hulusiSpel" @change="selectWaWa(hulusiSpel)">
        <option  v-for="(item,index) in hulusi" :key="hulusi.id" :value="item.spell">{{item.name}}</option>
    </select>
    <span>{{hulusiSpel}}</span> <br>

    <%--v-show 如果 为false 那么， 前端界面 是 不显示 代码的--%>
    <%--注意，v-show 不支持 <template> 元素，也不支持 v-else--%>
    <span v-show="ok">你看到我了吗？</span>
<script>
    var wm = new Vue({
        el:'#app',
        data:{
            hulusi:[],
            hulusiSpel:'',
            ok:false
        },
        methods:{
            showHuLuWa:function () {//没有方法名了
                var arr = [{
                    id:1,
                    name:'大娃',
                    spell:'力大无穷'
                },
                    {
                        id:2,
                        name:'二娃',
                        spell:'千里眼 顺风耳'
                    },
                    {
                        id:3,
                        name:'三娃',
                        spell:'金刚不坏'
                    },
                    {
                        id:4,
                        name:'四娃',
                        spell:'水娃'
                    },
                    {
                        id:5,
                        name:'五娃',
                        spell:'火娃'
                    },
                    {
                        id:6,
                        name:'六娃',
                        spell:'隐身蓝娃'
                    },
                    {
                        id:7,
                        name:'七娃',
                        spell:'葫芦紫娃'
                    }];
                this.hulusi = arr;
            },
            selectWaWa:function (hulusiSpel) {
                console.log("我选中了一个娃娃"+hulusiSpel);
            }
        }
    });


</script>
</body>
</html>
