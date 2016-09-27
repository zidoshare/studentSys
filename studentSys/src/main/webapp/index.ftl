<#include "macro-head.ftl">
<!DOCTYPE HTML>
<html>
<head>
<@head title="${now.title}">
    </@head>
</head>
<body class="bg-black">
<div class="wrapper">
<#include "macro-left.ftl">
</div>
<div id="page-wrapper">

    <div id="page-inner">
    <#list views as view>
            <#include view.url>
        </#list>
    </div>
</div>
</body>
</html>
<#include "macro-foot.ftl">