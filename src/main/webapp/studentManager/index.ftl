<#include "../macro-head.ftl">
<!DOCTYPE HTML>
<html>
<head>
<@head title="学生管理">
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
</body>
</html>


<#include "../macro-foot.ftl">


