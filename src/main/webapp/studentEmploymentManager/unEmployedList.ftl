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
                    学号
                </th>
                <th>
                    姓名
                </th>
                <th>
                    所在班级
                </th>
                <th>
                    联系方式
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
                    缴费方式
                </th>
                <th>
                    补贴剩余
                </th>
                <th>
                    状态
                </th>
                <th>
                    备注
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
                    西瓜
                </td>
                <td>
                    西瓜
                </td>
                <td>
                    西瓜
                </td>
                <td>
                    西瓜
                </td>
                <td>
                    西瓜
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

                    <#list UnEmpStuP.list as stu>
                    <tr id="class${stu.id}" data-label="${stu.id}" data-target="#studentId" data-method="prop">
                        <td id="name${stu.id}" data-label="${stu.name?html}"
                            data-target="#name">${stu.name}</td>
                        <td id="headTeacher${class.id}" data-label="${class.headTeacher}"
                            data-target="#headTeacher">${class.headTeacher}</td>
                        <td id="tutor${class.id}" data-label="${class.tutor}" data-target="#tutor">${class.tutor}</td>
                        <td id="studentCnt${class.id}" data-label="${class.studentCnt}"
                            data-target="studentCnt">${class.studentCnt}</td>
                        <td id="classCreateTime${class.id}"
                            data-label="${class.classCreateTime}" data-target="#classCreateTime"
                            data-method="prop">${(class.classCreateTime?number)?number_to_datetime}</td>
                        <#if updateAble || deleteAble>
                            <td>
                                <#list map["operators"+view.id] as op>
                                    <#if op.url == "seeClassStudent">
                                        <@macroBtn url = op.url title = op.title></@macroBtn>
                                        <#assign op = map["operators"+view.id][0]>
                                    ${InsertKit(btnLabel,"${class.id}")}/
                                    </#if>
                                </#list>
                                <#if updateAble>
                                ${InsertKit(updateBtn,"${class.id}")}
                                </#if>
                                <#if updateAble>
                                    /${InsertKit(deleteBtn,"${class.id}")}
                                </#if>

                            </td>
                        </#if>
                        <td id="classUpdateTime${class.id}" class="hidden" data-label="${class.classUpdateTime}"
                            data-target="#classUpdateTime" data-method="prop">
                        </td>
                    </tr>
                    </#list>

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