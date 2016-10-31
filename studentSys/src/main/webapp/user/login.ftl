<#include "../macro-head-single.ftl">
<!doctype html>
<html lang="zh-CN">
<head>
    <@head title="登录">
        <link rel="Shortcut Icon" href="${staticServePath}/images/favicon.ico" />
    </@head>
</head>
<body>
<div class="wrapper">
    <div class="container">
        <h1><span class="text-bg">CRM</span><span class="text-md">管理系统</span></h1>
        <form class="form">
            <input type="text" id="account" name="account" placeholder="账号/手机号">
            <input type="password" id="password" name="password" placeholder="密码">
            <button data-style="slide-up" id="login-btn" class="btn btn-lg ladda-button" data-spinner-color="#75d9b7" data-size="s" tabindex="10" onclick="Login.login()">
                <span class="ladda-label">登录</span>
            </button>
        <#--<button type="button" id="login-button" onclick="Login.login()">登录</button>-->
        </form>
        <div class="whole-container">
            <div class="tip" id="wholeTip" aria-label="0">
            </div>
        </div>
    </div>

    <ul class="bg-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>

</div>

<div class="to-bottom text-center text-sm" style="z-index: 1000;">
<div style="width: auto;display: table;" class="center-block">
<#list outLinks as link>
    <a href="http://${link["url"]}" class="out-link pull-left" target="_blank">
        <img class="img-sm center-block far-top" src="${staticServePath}/images/${link["icon"]}">
        <div class="far-top far-bottom text-center">${link["name"]?html}</div>
    </a>
</#list>
</div>
    <div>Copyright © 2014-2016 互动无限科技有限公司</div>
</div>
</body>
</html>
<script type="text/javascript">
    var Label = {
        staticServePath: "${staticServePath}",
        servePath: "${servePath}",
        isLogin:${isLogin?c},
        loginRole: "${loginRole}",
        loginNameErrorLabel: "${loginNameErrorLabel}",
        invalidPasswordLabel: "${invalidPasswordLabel}"
    };
</script>