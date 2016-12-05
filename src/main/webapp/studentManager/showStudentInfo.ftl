<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<@initBtn map = map view=view ></@initBtn>
<div class="row animate">
    <div class="col-md-12">
        <div id="class-details" class="panel panel-default item">
            <div class="panel-heading title">
            ${view.title}
            </div>
            <div class="panel-body">
                <div id="table-inner">
                    <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline"
                         role="grid">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer"
                               id="dataTables-example" aria-describedby="dataTables-example_info">
                            <thead>
                            <tr>
                                <th>
                                    <div class="checkbox3 checkbox-round text-center">
                                        <input type="checkbox" id="index-look" checked="checked">
                                        <label class="checkbox-2" style="display: inline" for="index-look">
                                        </label>
                                    </div>
                                </th>
                                <th>
                                    姓名
                                </th>
                                <th>
                                    手机号
                                </th>
                                <th>
                                    状态
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
                                    补贴剩余次数
                                </th>

                                <th>
                                    备注
                                </th>
                                <#--<#if updateAble ||  deleteAble>-->
                                    <th>
                                        操作
                                    </th>
                                <#--</#if>-->
                            </tr>
                            </thead>
                            <tbody>
                            <#list students.list as student>
                            <tr>
                                <td>
                                    <div class="checkbox3 checkbox-round text-center">
                                        <input type="checkbox" id="index-look1" checked="checked">
                                        <label class="checkbox-2" style="display: inline" for="index-look1">
                                        </label>
                                    </div>
                                </td>
                                <td>
                                    ${student.name}
                                </td>
                                <td>
                                    ${student.contactInformation}
                                </td>
                                <td>
                                    ${student.statu.statusName}
                                </td>
                                <td>
                                    ${student.educationBackground}
                                </td>
                                <td>
                                    ${student.major}
                                </td>
                                <td>
                                    ${student.paymentMethod}
                                </td>
                                <td>
                                    ${student.residualFrequency}
                                </td>
                                <td>
                                    [原]成都0719班
                                </td>
                                <#--<#if  updateAble ||  deleteAble>-->
                                    <td>
                                        <#list map["operators"+view.id] as op>
                                            <#if op.url == "seeStudent">
                                                <@macroBtn url = op.url title = op.title></@macroBtn>
                                            <#assign op = map["operators"+view.id][0]>
                                            ${InsertKit(btnLabel,"${student.id}")}/
                                            </#if>
                                        </#list>
                                    ${InsertKit(updateBtn,"${student.id}")}/
                                    ${InsertKit(deleteBtn,"${student.id}")}
                                    </td>
                            <#--</#if>-->
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="studentInformationModel" tabindex="-1" role="dialog"
                 aria-labelledby="submitApplyModelLabel"
                 aria-hidden="true">
                <div class="modal-dialog" style="width:800px">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <button type="button" class="close" data-dismiss="modal"><span
                                    aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                            <h4 class="modal-title" >学生详情</h4>
                        </div>
                        <div class="modal-body" id="showInfo"></div>
                        <div class="modal-footer text-center">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="updateInformationModel" tabindex="-1" role="dialog"
                 aria-labelledby="submitApplyModelLabel"
                 aria-hidden="true">
                <div class="modal-dialog" style="width:800px">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <button type="button" class="close" data-dismiss="modal"><span
                                    aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                            <h4 class="modal-title">学生详情</h4>
                        </div>
                        <div class="modal-body" id="updateInfo">

                        </div>
                        <div class="modal-footer center-block text-center">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button data-style="slide-up" id="saveRole-btn" class="btn btn-primary ladda-button" onclick="func.updateStudent('up')">
                                <span >保存</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

