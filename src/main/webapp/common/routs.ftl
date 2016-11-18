<#include "../macro-item.ftl">
<@item>
<div class="panel-heading title">
${view.title}
</div>
<div class="panel-body">
    <#list outLinks as link>
        <a href="http://${link["url"]}" class="out-link pull-left" target="_blank">
            <img class="img-sm center-block far-top" src="${staticServePath}/images/${link["icon"]}">
            <div class="far-top far-bottom text-center">${link["name"]}</div>
        </a>
    </#list>
</div>
</@item>