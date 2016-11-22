<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view></@initBtn>
<@item>
<div class="panel-heading title">
${view.title}
</div>
    <div id="table-apply">
        <div id="dataTables-example_subsidy" class="table-responsive dataTables_wrapper form-inline" role="grid">
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                   id="dataTables-example" aria-describedby="dataTables-example_apply">
                <thead>
                <tr>
                    <th>
                        地区
                    </th>
                    <th>
                        班级
                    </th>
                    <th>
                        助学金
                    </th>
                    <th>
                        剩余次数
                    </th>
                    <th>
                        奖金
                    </th>
                    <th>
                        申请人
                    </th>
                    <#if addAble || updateAble || deleteAble>
                        <th>
                            操作
                        </th>
                    </#if>
                </tr>
                </thead>
    <tbody>
    <tr>
        <td>
            0719班
        </td>
        <td>
            11
        </td>
        <td>
            2100
        </td>
        <td>
            300
        </td>
        <td>
            2400
        </td>
        <td>
            西瓜
        </td>
        <#if addAble || updateAble || deleteAble>
            <td>
                <#if addAble>
                    <#list map["operators"+view.id] as op>
                        <#if op.url == "seeApproval">
                            <@macroBtn url = op.url title = op.title></@macroBtn>
                            <#assign op = map["operators"+view.id][0]>
                        ${InsertKit(btnLabel,op.title)}/
                        </#if>
                    </#list>
                </#if>
                <#if updateAble>
                ${InsertKit(updateBtn,"同意")}/
                </#if>
            ${InsertKit(deleteBtn,"驳回")}
            </td>
        </#if>

    </tr>

    </tbody>

</@item>
