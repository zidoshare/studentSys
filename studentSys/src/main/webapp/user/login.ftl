<#include "../macro-head-single.ftl">
<!doctype html>
<html lang="zh-CN">
<head>
    <@head title="登录">
    </@head>
</head>
<body>
<div class="wrapper">
    <div class="container">
        <h1>CRM管理系统</h1>
        <form class="form">
            <input type="text" id="account" name="account" placeholder="账号">
            <input type="password" id="password" name="password" placeholder="密码">
            <button data-style="slide-up" id="login-btn" class="btn btn-lg ladda-button" data-spinner-color="#75d9b7" data-size="s" tabindex="10" onclick="Login.login()">
                <span class="ladda-label">登录</span>
            </button>
        <#--<button type="button" id="login-button" onclick="Login.login()">登录</button>-->
        </form>
        <div class="tip-container">
            <div class="tip" id="loginTip" aria-label="0">
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
<div class="to-bottom text-black text-center">
    版权所有:成都互动无限有限公司
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