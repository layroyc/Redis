<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/14
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<html>
<head>
    <title>新增业务</title>
</head>
<body>
<div id="app">  <%--这是挂载点--%>
    <h1>新增业务</h1>
    <form action="" method="post" @Submit.prevent="onSubmit" id="myForm">
    业务类型:<select id="typeSelect" v-model="tBusiness.btype">
        <option :value="item.typeNames" v-for="(item,index) in tTypes">{{item.typeNames}}</option>
                <%--<option value="1">信用卡</option>
                <option value="2">储蓄卡</option>
                <option value="3">VIP卡</option>--%>
          </select>
        <br>

        排队号：<input type="text" v-model="tBusiness.bnum"><br>
        备注信息：<textarea cols="30" rows="10" v-model="tBusiness.bmark"></textarea>
        <br>
        <input type="submit" value="确定添加">

    </form>
    <%--{{tTypes}}--%>
    <%--<div>
        请选择你的英雄：
        <select name="" id="heroSelect">
        <option value="1">韩信</option>
        <option value="2">鲁班七号</option>
        <option value="3">安琪拉</option>
        <option value="4">小乔</option>
        <option value="5">孙悟空</option>
        <option value="6">李白</option>
        <option value="7">李信</option>
    </select>

    </div>--%>
</div>
<script>
   /* $(function () {
        //使用高级版的ajax  axios 异步请求
        // 为给定 ID 的 user 创建请求
        axios.get('/type/selectAll')
            .then(function (response) {//ajax  中的 success
                console.log(response.data.data);
                //尽量不这样做
                /!*$("#typeSelect").empty();//把下拉框下面的数据清空
                $.each(response.data.data,function (index,item) {
                    //jquery+vue
                    var typeNames = item.typeNames;
                    var optionDom = $("<option value='1'>"+typeNames+"</option>")
                    $("#typeSelect").append(optionDom);//ajax异步下拉框
                    //这里发生了延迟   在发送一次异步
                });*!/
            })
            .catch(function (error) {//ajax 中的 error
                console.log(error);
            });

        //发送ajax 得到数据后渲染到 select 框中
        //异步 刷新下拉框
        //方法一：
       /!* $.ajax({
            url:'/type/selectAll',
            type:'post',
            dataType:'json',
            success:function (res) {
                console.log(res)
                var select=$("#typeSelect")
                $.each(res.data,function (index,item) {
                    select.append(new Option(item.typeNames));  //在下拉菜单里添加元素
                });
                layui.form.render("select");
            }
        });*!/
        //方法二：
        /!*$.ajax({//axios是ajax的大哥
            url:'/type/selectAll',
            type:'post',
            dataType:'json',
            success:function (res) {
                console.log(res.data)
                $("#typeSelect").empty();//把下拉框下面的数据清空
                //给id为 typeSelect 渲染数据
                $.each(res.data,function (index,item) {
                    //console.log(item.typeNames)
                    var typeNames = item.typeNames;
                    var optionDom = $("<option value='1'>"+typeNames+"</option>")
                    $("#typeSelect").append(optionDom);//ajax异步下拉框

                });
            }
        });*!/


        //jquery的数据遍历！！！  $.each(数组，方法（数组的索引，具体的数组中的值）{方法执行的体})
        //int age = 5;
        //String name = "郭丹";
      /!*  var names = new Array();//List<String> names = new ArrayList();  names.add(xxx)
            names.push("唐僧");
            names.push("孙悟空");
            names.push("猪八戒");
            names.push("海绵宝宝");
            names.push("派大星");
        //{}都是对象，对象都变成json    []是数组，[]可以包含很多{}，这叫对象集合
        console.log(names)
        $("#heroSelect").empty();//清空

        $.each(names,function (index,item) {
            console.log(index)//数组的索引
            console.log(item)//具体的值  item不是具体的可以随便起
            console.log("3---------")

            $("#heroSelect").append("<option value='1'>"+item+"</option>")
        });*!/
        //作业： 自已写一个葫芦娃的数组
        // ul ---li ， 把以上的 葫芦娃的数据 遍历到 li标签当中
    })*/
    //使用 vue 和axios 发送请求
    var vm = new Vue({  //create 之前

        el:'#app',
        created:function(){
            //在这里写ajax，否则 容易找不到数据
            //使用高级版的ajax  axios 异步请求
            // 为给定 ID 的 user 创建请求
            //官网提供的这个api 是 结合jquery 的ajax 用的，不是结合 vue函数用的
            //那么需要 用到 我们的es 中的 箭头函数来处理
            //在es6 中，箭头函数 是一个缩写，但是功能很强大，可以解决异步渲染问题
            //写法： ()=>{}  小括号等价于大括弧
            /*axios.get('/type/selectAll')
                .then(function (response) {//ajax  中的 success
                    console.log(response.data.data);
                    this.t = response.data.data;
                    console.log(this.tType)
                })*/
            axios.get('/type/selectAll').then((response) => {
                this.tTypes = response.data.data;
            })
        },
        data:{
            tTypes:[],
            tBusiness:{}
        },
        //vue的生命周期    页面加载完毕后，所要加载异步数据的生命周期，也叫做 钩子函数
        //vue的生命周期      new Vue() 的执行过程
        //阻止默认跳转的行为
        methods:{
            onSubmit:function (e) {
                //凡是事件都有个e
                console.log(e)
                console.log(e.target)//vue 的事件  可以通过 e.target 拿到标签中的dom元素

                /*var form = document.getElementById('myForm');
                console.log(form)
                //拿到form表单中的数据
                //看FormData的用法
                var formData = new FormData(form);
                console.log(formData)
                console.log(formData.get('bType'))//脱离了 jquery！！！
*/
                console.log(this.tBusiness)
               /* axios.post('/tBusiness/insert'),{
                    tBusiness:this.tBusiness
                }
                .then(function (response) {
                    console.log(response)

                .catch(function (error) {
                    console.log(error)
                });
   })*/
                axios.post('/tBusiness/insert',{
                    bmark:this.tBusiness.bmark,
                    btype:this.tBusiness.btype,
                    bnum:this.tBusiness.bnum
                }).then((response)=>{
                    if(response.data.code==0){
                        alert(response.data.msg)
                }else{
                        alert("添加失败")
                }
                })
                    /*.then(function (response) {
                        console.log(response);
                        /!*if(response.code==0){
                            alert(response.msg)
                        }else{
                            alert("添加失败")
                        }*!/
                    })
                            .catch(function (error) {
                                console.log(error)
                            });*/

                return false;

        }
   }
    });
</script>
</body>
</html>
