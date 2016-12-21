<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<@initBtn map = map view=view ></@initBtn>
<div class="row animate">
    <div class="col-md-12">
        <div id="class-details" class="panel panel-default item">
            <div class="panel-heading title">
            ${view.title}
                <button data-style="slide-up" id="update-student-btn"
                        class="btn btn-primary ladda-button btn-info pull-right"
                        onclick="func.letGraduate()">
                    <span>毕业</span>
                </button>
            </div>
            <div class="panel-body">
                <div id="table-inner">
                    <script type="text/javascript">
                        var change = function (studentId) {
                            var dom2 = $('#classSelect-div');
                            var dom1 = $('#classInfo-div');
                            var objS = document.getElementById("statusSelect_list");
                            var grade = objS.options[objS.selectedIndex].value;
                            func.getRepairClass(studentId, grade);
                        }

                    </script>
                    <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline"
                         role="grid">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer"
                               id="dataTables-example" aria-describedby="dataTables-example_info">
                            <thead>
                            <tr>
                                <th>
                                    <div class="checkbox3 checkbox-round text-center">
                                        <input type="checkbox" id="index-look">
                                        <label class="checkbox-2" style="display: inline" for="index-look">
                                        </label>
                                    </div>
                                </th>
                                <th class="sr-only">
                                    psId
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
                            <#--<#list students.list as student>-->
                            <#if students??>
                                <#list students as student>
                                <tr id="stuId${student.id}">
                                    <td>
                                        <div class="checkbox3 checkbox-round text-center">
                                            <input class="idList" type="checkbox" data-clsId="${student.classId}"
                                                   data-status="${student.status}" data-label="${student.id}"
                                                   id="index-look${student.id}" <#if student.status!=1>disabled</#if>>
                                            <label class="checkbox-2" style="display: inline"
                                                   for="index-look${student.id}">
                                            </label>
                                        </div>
                                    </td>
                                    <td class="sr-only" id="psId${student.id}" data-label="${student.id}"
                                        data-target="#studentId">
                                    ${student.id}
                                    </td>
                                    <td>
                                    ${(student.name)!'无'}
                                    </td>
                                    <td>
                                    ${(student.contactInformation)!'无'}
                                    </td>
                                    <td>
                                    ${(student.statu.statusName)!'无'}
                                    </td>
                                    <td>
                                    ${(student.educationBackground)!'无'}
                                    </td>
                                    <td>
                                    ${(student.major)!'无'}
                                    </td>
                                    <td>
                                    ${(student.paymentMethod)!'无'}
                                    </td>
                                    <td>
                                    ${(student.residualFrequency)!'无'}
                                    </td>
                                    <td>
                                        无
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
                                    ${InsertKit(deleteBtn,"${student.id}")}/
                                        <#list map["operators"+view.id] as op>
                                            <#if op.url == "projectScore">
                                                <@macroBtn url = op.url title = op.title></@macroBtn>
                                                <#assign op = map["operators"+view.id][0]>
                                            ${InsertKit(btnLabel,"${student.id}")}
                                            </#if>
                                        </#list>
                                    </td>
                                <#--</#if>-->
                                </tr>
                                </#list>
                            </#if>
                            </tbody>
                        </table>
                        <script>
                            $(function () {
                                var allChecked = true;
                                $('#index-look').click(function () {
                                    if ($(this).is(':checked')) {
                                        $('.idList').each(function (index, elem) {
                                            if ($(elem).is(":enabled")) {
                                                $(elem).prop('checked', true);
                                            }
                                        });
                                        allChecked = true;
                                    } else {
                                        $('.idList').each(function (index, elem) {
                                            $(elem).prop('checked', false);
                                        });
                                        allChecked = false;
                                    }
                                });

                                $('.idList').each(function (index, elem) {
                                    $(elem).click(function () {
                                        if ($(this).is(':checked') == false) {
                                            $('#index-look').prop('checked', false);
                                            allChecked = false;
                                        } else {
                                            allChecked = checkStatus();
                                            if (allChecked) {
                                                $('#index-look').prop('checked', true);
                                            }
                                        }
                                    });
                                });

                                function checkStatus() {
                                    var all = true;
                                    $('.idList').each(function (index, elem) {
                                        if ($(this).is(":enabled") && $(this).is(':checked') == false) {
                                            all = false;
                                        }
                                    });
                                    return all;
                                }

                            });

                        </script>
                    </div>
                <#--<#if students??>-->
                <#--<#assign str = "?">-->
                <#--<#if holdPath?contains("?")><#assign str = "&"></#if>-->
                <#--<@paginate page = students url=holdPath+str pageAfter="p">-->
                <#--</@paginate>-->
                <#--</#if>-->
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
                            <h4 class="modal-title">学生详情</h4>
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
                            <button data-style="slide-up" id="update-student-btn" class="btn btn-primary ladda-button"
                                    onclick="func.updateStudent('up')">
                                <span>保存</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="projectScoreModel" tabindex="-1" role="dialog"
                 aria-labelledby="addProjectScoreLabel"
                 aria-hidden="true">
                <div class="modal-dialog" style="width:800px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span
                                    aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                            <h5 class="modal-title" id="myModalLabel">项目评价</h5>
                        </div>
                        <div class="modal-body">
                            <div id="trainingProject" class="row">
                                <input id="psId" name="trainingProject.studentId" class="form-control sr-only">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">项目名称:</div>
                                            <input name="trainingProject.projectName" class="form-control"
                                                   type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <input name="trainingProject.score" id="situation" type="number"
                                               class="form-control">
                            <span class="input-group-btn">
                                <button class="btn btn-info" type="button"
                                        onclick="func.projectScore('up')">保存分数</button>
                            </span>
                                    </div>
                                </div>
                            </div>
                            <form role="form" class="form-horizontal">
                                <div id="dataTables-list" class="table-responsive dataTables_wrapper form-inline"
                                     role="grid">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                           id="dataTables-example" aria-describedby="dataTables-example_apply">
                                        <caption class="text-center label-info">评分历史</caption>
                                        <thead>
                                        <tr>
                                            <th>
                                                时间
                                            </th>
                                            <th>
                                                项目名称
                                            </th>
                                            <th>
                                                分数
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                            <div class="tip-container">
                                <div class="tip" id="saveClassTip" aria-label="0">
                                </div>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

