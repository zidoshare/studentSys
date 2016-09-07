<!DOCTYPE html>
<html>
<head>
    <title>添加大类型</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../static/css/lib/bootstrap.min.css">
</head>
<body>
<#include "macro-head.ftl">
<div class="container">
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-md-6 col-lg-6 form bg-info">
            <div class="form-group">
                <label for="name">类型名：</label>
                <input id="name" type="text" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="sort">sort:</label>
                <input id="sort" type="text" class="form-control"/>
            </div>
            <button onclick="post()" class="btn btn-success center-block">提交</button>
            <hr/>
            <h3>已有:</h3>
        <#if bigTypes?size gt 0>
            <#list bigTypes as type>
                <p>名字：${type.name} · sort:${type.sortFlag}</p>
            </#list>
        </#if>
            <div id="flag"></div>
        </div>
        <div class="col-lg-3"></div>
    </div>
</div>

</body>
<script src="../static/js/lib/jquery-3.1.0.min.js"></script>
<script>
    function post() {
        event.preventDefault();
        var name = $("#name").val();
        var sort = $("#sort").val();
        $.ajax({
            type: "post",
            url: "/test/postBigType",
            data: {
                "questionBigType.name": name,
                "questionBigType.sort_flag": sort
            },
            success: function (data, textStatus) {
                if (data.state == "success") {
                    $("#flag").append('<p>名字：' + name + ' · sort:' + sort + '</p>');
                }
                alert(data.msg);
            },
            error: function (data) {
                alert("错误");
            }
        });
        return false;
    }
</script>
</html>