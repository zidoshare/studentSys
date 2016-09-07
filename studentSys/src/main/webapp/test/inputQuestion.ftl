<!DOCTYPE HTML>
<html>
<head>
    <title>添加问题</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="../static/css/lib/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<#include "macro-head.ftl">
<div class="container">
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-md-6 col-lg-6 form bg-info">
            <div class="form-group">
                <label for="title">标题：</label>
                <input type="text" id="title" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="title">大分类：</label>
                <select class="form-control" id="bigType">
                    <#if bigTypes?size gt 0>
                        <#list bigTypes as type>
                            <option value="${type.id}">${type.name}</option>
                        </#list>
                    <#else>
                        <option value="-1">无</option>
                    </#if>
                </select>
            </div>
            <div class="form-group">
                <label for="type">类型：</label>
                <select id="type" class="form-control">
                    <option value="0">单选</option>
                    <option value="1">多选</option>
                    <option value="2">简答</option>
                </select>
            </div>
            <div class="form-group">
                <label for="content">内容</label>
                <textarea id="content" class="form-control" rows="5"></textarea>
            </div>
            <div class="form-group">
                <label for="score">分数：</label><input type="text" class="form-control" value="1" id="score"/>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-10">
                    <button onclick="submit()" class="btn btn-success">提交</button>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<script src="../static/js/lib/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    function submit() {
        event.preventDefault();
        var title = $("#title").val();
        var bigType = jQuery("#bigType  option:selected").val();
        var type = jQuery("#type  option:selected").val();
        var content = $("#content").val();
        var score = $("#score").val();
        alert(title + ":" + bigType + ":" + type + ":" + content + ":" + score);
        $.ajax({
            type: "post",
            url: "/test/postQuestion",
            data: {
                "questions.title": title,
                "questions.type": type,
                "questions.big_type_id": bigType,
                "questions.content": content,
                "questions.option_score": score
            },
            success: function (data, textStatus) {
                alert(data.msg);
            },
            error: function () {
                alert("错误");
            }
        });
    }
</script>
</html>
