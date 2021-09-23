<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/16
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--作业1：把葫芦娃数据渲染到下拉框中，当点击 大娃 后面 接上 文本, 显示力大无穷--%>
<div id="app">
    <%--<select name="" v-on:click="showHuLuWa()">
        <option value="">--请选择--</option>
        <option v-for="(item,index) in hulusi" :key="hulusi.id" >{{item.name}}</option>
    </select>--%>
        <select name="" v-on:click="showHuLuWa()" v-model="selected">
            <option value="">--请选择--</option>
            <option v-for="(item,index) in hulusi" :key="hulusi.id" v-bind:value="item.spell">{{item.name}}</option>
        </select>
    <textarea cos="20" rows="10">{{selected}}</textarea>
</div>

<script>
    var wm = new Vue({
        el:'#app',
        data:{
            hulusi:[
            ],
            selected:'力大无穷'
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
            }
        }
    });

</script>

</body>
</html>
