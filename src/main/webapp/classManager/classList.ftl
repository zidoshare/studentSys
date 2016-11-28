<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view></@initBtn>
<@item>
<div class="panel-heading title">
${view.title}
    <span class="pull-right">${addBtn}</span>
</div>
<div class="panel-body">
    <div id="table-inner">
        <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                   id="dataTables-example" aria-describedby="dataTables-example_info">
                <thead>
                <tr>
                    <th>
                        班级名称
                    </th>
                    <th>
                        讲师
                    </th>
                    <th>
                        辅导
                    </th>
                    <th>
                        人数
                    </th>
                    <th>
                        创建时间
                    </th>
                    <#if addAble || updateAble || deleteAble>
                        <th>
                            操作
                        </th>
                    </#if>
                </tr>
                </thead>
                <tbody>

                    <#list classes.list as class>
                    <tr id="class${class.id}" data-label="${class.id}" data-target="#classId" data-method="prop">
                        <td id="className${class.id}" data-label="${class.className?html}"
                            data-target="#className">${class.className}</td>
                        <td id="headTeacher${class.id}" data-label="${class.headTeacher}"
                            data-target="#headTeacher">${class.headTeacher}</td>
                        <td id="tutor${class.id}" data-label="${class.tutor}" data-target="#tutor">${class.tutor}</td>
                        <td id="studentCnt${class.id}" data-label="${class.studentCnt}"
                            data-target="studentCnt">${class.studentCnt}</td>
                        <td id="classCreateTime${class.id}"
                            data-label="${class.classCreateTime}" data-target="#classCreateTime"
                            data-method="prop">${(class.classCreateTime?number)?number_to_datetime}</td>
                        <#if addAble || updateAble || deleteAble>
                            <td>
                                <#if addAble>
                                    <#list map["operators"+view.id] as op>
                                        <#if op.url == "seeClassStudent">
                                            <@macroBtn url = op.url title = op.title></@macroBtn>
                                            <#assign op = map["operators"+view.id][0]>
                                        ${InsertKit(btnLabel,"${class.id}")}/
                                        </#if>
                                    </#list>
                                </#if>
                                <#if updateAble>
                                ${InsertKit(updateBtn,"${class.id}")}
                                </#if>
                                <#if deleteAble>
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

        <#if classes??>
            <#assign str = "?">
            <#if holdPath?contains("?")><#assign str = "&"></#if>
            <@paginate page = classes url=holdPath+str pageAfter="p">
            </@paginate>
        </#if>
    </div>
</div>
</@item>
<div class="modal fade" id="addClassModel" tabindex="-1" role="dialog" aria-labelledby="addUserModelLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">添加班级信息</h4>
            </div>
            <div class="modal-body">
                <form id="class" role="form" class="form-horizontal">
                    <div class="form-group sr-only">
                        <label for="classId" class="col-sm-2 control-label">班级id</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="class.id" id="classId"
                                   placeholder="班级id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="className" class="col-sm-2 control-label">班级名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="class.className" id="className"
                                   placeholder="班级名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="headTeacher" class="col-sm-2 control-label">讲师</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="class.headTeacher" id="headTeacher"
                                   placeholder="讲师">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tutor" class="col-sm-2 control-label">辅导</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="class.tutor" id="tutor"
                                   placeholder="辅导">
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="studentCnt" class="col-sm-2 control-label">创建时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="class.studentCnt" id="studentCnt"
                                   placeholder="创建时间" disabled>
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="classCreateTime" class="col-sm-2 control-label">创建时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="class.classCreateTime" id="classCreateTime"
                                   placeholder="创建时间" disabled>
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="classUpdateTime" class="col-sm-2 control-label">更新时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="class.classUpdateTime" id="classUpdateTime"
                                   placeholder="更新时间" disabled>
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="classOperaterId" class="col-sm-2 control-label">operater</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="class.classOperaterId" id="classOperaterId"
                                   placeholder="创建者"
                                   value="${user.userNickname}"
                                   disabled>
                        </div>
                    </div>
                </form>
                <div class="tip-container">
                    <div class="tip" id="saveClassTip" aria-label="0">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <span class="pull-right">${saveBtn}</span>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="seeClassStudent" tabindex="-1" role="dialog" aria-labelledby="addClassModelLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">${cls.className}</h4>
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
                            班级
                        </th>
                        <th>
                            辅导老师
                        </th>
                        <th>
                            联系方式
                        </th>
                    <#--<th>
                        入学时间
                    </th>-->
                    <#--<th>
                        学分
                    </th>
                    <th>
                        成绩
                    </th>
                    <th>
                        状态
                    </th>
                    <th>
                        就业跟踪
                    </th>-->
                        <th>
                            用户创建时间
                        </th>
                        <th>
                            最后登录ip
                        </th>
                        <th>
                            操作人
                        </th>
                    <#if updateAble || deleteAble>
                        <th>
                            <div class="checkbox3 checkbox-round">
                                <input type="checkbox" id="all-check">
                                <label for="all-check" class="td-check">
                                    全选
                                </label>
                            </div>
                        </th>
                    </#if>
                    </tr>
                    </thead>
                    <tbody>

                    <#list students as student>
                    <tr>
                        <td>${student.name}</td>
                        <td>${student.className}</td>
                        <td>${student.tutor}</td>
                        <td>${student.contactInformation}</td>
                    <#--<td>${student.admission}</td>-->
                        <td>${(student.createTime?number)?number_to_datetime}</td>
                        <td>${student.ip}</td>
                        <td>${student.operater}</td>

                        <#if updateAble || deleteAble>
                            <td>
                                <div class="checkbox3 checkbox-round">
                                    <input type="checkbox" id="checkbox-2">
                                    <label for="checkbox-2" class="td-check center-block">
                                    </label>
                                </div>
                            </td>
                        </#if>
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