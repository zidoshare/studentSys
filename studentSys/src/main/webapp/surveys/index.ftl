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
            <input type="text" id="class" name="class" placeholder="班级">
            <button data-style="slide-up" id="login-btn" class="btn btn-lg ladda-button" data-spinner-color="#75d9b7"
                    data-size="s" tabindex="10">
                <span class="ladda-label">进入</span>
            </button>
        <#--<button type="button" id="login-button" onclick="Login.login()">登录</button>-->
        </form>
        <div class="tip-container">
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


</body>
</html>
<script type="text/javascript">
    function start(code) {
        var str = "questionnaire/" + code;
        var trs = $("#ids").find("input[type='checkbox']");
        trs.each(function () {
            var b = $(this).first().is(':checked');
            var id = $(this).attr('id');
            if (b == true)
                str += "-" + id;
        });
        window.location.href = str;
    }
    $('#login-btn').click(function (event) {
        var evt = arguments.callee.caller.arguments[0] || window.event;
        evt.preventDefault();
        evt.stopPropagation();
        var btn = Ladda.create(document.querySelector("#login-btn"));
        btn.start();
        var jsonObj = {
            name: $("#name").val().replace(/(^\s*)|(\s*$)/g, ""),
            className: $("#class").val().replace(/(^\s*)|(\s*$)/g, "")
        };
        $.ajax({
            type: "post",
            url: "${staticServePath}/registerName",
            dataType: "json",
            data: jsonObj,
            success: function (data) {
                if (data.state == "success") {
                    $("form").fadeOut(500);
                    $(".wrapper").addClass("form-success");
                    setTimeout(function () {
                        btn.stop();
                        window.location.href = data.msg;
                    }, 1000);
                } else {
                    Util.showTip($("#wholeTip"), data.msg, 'alert alert-danger');
                }
            },
            error: function () {
                Util.showTip($("#wholeTip"), "服务器错误!", 'alert alert-danger');

            },
            complete: function () {
                btn.stop();
            }
        })
    });
</script>
