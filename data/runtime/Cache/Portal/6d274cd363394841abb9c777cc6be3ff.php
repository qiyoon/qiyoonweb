<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0,minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="full-screen" content="yes">
    <meta name="x5-fullscreen" content="true">
    <meta name="browsermode" content="application">
    <title>模切之家</title>
    <meta http-equiv="x-ua-compatible" content="IE=edge" />
    <meta name="renderer" content="webkit" />
    <script src="//cdn.bootcss.com/angular.js/1.4.9/angular.min.js"></script>
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/r29/html5.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/css/wm-ui.css" type="text/css" />
    <link rel="stylesheet" href="/public/css/style.css" type="text/css" />

</head>
<body ng-app="myApp">

<header class="wm-head wm-container">
    <a href="javascript:history.back();" class="back" ></a>
    <h1>
        资讯
    </h1>
</header>
<section class="news-wrapper" ng-controller="tabCtrl">
    <nav class="news-nav">
        <ul>
            <li ng-click="getNews(xx.term_id)" class="{{xx.active}}" ng-repeat="xx in tabMenu" ><span ng-bind="xx.title"></span><label class="label " ng-style="xx.color">hot</label></li>
            <!--<li  ng-click="getNews()">活动<label class="label label-ah">hot</label></li>
            <li  ng-click="getNews()">行业<label class="label">hot</label></li>-->
        </ul>
    </nav>
    <article class="container" ng-init="loadHtml=false;contentHtml=true">
        <div  ng-hide="loadHtml" style="text-align: center;padding: 1rem;font-size: 1rem;"><i class="fa fa-spinner fa-spin"></i></div>
        <ul class="news-list" ng-hide="contentHtml">
            <li ng-repeat="x in content"><a href="<?php echo UU('posts/newsinfo');?>&newsid={{x.id}}">
                <h3 ng-bind="x.title"></h3>
                <div class="news-content clearfix" >
                    <div class="text" >{{x.content}}
                        <h5 class="clearfix"><span class="pull-left">{{x.post_hits}}次</span> <span class="pull-right">{{x.post_modified}}天前</span></h5>
                    </div>
                    <div class="img">
                        <img src="{{x.thumb}}"  />
                    </div>
                </div></a>
            </li>
        </ul>
    </article>
</section>
<footer class="footer">
    <dl class="nav-list">
        <a href="<?php echo UU('index/index');?>">
            <dd data-nav-home><!--<img src="images/nav_01.png" />--> </dd>
            <dt>首页</dt>
        </a>
    </dl>
    <dl class="nav-list ">
        <a href="<?php echo UU('dslist/dslist');?>" >
            <dd data-nav-market><!--<img src="images/nav_02.png" /> --></dd>
            <dt>商城</dt>
        </a>
    </dl>
    <dl class="nav-list active">
        <a href="<?php echo UU('posts/news');?>" >
            <dd data-nav-news></dd>
            <dt>资讯</dt>
        </a>
    </dl>
    <!-- yhx 20160510 -->
    <dl class="nav-list">
        <a href="<?php echo UU('mine/index');?>" >
            <dd data-nav-my></dd>
            <dt>我的</dt>
        </a>
    </dl>
</footer>
<script>
    var app = angular.module("myApp",[]);
        app.controller("tabCtrl",function($scope,$http,$location){

            $scope.tabMenu = angular.fromJson('<?php echo (json_encode($terms)); ?>');
            console.log($scope.tabMenu);
            $scope.limit = 10;
            $scope.tabMenu[0].active = 'active';
            $scope.tabMenu[0].color = {"background-color":"#E2242E"}
            $scope.tabMenu[1].color = {"background-color":"#c218f4"}
            $scope.tabMenu[2].color = {"background-color":"#01cdb4"}
            var c_termid;
            if($location.hash()){
                c_termid = $location.hash();
                angular.forEach($scope.tabMenu,function(v,k){
                    if(v.term_id==c_termid){
                         $scope.tabMenu[0].active = ""
                         $scope.tabMenu[1].active = ""
                         $scope.tabMenu[2].active = ""
                        $scope.tabMenu[k].active = 'active';
                    }
                })
            }else{
                c_termid = $scope.tabMenu[0].term_id;
                //$scope.focusId = $scope.tabMenu[0].term_id;
            }
            $scope.focusId = c_termid;
            $http.post('<?php echo U("posts/news");?>',{termid:c_termid}).success(function(data){
                if(data) {
                    $scope.loadHtml = true;     //正在加载
                    $scope.contentHtml =false;     //加载完成显示内容
                    $scope.content = data;
                }
            })
            $scope.getNews = function(id){
                $scope.loadHtml = false;     //正在加载
                $scope.contentHtml = true;     //加载完成显示内容

                $scope.limit = 10;  //每次tab分类 初始化限制数量
                $scope.focusId = id;
                angular.forEach($scope.tabMenu,function(v,k){
                    $scope.tabMenu[k].active = "";
                    if(id == v.term_id){
                        $scope.tabMenu[k].active = "active";
                    }
                })
                $http.post('<?php echo UU("posts/news");?>',{ termid: id ,limit:0}).success(function(data){

                    if(data) {
                        $scope.loadHtml = true;     //正在加载
                        $scope.contentHtml =false;     //加载完成显示内容
                        $scope.content = data;
                    }
                })
            }
            //滚动事件
            window.onscroll = function(){
                var sH = document.body.scrollHeight;
                var cH = document.body.clientHeight;
                var sT = document.body.scrollTop;
                console.log($scope.focusId)
                if(cH+sT == sH) {
                    $http.post('<?php echo U("posts/news");?>', {
                        termid: $scope.focusId,
                        limit: $scope.limit
                    }).success(function (data) {
                        $scope.limit = $scope.limit + 10;
                        $scope.content = $scope.content.concat(data);
                       /* console.log($scope.limit);
                        console.log(data);*/
                    })
                }
            }
        });
</script>
</body>
</html>