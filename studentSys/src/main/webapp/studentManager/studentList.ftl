<#include "../macro-title.ftl">
<@title title="学生列表">
</@title>
<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item">

            <div class="panel-heading">
                <form class="clearfix">
                    <div class="input-group hdwx-input-sm pull-left">
                        <div class="btn-group input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false">
                                选择班级 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                        <label for="all-search" class="sr-only">search</label>
                        <input type="text" class="form-control" id="all-search" placeholder="学生...">
                <span class="input-group-btn">
                    <button type="button" class="btn btn-success">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>

                </span>
                    </div>
                    <div class="pull-right btn-group">
                    <#assign updateAble = false>
                    <#assign deleteAble = false>
                    <#list map["operators"+view.id] as op>
                        <a onclick="func.${op.url}('show');" class="btn btn-success btn-sm">${op.title}</a>
                        <#if op.title=="编辑">
                            <#assign updateAble = true>
                        </#if>
                        <#if op.title == "删除">
                            <#assign deleteAble = true>
                        </#if>
                    </#list>
                    </div>
                </form>
            </div>


            <div class="panel-body">
                <div class="table-responsive">
                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer"
                               id="dataTables-example" aria-describedby="dataTables-example_info">
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
                                <th>
                                    入学时间
                                </th>
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
                                <td>${student.admission}</td>
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
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addStudentModel" tabindex="-1" role="dialog" aria-labelledby="addStudentModelLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">添加学生信息</h4>
            </div>
            <div class="modal-body">
                <form id="student" role="form" class="form-horizontal">
                    <div class="form-group">
                        <label for="studentName" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="student.name" id="studentName"
                                   placeholder="名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="className" class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="student.className" id="className"
                                   placeholder="班级">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tutor" class="col-sm-2 control-label">辅导</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="student.tutor" id="tutor" placeholder="辅导">
                        </div>
                    </div>
                <#--<div class="form-group">
                    <label for="classId" class="col-sm-2 control-label">班级</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="student.classId" id="classId">
                        <#list classes as class>
                            <option value="${class.id}">${class.name}</option>
                        </#list>
                        </select>
                    </div>
                </div>-->
                <#--<div class="form-group">
                    <label for="tutorId" class="col-sm-2 control-label">辅导老师</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="student.tutorId" id="tutorId">
                        <#list users as usr>
                            <option value="${usr.id}">${usr.userNickname}</option>
                        </#list>
                        </select>
                    </div>
                </div>-->
                    <div class="form-group">
                        <label for="contactInformation" class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="student.contactInformation"
                                   id="contactInformation" placeholder="联系方式">
                        </div>
                    </div>
                <#--<div class="form-group">
                    <label for="credit" class="col-sm-2 control-label">入学时间</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="student.credit" id="credit" placeholder="入学时间">
                    </div>
                </div>-->
                    <div class="form-group sr-only">
                        <label for="createTime" class="col-sm-2 control-label">创建时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="student.createTime" id="createTime"
                                   placeholder="创建时间">
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="ip" class="col-sm-2 control-label">ip</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="student.ip" id="ip" placeholder="ip"
                                   value="0.0.0.0"
                                   disabled>
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="operater" class="col-sm-2 control-label">operater</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="student.operater" id="operater"
                                   placeholder="创建者" value="${user.userNickname}"
                                   disabled>
                        </div>
                    </div>
                </form>
                <div class="tip-container">
                    <div class="tip" id="saveTip" aria-label="0">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button data-style="slide-up" id="save-btn" class="btn btn-primary ladda-button"
                        onclick="func.addStudent('up')">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>