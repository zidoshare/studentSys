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
                    申请班级
                </th>
                <th>
                    总助学金
                </th>
                <th>
                    总奖金
                </th>
                <th>
                    合计
                </th>
                <th>
                    申请人
                </th>
                <th>
                    申请时间
                </th>
                <#if addAble || updateAble || deleteAble>
                    <th>
                        操作
                    </th>
                </#if>
            </tr>
            </thead>
            <tbody>
            <#list saP.list as sa>
                <tr>
                    <td>
                        ${sa.region.regionName}
                    </td>
                    <td>
                        <input class="hide" name="className" value="${sa.className}"/>
                        ${sa.className}
                    </td>
                    <td>
                        ${sa.totalSubsidy}
                    </td>
                    <td>
                        ${sa.totalBonus}
                    </td>
                    <td>
                        ${sa.aggregateAmount}
                    </td>
                    <td>
                        ${sa.applicantName}
                    </td>
                    <td>
                    ${(sa.applicationDate?number)?number_to_date}
                    </td>
                    <#if addAble || updateAble || deleteAble>
                        <td>

                            <#list map["operators"+view.id] as op>
                                <#if op.url == "seeApproval">
                                    <@macroBtn url = op.url title = op.title></@macroBtn>
                                    <#assign op = map["operators"+view.id][0]>
                                ${InsertKit(btnLabel,"${sa.classId}")}/
                                </#if>
                            </#list>

                            <#if updateAble>
                            ${InsertKit(updateBtn,"同意")}/
                            </#if>
                        ${InsertKit(deleteBtn,"驳回")}
                        </td>
                    </#if>
                  </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
</@item>
<div class="modal fade" id="seeApprovalModel" tabindex="-1" role="dialog" aria-labelledby="addApplyModelLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="approval-modal">
        </div>
    </div>
</div>