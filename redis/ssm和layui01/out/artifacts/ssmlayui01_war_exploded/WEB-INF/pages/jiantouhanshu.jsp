<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/18
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<html>
<head>
    <title>箭头函数</title>
</head>
<body><%--
古老的函数<br>
    x:<input type="text" id="xinput" value="5"> + y:<input type="text" id="yinput" value="10"> = <span id="sumSapn"></span>
 <br>--%>
箭头函数<br>
    x:<input type="text" id="mInput" value="5"> + y:<input type="text" id="nInput" value="10"> = <span id="sumSapnJianTou"></span>
    <script>
        $(function () {
            var num1 = $("#mInput").val();
            var num2 = $("#nInput").val();
            console.log(sum(num1,num2))
            $("#sumSapn").text(sum(num1,num2))

            //箭头函数      ----去掉方法名，箭头函数类似  java中的匿名类
            var jianSum=(num1,num2) => {num1 * num2};//写的是对的，没有编译，vue中可以
            $("sumSapnJianTou").text(jianSum)
        });
        //古老的函数
            function sum(num1,num2) {
                return num1*num2;
            }

            //当箭头的  形参是一个的 是可以 省略 括号的
        function mySum(num) {
            return num;
        }
        //省略层
        var mySub1 = num => num;


    </script>
</body>
</html>
