<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/16
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>双向渲染</title>
</head>
<body>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
    <div>
        <%--vue 需要一个根目录的标签--%>
        <div id="app">
            <%--双向绑定--%>
            <%--双向绑定， 数据和页面的展示  的数据效果 是一起的，保持一致的，
            当vue 中data的数据发生了改变， 那么展示的效果也发生了改变--%>
            姓名（以前是这样写的）：<input type="text" value="王源">
            <%--vue的核心是 把数据渲染到html 中，分为 标签和文本，--%>
                <%--  那么文本，是用 插值表达式--%>
                姓名：{{name}}<br>
                <%--下面是渲染到标签中--%>
                <%--v-bind是绑定标签中的属性的 一经过绑定，数据就是动态的，就要写data的K--%>
            vue --姓名（以前是这样写的）：<input type="text" v-bind:value="name"><br>
            vue --姓名（以前是这样写的）v-bind的缩写: <input type="text" :value="name"><br>

            <%--以上是数据的单项绑定，数据绑定到了  显示效果--%>
            vue --姓名（以前是这样写的）v-bind的双向绑定: <input type="text" v-model="name"><br>
               <%--v-model 双向绑定 作用在 4个范围上  input标签，select标签， textarea 标签，components组件--%>


                <%-- v-model是 v-bind 的升级版，其本质是 一个语法糖，什么是语法糖，--%>
         <%--  java中     for循环就是语法糖，for循环的本质就是while循环，语法糖，就是简化了代码的书写--%>

            <%--只渲染一次的指令，v-once --%>
            姓名：<span v-once>{{name}}</span><br>

        </div>
    </div>

    <script>
        var wy = new Vue({
            el:'#app',
            data:{
                name:'王源roy'
            }
        });
    </script>

</body>
</html>
