<#include "../macro-head-single.ftl">
<!DOCTYPE html>
<html>
<head>
<@head title="欢迎">
    </@head>
</head>
<body>
<div class="wrapper">
    <div class="container">
        <h1>在线调查</h1>
        <form class="form">
            <input type="text" id="name" name="name" placeholder="姓名">
            <button data-style="slide-up" id="login-btn" class="btn btn-lg ladda-button" data-spinner-color="#75d9b7"
                    data-size="s" tabindex="10">
                <span class="ladda-label">进入</span>
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
</body>
</html>
<script src="${staticServePath}/assets/js/jquery-1.10.2.js?${staticResourceVersion}"></script>
<script src="${staticServePath}/static/js/lib/spin.min.js?${staticResourceVersion}"></script>
<script src="${staticServePath}/static/js/lib/ladda.min.js?${staticResourceVersion}" type="text/javascript"></script>
<script src="${staticServePath}/static/js/lib/jquery.transit.js?${staticResourceVersion}"
        type="text/javascript"></script>
<script src="${staticServePath}/static/js/common.js?${staticResourceVersion}" type="text/javascript"></script>

<script type="text/javascript">
    $('#login-btn').click(function (event) {
        event.preventDefault();
        var btn = Ladda.create(document.querySelector("#login-btn"));
        btn.start();
        var jsonObj = {
            name: $("#name").val().replace(/(^\s*)|(\s*$)/g, ""),
        };
        $.ajax({
            type: "post",
            url: "/registerName",
            dataType: "json",
            data: jsonObj,
            success: function (data) {
                if (data.state == "success") {
                    $("form").fadeOut(500);
                    $(".wrapper").addClass("form-success");
                    setTimeout(function () {
                        location.href = "/surveys/?code="+jsonObj.name;
                    }, 1000);
                } else {
                    Util.showTip($("#loginTip"), data.msg, 'alert alert-danger');
                }
                btn.stop();
            },
            error: function () {
                Util.showTip($("#loginTip"), "服务器错误!", 'alert alert-danger');
                setTimeout(function () {
                    btn.stop();
                }, 3500);
            }
        })
    });
</script>
