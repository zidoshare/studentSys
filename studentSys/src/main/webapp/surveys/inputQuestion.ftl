<!DOCTYPE HTML>
<html>
<head>
    <title>添加问题</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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

<div class="row">
    <div class="col-sm-3 col-md-3 col-lg-3"></div>
    <div class="col-sm-6 col-md-6 col-lg-6 form bg-info">
        <div class="form-group">
            <label for="title">大分类：</label>
            <select class="form-control" id="bigType">
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
                <button onclick="submitQuestion()" class="btn btn-success">提交</button>
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

</body>
<script type="text/javascript">

</script>
</html>
