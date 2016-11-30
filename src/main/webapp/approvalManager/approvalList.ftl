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
            <#list asP.list as sa>
                <tr>
                    <td>
                        成都
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
                        1994.07.03
                    </td>
                    <td>
                        西瓜
                    </td>
                    <#if addAble || updateAble || deleteAble>
                        <td>

                            <#list map["operators"+view.id] as op>
                                <#if op.url == "seeApproval">
                                    <@macroBtn url = op.url title = op.title></@macroBtn>
                                    <#assign op = map["operators"+view.id][0]>
                                ${InsertKit(btnLabel,5)}/
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
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">申请详情:0719班</h4>
            </div>
            <div id="dataTables-list" class="table-responsive dataTables_wrapper form-inline" role="grid">
                <table class="table table-striped table-bordered table-hover dataTable no-footer"
                       id="dataTables-example" aria-describedby="dataTables-example_apply">
                    <thead>
                    <tr>
                        <th>
                            姓名
                        </th>
                        <th>
                            补助金额
                        </th>
                        <th>
                            剩余补助次数
                        </th>
                        <th>
                            奖金
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
            张三
                            </td>
                            <td>
700
                            </td>
                            <td>
2
                            </td>
                            <td>
300
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer center-pill text-center">
                <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary ">同意</button>
            </div>
        </div>
    </div>
</div>