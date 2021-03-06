<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0,minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>模切之家</title>
    <meta http-equiv="x-ua-compatible" content="IE=edge" />
    <meta name="renderer" content="webkit" />
    <script src="//cdn.bootcss.com/angular.js/1.4.9/angular.min.js"></script>
    <link href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">  
    <link rel="stylesheet" href="/public/css/wm-ui-v1.2.css" type="text/css" />
    <style>
        .forget{font-size: .9rem;padding-top: .6rem}
        .reg-wrapper .wm-input{margin-bottom: 1px;border-bottom: solid 1px #eee; padding: .6rem 0; }

    </style>
</head>
<body ng-app="apps">
<header class="wm-head container" style="background: #fff;">
    <div class="col-flex-between"><a href="<?php echo U('portal/index/index');?>" class="back"></a>
    <a href="<?php echo U('user/register/index');?>" class="col-bar text-right" style="font-size:.65rem;color:red;">注册</a>
    </div>
    <h1>
        登陆
    </h1>
</header>
<div class="logo">
    <a href="/"><img src="/public/images/logo.png" /></a>
</div>
<section class="reg-wrapper" >
    <div id="showHTML"></div>
    <form ajax-form action="<?php echo U('user/login/dologin');?>" onsubmit="return false" name="form1" id="form1" method="post" >
        <div class="wm-input">
            <input type="text" name="username" placeholder="请输入您的手机号码" />
        </div>
        <div class="wm-input">
            <input type="password" name="password" placeholder="请输入密码" />
        </div>
        <div class="text-right" style="font-size:.8rem;padding: .6rem;">
            <a href="<?php echo U('user/login/forgot_password');?>"  >忘记密码?</a>
        </div>
        <div style="margin-top:1rem;padding:0 .6rem;">
        <button type="submit" class="wm-btn btn-danger">登陆</button>
        </div>
    </form>
</section>
</body>
<script type="text/javascript" module="apps" src="/public/angular.tips.js"></script>
</html>