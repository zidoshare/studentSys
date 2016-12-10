<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view></@initBtn>
<div class="row animate">
    <div class="col-md-12">
        <div id="class-details" class="panel panel-default item">
            <div class="panel-heading title">
            ${view.title}
            </div>
            <div class="panel-body">
                <div id="table-apply">
                    <div id="dataTables-example_subsidy" class="table-responsive dataTables_wrapper form-inline"
                         role="grid">
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
                                    就业单位
                                </th>
                                <th>
                                    就业薪资
                                </th>
                                <th>
                                    对应咨询师
                                </th>
                                <th>
                                    备注
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list esp.list as stu>
                            <tr id="student${stu.id}" data-label="${stu.id}" data-target="#studentIds"
                                data-method="prop">
                                <td id="name${stu.id}" data-label="${stu.name}"
                                    data-target="#name">${stu.name}</td>
                                <td id="class${stu.id}" data-label="${stu.className}"
                                    data-target="#className">${stu.className}</td>
                                <td id="contactInformation${stu.id}" data-label="${(stu.contactInformation)!}"
                                    data-target="#contactInformation">${(stu.contactInformation)!"无"}</td>
                                <td id="educationBackground${stu.id}"
                                    data-label="${(stu.educationBackground)!}" data-target="#educationBackground"
                                    data-method="prop">${(stu.educationBackground)!"无"}</td>
                                <td id="company${stu.id}"
                                    data-label="${(stu.studentEmployment.company)!}" data-target="#company"
                                    data-method="prop">${(stu.studentEmployment.company)!"无"}</td>
                                <td id="salary${stu.id}"
                                    data-label="${(stu.studentEmployment.salary)!}" data-target="#salary"
                                    data-method="prop">${(stu.studentEmployment.salary)!"无"}</td>
                                <td id="operator${stu.id}"
                                    data-label="${(stu.studentEmployment.operator)!}" data-target="#operator"
                                    data-method="prop">${(stu.studentEmployment.operator)!"无"}</td>
                                <td id="remark${stu.id}"
                                    data-label="${(stu.remark)!}" data-target="#remark"
                                    data-method="prop">${(stu.remark)!"无"}</td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                    <#if esp??>
                        <#assign str = "?">
                        <#if holdPath?contains("?")><#assign str = "&"></#if>
                        <@paginate page = esp url=holdPath+str pageAfter="p">
                        </@paginate>
                    </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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