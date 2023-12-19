<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>系统功能菜单</div>
    
    <dl class="leftmenu">
    
     <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>学生信息管理
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="right.html" target="rightFrame">添加学生</a><i></i></li>
        <li ><cite></cite><a href="right.html" target="rightFrame">学生列表</a><i></i></li>
        </ul>    
    </dd>
        
    <dd id="studentIqCard">
    <div class="title">
    <span><img src="images/leftico01.png" /></span>校园IQ卡管理
    </div>
    	<ul class="menuson">
    	 <li><cite></cite><a href="right.html" target="rightFrame">添加卡片</a><i></i></li>
        <li><cite></cite><a href="right.html" target="rightFrame">卡信息管理</a><i></i></li>
        
       

        </ul>    
    </dd>   
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>就业信息管理
    </div>
    	<ul class="menuson">
    	 <li><cite></cite><a href="right.html" target="rightFrame">添加就业详情</a><i></i></li>
        <li><cite></cite><a href="right.html" target="rightFrame">就业信息列表</a><i></i></li>
     
        </ul>    
    </dd>     
        
     <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>考勤信息管理
    </div>
    	<ul class="menuson">
    	 <li><cite></cite><a href="right.html" target="rightFrame">添加请假单</a><i></i></li>
    	 <li><cite></cite><a href="right.html" target="rightFrame">老师批复</a><i></i></li>
         <li><cite></cite><a href="right.html" target="rightFrame">请假批复情况</a><i></i></li>
     	 <li><cite></cite><a href="right.html" target="rightFrame">请假信息查询</a><i></i></li>
     	 <li><cite></cite><a href="right.html" target="rightFrame">我的上课考勤</a><i></i></li>
        </ul>    
    </dd>     
            
   
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>用户管理
    </div>
    <ul class="menuson">
           <li><cite></cite><a href="form.html" target="rightFrame">添加用户</a><i></i></li>
       <li><cite></cite><a href="UserList.jsp" target="rightFrame">用户数据</a><i></i></li>
        </ul>   
         
    </dd> 
      <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>新闻公告
    </div>
    <ul class="menuson">
           <li><cite></cite><a href="form.html" target="rightFrame">发布公告</a><i></i></li>
       <li><cite></cite><a href="UserList.jsp" target="rightFrame">公告历史列表</a><i></i></li>
        </ul>   
         
    </dd> 
    
        <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>实践活动
    </div>
    <ul class="menuson">
           <li><cite></cite><a href="form.html" target="rightFrame">发布实践</a><i></i></li>
       <li><cite></cite><a href="UserList.jsp" target="rightFrame">活动信息及报名</a><i></i></li>
        </ul>   
         
    </dd> 
    
    
    </dl>
    
    
</body>

</html>

