<#include "../macro-head.ftl">
<!DOCTYPE HTML>
<html>
<head>
<@head title="首页">
    </@head>
</head>
<body>
<div class="wrapper">
<#include "../macro-left.ftl">
</div>
<div id="page-wrapper">

    <div id="page-inner">
    <#list content as c>
        <#include c.url>
    </#list>
    </div>
<#include "../macro-foot.ftl">
</body>
</html>



