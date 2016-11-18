<#include "../macro-head.ftl">
<!DOCTYPE HTML>
<html>
<head>
<@head title="${now.title}">
    </@head>
</head>
<body class="bg-black">
<div class="wrapper">
<#include "../macro-left.ftl">
</div>
<div id="page-wrapper">
    <div class="pjax_loading" style="display: none;">
        <div id="contain">
            <div class="wrap" id="wrap1">
                <div class="part" id="part1"></div>
            </div>

            <div class="wrap" id="wrap2">
                <div class="part" id="part2"></div>
            </div>

            <div class="wrap" id="wrap3">
                <div class="part" id="part3"></div>
            </div>

            <div class="wrap" id="wrap4">
                <div class="part" id="part4"></div>
            </div>
        </div>
    </div>
    <div id="page-inner">
        <div class="row animate">
            <div class="col-md-12">
                <div class="panel panel-default item">
                    <div class="row">

                        <#list views as c>
                            <div class="col-md-6 col-sm-12 col-xs-12 col-lg6">
                                <#include c.url>
                            </div>
                        </#list>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<#include "../macro-foot.ftl">