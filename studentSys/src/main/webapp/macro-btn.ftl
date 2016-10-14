<#macro macroBtn url title type="normal" theme="res" id="">
    <#assign str = "">
    <#if id?length gt 0>
        <#assign str = ",'${id}'">
    </#if>
    <#if type=="normal">
        <a onclick="func.${url}('show'${str});" class="res">${title}</a>
    <#else>
        <button data-style="slide-up" id="save-btn" class="btn btn-${theme} ladda-button" onclick="func.${url}('up'"><span class="ladda-label">保存</span></button>
    </#if>
</#macro>

<#macro initBtn map view theme = "success">
    <#assign updateAble = false>
    <#assign deleteAble = false>
    <#assign addAble = false>
    <#assign addBtn = "">
    <#assign saveBtn = "">
    <#assign updateBtn = "">
    <#assign deleteBtn = "">
    <#if map??>
        <#list map["operators"+view.id] as op>
            <#if op.url?starts_with("add")>
                <#assign addAble = true>
                <#assign addBtn = "<a onclick=\"func.${op.url}('show');\" class=\"btn btn-"+theme+"\">${op.title}</a>">
                <#assign saveBtn = "<button data-style=\"slide-up\" id=\"save-btn\" class=\"btn btn-"+theme+" ladda-button\" onclick=\"func.${op.url}('up');\"><span class=\"ladda-label\">保存</span></button>">
            </#if>
            <#if op.url?starts_with("update")>
                <#assign updateAble = true>
            </#if>
            <#if op.url?starts_with("delete")>
                <#assign deleteAble = true>

            </#if>
        </#list>
    </#if>
</#macro>
