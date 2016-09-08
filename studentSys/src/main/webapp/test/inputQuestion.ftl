<!DOCTYPE HTML>
<html>
<head>
    <title>添加问题</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="../static/css/lib/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
        .item > input, .item > textarea {
            float: left;
        }

        .item > input {
            margin-left: 20px;
            width: 20% !important;
        }

        .item > textarea {
            width: 75% !important;
        }

        .item {
            margin-top: 5px;
        }
    </style>
</head>
<body>
<#include "macro-head.ftl">
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3 col-lg-3"></div>
        <div class="col-sm-6 col-md-6 col-lg-6 form bg-info">
            <div class="form-group">
                <label for="title">大分类：</label>
                <select class="form-control" id="bigType">
                    <option value="-1">无</option>
                <#if bigTypes?size gt 0>
                    <#list bigTypes as type>
                        <option value="${type.id}">${type.name}</option>
                    </#list>
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
                <label for="title">标题：</label>
                <input type="text" id="title" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="content">选项·分数：</label>
                <br/>
                <button onclick="addSelect()" id="add" class="btn btn-success btn-sm">添加选项</button>
                <button onclick="removeSelect()" id="remove" class="btn btn-success btn-sm">删除选项</button>
            </div>
        <#--<div class="form-group">
            <label for="score" class="sr-only">分数：</label><input type="text" class="form-control" value="1" id="score"/>
            <div id="score-flag"></div>
        </div>-->
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-10">
                    <button onclick="submit()" class="btn btn-success">提交</button>
                </div>
            </div>

        </div>
        <div class="col-sm-3 col-md-3 col-lg-3">
            <div id="q-flag">
                <#if questions?size gt 0>
                    <h1>共<label id="maxRow">${maxPage}</label>条</h1>
                    <#list questions as question>
                        <p>${question.title}</p>
                    </#list>
                </#if>
            </div>
        </div>
    </div>
</div>
</body>
<script src="../static/js/lib/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    var sid = 0;
    var word = "a";
    function submit() {
        var title = $("#title").val();
        var bigType = jQuery("#bigType  option:selected").val();
        var type = jQuery("#type  option:selected").val();
        var c = new Array();
        var s = new Array();
        /*var content = "{[\"";*/
        for (var i = 0; i < sid; i++) {
            /*content += i+"\":\"";
            content += $("#select"+i).val()+"\",";*/
            c[i] = $("#select" + i).val();
            s[i] = $("#score" + i).val();
        }
        /*content = content.substring(0,content.length-1);
        content+="]}";*/
        var content = c.join("&&^&&");
        var score = s.join("&&^&&");
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
                if(data.state == "success") {
                    $("#q-flag").append("<p>" + title + "<p>");
                    var row = parseInt($("#maxRow").text());
                    $("#maxRow").text(row + 1);
                }
            },
            error: function () {
                alert("错误");
            }
        });
    }
    function addSelect() {
        $("#add").before("<div class=\"item clearfix\"><textarea class=\"form-control\" rows=\"2\" placeholder=\"" + String.fromCharCode(word.charCodeAt() + sid) + "\"  id=select" + (sid) + "></textarea>" +
                "<input type=\"text\" class=\"form-control\" value=\"1\" id=\"score" + sid++ + "\"/>" +
                "</div>");
    }
    function removeSelect() {
        var s = $("#add").prev();
        if (s.attr("class") == "item") {
            s.remove();
            sid--;
        }
    }
</script>
</html>
