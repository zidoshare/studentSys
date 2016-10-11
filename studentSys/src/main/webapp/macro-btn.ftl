<#assign updateAble = false>
<#assign deleteAble = false>
<#assign addAble = false>
<#assign addBtn = "">
<#assign updateBtn = "">
<#assign deleteBtn = "">
<#macro macroUpdateBtn id>
    <#assign updateBtn = "<a onclick=\"func.${op.url}('show','${id}');\" class=\"res\">${op.title}</a>">
</#macro>
<#macro macroDeleteBtn id>
    <#assign deleteBtn = "<a onclick=\"func.${op.url}('show','${id}');\" class=\"res\">${op.title}</a>">
</#macro>
<#if map??>
    <#list map["operators"+view.id] as op>
        <#if op.url?starts_with("add")>
            <#assign addAble = true>
            <#assign addBtn = "<a onclick=\"func.${op.url}('show');\" class=\"btn btn-success\">${op.title}</a>">
        </#if>
        <#if op.url?starts_with("update")>
            <#assign updateAble = true>
        </#if>
        <#if op.url?starts_with("delete")>
            <#assign deleteAble = true>

        </#if>
    </#list>
</#if>
