<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/17
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<html>
<head>
    <title>vue基础一般代码</title>
</head>
<body>
<div id="app">
    <div style="width: 800px;height: 1024px;border: black solid 1px">
        <p>添加产品</p>
        请添加水果名称：<input type="text" v-model="name" maxlength="7" placeholder="名称不能超过7个字符" @input="descInput">字符长度是:{{name.length}}<br>
        请添加水果价格：<input type="text" :value="apple.price">分<br>
        请添加水果的数量：<input type="text" v-model="pid">个 &nbsp;
                <button @click="subtract()">-</button>
                <input type="text"  size="2" v-model="pid">
                <button @click="add()">+</button>

        <br>

        因为是number所以没有长度：<input type="text" v-model="pid"><br>
        自动算水果价格： <span style="color: red;">{{(apple.price/100)*pid}}</span>元<br>
        请添加水果简介：<br>
        <textarea cols="30" rows="10"></textarea><br>
        请添加水果有无包装盒：
        <input type="radio" id="one" value="有" v-model="picked" checked="checked">
        <label for="one">有</label>
        <input type="radio" id="two" value="没有" v-model="picked">
        <label for="two">没有</label>&nbsp;
        <span>{{picked}}</span>
        <br>
        请添加水果状态(下拉):
        <select v-model="selected">
            <option v-for="option in options" v-bind:value="option.value">
                {{ option.text }}
            </option>
        </select>
        选中的水果状态是<span>{{selected}}</span>
        <br>
        请添加水果口味(多选):<br>
        <input type="checkbox" id="酸甜" value="1" v-model="checkedKouwei">
        <label for="酸甜">酸甜</label>
        <br>
        <input type="checkbox" id="酸" value="2" v-model="checkedKouwei">
        <label for="酸">酸</label>
        <br>
        <input type="checkbox" id="甜" value="3" v-model="checkedKouwei">
        <label for="甜">甜</label>
        <br>
        <input type="checkbox" id="苦涩" value="4" v-model="checkedKouwei">
        <label for="苦涩">苦涩</label>
        <br>
        <input type="checkbox" id="臭中香如榴莲" value="5" v-model="checkedKouwei">
        <label for="臭中香如榴莲">臭中香如榴莲</label>
        <br>
        <span>选中的口味代码: {{ checkedKouwei }}</span>

    </div>
</div>
    <script>
        var wm = new Vue({
            el:'#app',
            data:{
                name:'',
                pid:'0',
                apple:{
                    pname:'灵宝苹果',
                    price:398   //分
                }
                ,picked: '',
                selected: '1',
                options: [
                    { text: '新鲜', value: '1' },
                    { text: '蔫了', value: '2' },
                    { text: '腐烂', value: '3' }
                ],
                checkedKouwei: [],
                return:{enter:0}

            },
            methods:{
                descInput:function() {
                    var txtVal = this.name.length;
                    this.enter = txtVal;
                },
                subtract:function(){
                    if (this.pid<=0){
                        alert('受不了哦，宝贝不能再减少啦')
                        this.pid=0;
                    }else {
                        this.pid-=1;
                    }
                },
                add:function(){
                    if(this.pid>0){
                        this.pid++;
                    }
                }
            }
        });
    </script>
</body>
</html>
