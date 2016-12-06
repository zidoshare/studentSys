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
                    姓名
                </th>
                <th>
                    所在班级
                </th>
                <th>
                    电话
                </th>
                <th>
                    学历
                </th>
                <th>
                    专业
                </th>
                <th>
                    学分
                </th>
                <th>
                    考试平均分
                </th>
                <th>
                    项目评价
                </th>
                <th>
                    备注
                </th>
                <#assign seeUnEmploy = false>
                <#assign employmentTrack = false>
                <#assign employmentApproval = false>
                <#list map["operators"+view.id] as op>
                    <#if op.url == "seeUnEmploy">
                        <#assign seeUnEmploy=true>
                    <#elseif op.url == "employmentTrack">
                        <#assign employmentTrack=true>
                    <#elseif op.url == "employmentApproval">
                        <#assign employmentApproval=true>
                    </#if>
                </#list>
                <#if seeUnEmploy || employmentTrack || employmentApproval>
                    <th>
                        操作
                    </th>
                </#if>
            </tr>
            </thead>
            <tbody>
                <#list uesp.list as stu>
                <tr id="student${stu.id}" data-label="${stu.id}" data-target="#studentIds" data-method="prop">
                    <td id="name${stu.id}" data-label="${stu.name}"
                        data-target="#name">${stu.name}</td>
                    <td id="class${stu.id}" data-label="${stu.className}"
                        data-target="#className">${stu.className}</td>
                    <td id="contactInformation${stu.id}" data-label="${(stu.contactInformation)!"未填写"}"
                        data-target="#contactInformation">${(stu.contactInformation)!"未填写"}</td>
                    <td id="educationBackground${stu.id}"
                        data-label="${(stu.educationBackground)!"未填写"}" data-target="#educationBackground"
                        data-method="prop">${(stu.educationBackground)!"未填写"}</td>
                    <td id="major${stu.id}"
                        data-label="${(stu.major)!"未填写"}" data-target="#major"
                        data-method="prop">${(stu.major)!"未填写"}</td>
                    <td id="credit${stu.id}"
                        data-label="${(stu.credit)!0}" data-target="#credit"
                        data-method="prop">${(stu.credit)!"未填写"}</td>
                    <td id="testAverage${stu.id}"
                        data-label="${(stu.testAverage)!0}" data-target="#testAverage"
                        data-method="prop">${(stu.testAverage)!"没有成绩"}</td>
                    <td id="trainingEvaluation${stu.id}"
                        data-label="${(stu.trainingEvaluation)!0}" data-target="#trainingEvaluation"
                        data-method="prop">${(stu.trainingEvaluation)!"没有成绩"}</td>
                    <td id="remark${stu.id}"
                        data-label="${(stu.remark)!}" data-target="#remark"
                        data-method="prop">${(stu.remark)!"无"}</td>
                    <#if seeUnEmploy || employmentTrack || employmentApproval>
                        <td>
                            <#list map["operators"+view.id] as op>
                                <#if op.url == "seeUnEmploy">
                                    <@macroBtn url = op.url title = op.title></@macroBtn>
                                    <#assign op = map["operators"+view.id][0]>
                                ${InsertKit(btnLabel,"${stu.id}")}
                                </#if>
                                <#if op.url == "employmentTrack">
                                    <@macroBtn url = op.url title = op.title></@macroBtn>
                                    <#assign op = map["operators"+view.id][0]>
                                    /${InsertKit(btnLabel,"${stu.id}")}
                                </#if>
                                <#if op.url == "employmentApproval">
                                    <@macroBtn url = op.url title = op.title></@macroBtn>
                                    <#assign op = map["operators"+view.id][0]>
                                    /${InsertKit(btnLabel,"${stu.id}")}
                                </#if>
                            </#list>
                        </td>
                    </#if>
                </tr>
                </#list>
            </tbody>
        </table>
        <#if uesp??>
            <#assign str = "?">
            <#if holdPath?contains("?")><#assign str = "&"></#if>
            <@paginate page = uesp url=holdPath+str pageAfter="p">
            </@paginate>
        </#if>
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
                            学号
                        </th>
                        <th>
                            姓名
                        </th>
                        <th>
                            所在班级
                        </th>
                        <th>
                            电话
                        </th>
                        <th>
                            父母电话
                        </th>
                        <th>
                            学历
                        </th>
                        <th>
                            专业
                        </th>
                        <th>
                            学分
                        </th>
                        <th>
                            考试平均分
                        </th>
                        <th>
                            项目评价
                        </th>
                        <th>
                            备注
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>

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