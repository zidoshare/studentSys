<div class="tag-container">
<#list tags as tag>
    <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
        <input type="checkbox" id="tagCheckbox${tag.id}"
               onchange="Util.changeTag('${tag.tagName}',$('input#tagCheckbox${tag.id}'))" <#if selects["${tag.id}"]?? && selects["${tag.id}"] == true>checked</#if>>
        <label for="tagCheckbox${tag.id}">
        ${tag.tagName}
        </label>
    </div>
</#list>
</div>