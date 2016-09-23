<#include "../macro-head.ftl">
<!DOCTYPE HTML>
<html>
<head>
<@head title="${now.title}">
    </@head>
</head>
<body>
<div class="wrapper">
<#include "../macro-left.ftl">
</div>
<div id="page-wrapper">

    <div id="page-inner">
        <div class="row animate">
            <div class="col-md-12">
                <div class="panel panel-default item">
                    <div class="row">

                        <#list content as c>
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