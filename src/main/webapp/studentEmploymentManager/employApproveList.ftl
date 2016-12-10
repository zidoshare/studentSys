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
                <div id="table-inner">
                    <div id="dataTables-example_subsidy" class="table-responsive dataTables_wrapper form-inline"
                         role="grid">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer"
                               id="dataTables-example" aria-describedby="dataTables-example_apply">
                            <thead>
                            <tr>
                                <th class="sr-only">
                                    学生Id
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
                                    学历
                                </th>
                                <th>
                                    就业单位
                                </th>
                                <th>
                                    就业薪资
                                </th>
                                <th>
                                    就业时间
                                </th>
                                <th>
                                    就业老师
                                </th>
                                <th>
                                    备注
                                </th>
                            <#assign seeEmpApp = false>
                            <#assign agreeEmpApp = false>
                            <#assign disagreeEmpApp = false>
                            <#list map["operators"+view.id] as op>
                                <#if op.url == "seeEmpApp">
                                    <#assign seeEmpApp=true>
                                <#elseif op.url == "agreeEmpApp">
                                    <#assign agreeEmpApp=true>
                                <#elseif op.url == "disagreeEmpApp">
                                    <#assign disagreeEmpApp=true>
                                    <@macroBtn url = op.url title = op.title theme="success" isSave=true saveLabel="提交"></@macroBtn>
                                    <#assign saveBtn = btnLabel>
                                </#if>
                            </#list>
                            <#if seeEmpApp || agreeEmpApp || disagreeEmpApp>
                                <th>
                                    操作
                                </th>
                            </#if>
                            </tr>
                            </thead>
                            <tbody>
                            <#list pSel.list as se>
                            <tr id="studentEmployment${se.id}" data-label="${se.id}" data-target="#studentEmploymentId"
                                data-method="prop">
                                <td class="sr-only" id="studentId${se.id}" data-label="${se.studentId}"
                                    data-target="#studentId">${(se.studentId)!0}</td>
                                <td id="studentName${se.id}" data-label="${se.studentName}"
                                    data-target="#studentName">${(se.studentName)!"无"}</td>
                                <td id="className${se.id}" data-label="${se.className}"
                                    data-target="#className">${(se.className)!"无"}</td>
                                <td id="phoneNumber${(se.id)!}" data-label="${(se.phoneNumber)!}"
                                    data-target="#phoneNumber">${(se.phoneNumber)!"无"}</td>
                                <td id="educationBackground${(se.id)!}"
                                    data-label="${(se.educationBackground)!}" data-target="#educationBackground"
                                    data-method="prop">${(se.educationBackground)!"无"}</td>
                                <td id="company${(se.id)!}"
                                    data-label="${(se.company)!}" data-target="#company"
                                    data-method="prop">${(se.company)!"无"}</td>
                                <td id="salary${(se.id)!}"
                                    data-label="${(se.salary)!0}" data-target="#salary"
                                    data-method="prop">${(se.salary)!"无"}</td>
                                <td id="employmentTime${(se.id)!}"
                                    data-label="${(se.employmentTime)!0}" data-target="#employmentTime"
                                    data-method="prop">${(se.employmentTime)!"无"}</td>
                                <td id="operater${(se.id)!}"
                                    data-label="${(se.operater)!0}" data-target="#operater"
                                    data-method="prop">${(se.operater)!"无"}</td>
                                <td id="remark${se.id}"
                                    data-label="${(se.remark)!}" data-target="#remark"
                                    data-method="prop">${(se.remark)!"无"}</td>
                                <#if seeEmpApp || agreeEmpApp || disagreeEmpApp>
                                    <td>
                                        <#list map["operators"+view.id] as op>
                                            <#if op.url == "seeEmpApp">
                                                <@macroBtn url = op.url title = op.title></@macroBtn>
                                                <#assign op = map["operators"+view.id][0]>
                                            ${InsertKit(btnLabel,'${se.studentId}')}
                                            </#if>
                                            <#if op.url == "agreeEmpApp">
                                                <@macroBtn url = op.url title = op.title></@macroBtn>
                                                <#assign op = map["operators"+view.id][0]>
                                                /${InsertKit(btnLabel,'${se.id}')}
                                            </#if>
                                            <#if op.url == "disagreeEmpApp">
                                                <@macroBtn url = op.url title = op.title></@macroBtn>
                                                <#assign op = map["operators"+view.id][0]>
                                                /${InsertKit(btnLabel,'${se.id}')}
                                            </#if>
                                        </#list>
                                    </td>
                                </#if>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                    <#if pSel??>
                        <#assign str = "?">
                        <#if holdPath?contains("?")><#assign str = "&"></#if>
                        <@paginate page = pSel url=holdPath+str pageAfter="p">
                        </@paginate>
                    </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="seeDetailModel" tabindex="-1" role="dialog" aria-labelledby="addSeeDetailLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">信息详情</h4>
            </div>
            <div class="modal-body" id="stuDetailInfo">...</div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>