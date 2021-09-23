<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/17
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="app">
    <%--form:post 按tab键--%>
    <form action="https://www.baidu.com" method="post" @Submit.prevent="onSubmit" id="myForm"><%--头上有个onSubmit--%>
        账号：<input type="text" name="adminName"><br>
        密码：<input type="text" name="adminPwd"><br>
        <input type="submit" value="登录">
    </form>
</div>
<script>
    var wm = new Vue({
        el:'#app',
        methods:{
            //阻止默认跳转的行为
            onSubmit:function (e) {
                //凡是事件都有个e
                console.log(e)
                console.log(e.target)//vue 的事件  可以通过 e.target 拿到标签中的dom元素

                var form = document.getElementById('myForm');
                console.log(form)
                //拿到form表单中的数据
                //看FormData的用法
                var formData = new FormData(form);
                console.log(formData)
                console.log(formData.get('adminName'))//脱离了 jquery！！！
                //练习：引入axios，写个ajax 通过post发送到百度中
                axios.post('/https://www.baidu.com')
                    .then(function (response) {
                        console.log(response.data);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                return false;
            }
        }
    });
</script>
</body>
</html>
