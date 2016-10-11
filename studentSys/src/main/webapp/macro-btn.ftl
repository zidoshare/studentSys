<#assign updateAble = false>
<#assign deleteAble = false>
<#assign addAble = false>
<#assign addBtn = "">
<#assign updateBtn = "">
<#assign deleteBtn = "">
<#if map??>
    <#list map["operators"+view.id] as op>
        <#if op.url?starts_with("add")>
            <#assign addAble = true>
            <#assign addBtn = "<a onclick=\"func.${op.url}('show');\" class=\"btn btn-success btn-sm\">${op.title}</a>">
        </#if>
        <#if op.title=="编辑">
            <#assign updateAble = true>
            <#assign updateBtn = "<a onclick=\"func.${op.url}('show','${question.id}');\" class=\"res\">${op.title}</a>">
        </#if>
        <#if op.title == "删除">
            <#assign deleteAble = true>
            <#assign updateBtn = "<a onclick=\"func.${op.url}('show','${question.id}');\" class=\"res\">${op.title}</a>">
        </#if>
    </#list>
</#if>
