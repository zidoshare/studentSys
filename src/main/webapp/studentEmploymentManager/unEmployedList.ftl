<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view></@initBtn>
<div class="row animate">
    <div class="col-md-12">
        <div id="class-details" class="panel panel-default item">
            <div class="panel-heading title">
            ${view.title}
                <span class="pull-right">${addBtn}</span>
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
                                    id
                                </th>
                                <th class="sr-only">
                                    目标名字
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
                                    最新情况
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
                                    <@macroBtn url = op.url title = op.title theme="success" isSave=true saveLabel="保存"></@macroBtn>
                                    <#assign saveBtn = btnLabel>
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


                            <tr id="student${stu.id}" data-label="${stu.id}" data-target="#studentId"
                                data-method="prop">
                                <td class="sr-only" id="targetId${stu.id}" data-label="${stu.id}"
                                    data-target="#targetId"></td>
                                <td class="sr-only" id="targetName${stu.id}" data-label="${stu.name}"
                                    data-target="#targetName"></td>
                                <td id="name${stu.id}" data-label="${stu.name}"
                                    data-target="#studentName">${stu.name}</td>
                                <td id="class${stu.id}" data-label="${stu.className}"
                                    data-target="#className">${stu.className}</td>
                                <td id="contactInformation${stu.id}" data-label="${(stu.contactInformation)!}"
                                    data-target="#contactInformation">${(stu.contactInformation)!"无"}</td>
                                <td id="educationBackground${stu.id}"
                                    data-label="${(stu.educationBackground)!}" data-target="#educationBackground"
                                    data-method="prop">${(stu.educationBackground)!"无"}</td>
                                <td id="major${stu.id}"
                                    data-label="${(stu.major)!}" data-target="#major"
                                    data-method="prop">${(stu.major)!"无"}</td>
                                <td id="credit${stu.id}"
                                    data-label="${(stu.credit)!0}" data-target="#credit"
                                    data-method="prop">${(stu.credit)!"无"}
                                    <a id="xf${stu.id}" onclick="func.seeDetail('xf',${stu.id});" data-theme="学分信息"
                                       data-req="creditDetail"><img class="ho"
                                                                    src="/images/seeDetail.png"></a>
                                </td>
                                <td id="testAverage${stu.id}"
                                    data-label="${(stu.testAverage)!0}" data-target="#testAverage"
                                    data-method="prop">${(stu.testAverage)!"无"}
                                    <a id="test${stu.id}" onclick="func.seeDetail('test',${stu.id});" data-theme="考试成绩"
                                       data-req="testDetail"><img class="ho"
                                                                  src="/images/seeDetail.png"></a>
                                </td>
                                <td id="trainingEvaluation${stu.id}"
                                    data-label="${(stu.trainingEvaluation)!0}" data-target="#trainingEvaluation"
                                    data-method="prop">${(stu.trainingEvaluation)!"无"}
                                    <a id="train${stu.id}" onclick="func.seeDetail('train',${stu.id});"
                                       data-theme="项目评分" data-req="trainingProjectDetail"><img class="ho"
                                                                                               src="/images/seeDetail.png"></a>
                                </td>
                                <td id="situation${(stu.studentTrackInfo.situation)!}"
                                    data-label="${(stu.studentTrackInfoList.situation)!}" data-target="#situation"
                                    data-method="prop">${(stu.studentTrackInfo.situation)!"无"}</td>
                                <#if seeUnEmploy || employmentTrack || employmentApproval>
                                    <td>
                                        <#list map["operators"+view.id] as op>
                                            <#if op.url == "seeUnEmploy">
                                                <@macroBtn url = op.url title = op.title></@macroBtn>
                                                <#assign op = map["operators"+view.id][0]>
                                            ${InsertKit(btnLabel,'${stu.id}')}
                                            </#if>
                                            <#if op.url == "employmentTrack">
                                                <@macroBtn url = op.url title = op.title></@macroBtn>
                                                <#assign op = map["operators"+view.id][0]>
                                                /${InsertKit(btnLabel,'${stu.id}')}
                                            </#if>
                                            <#if op.url == "employmentApproval">
                                                <@macroBtn url = op.url title = op.title></@macroBtn>
                                                <#assign op = map["operators"+view.id][0]>
                                                /${InsertKit(btnLabel,'${stu.id}')}
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
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="seeUnEmployModel" tabindex="-1" role="dialog" aria-labelledby="addSeeUnEmployLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">信息详情</h4>
            </div>
            <div class="modal-body" id="detailInfo">...</div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="trackModel" tabindex="-1" role="dialog" aria-labelledby="addTrackLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h5 class="modal-title" id="myModalLabel">追踪信息</h5>
            </div>
            <div class="modal-body">
                <div id="track" class="row">
                    <input id="targetId" name="studentTrackInfo.targetId" class="form-control sr-only">
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">姓名:</div>
                                <input name="studentTrackInfo.targetName" id="targetName" class="form-control"
                                       type="text" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="input-group">
                            <input name="studentTrackInfo.situation" id="situation" type="text" class="form-control">
                            <span class="input-group-btn">
                                <button class="btn btn-info" type="button"
                                        onclick="func.employmentTrack('up')">保存</button>
                            </span>
                        </div>
                    </div>
                </div>
                <form role="form" class="form-horizontal">
                    <div id="dataTables-list" class="table-responsive dataTables_wrapper form-inline" role="grid">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer"
                               id="dataTables-example" aria-describedby="dataTables-example_apply">
                            <caption class="text-center label-info">追踪历史</caption>
                            <thead>
                            <tr>
                                <th>
                                    时间
                                </th>
                                <th>
                                    学生姓名
                                </th>
                                <th>
                                    情况
                                </th>
                                <th>
                                    就业老师
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

<div class="modal fade" id="employmentApprovalModel" tabindex="-1" role="dialog"
     aria-labelledby="addEmploymentApprovalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">就业信息</h4>
            </div>
            <div class="modal-body">
                <form id="seApproveList" role="form" class="form-horizontal">
                    <div class="form-group sr-only">
                        <label for="studentId" class="col-sm-2 control-label">学生id</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="studentEmployment.studentId" id="studentId"
                                   placeholder="学生id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">学生姓名:</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control" name="studentEmployment.studentName"
                                   id="name"
                                   placeholder="学生姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="headTeacher" class="col-sm-2 control-label">审核人:</label>
                        <div class="col-sm-10">
                            <select id="selectApproverId" class=" selectpicker show-tick " data-live-search="false">
                            <#list roles as rol>
                                <option value="${rol.id}">${rol.userNickname}</option>
                            </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">就业单位:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="studentEmployment.company" id="company"
                                   placeholder="就业单位名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="salary" class="col-sm-2 control-label">就业薪资:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="studentEmployment.salary" id="salary"
                                   placeholder="就业薪资(元)">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="employmentTime" class="col-sm-2 control-label">就业时间:</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" name="studentEmployment.employmentTime"
                                   id="employmentTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="remark" class="col-sm-2 control-label">备注:</label>
                        <div class="col-sm-10">
                            <textarea type="text" class="form-control" name="studentEmployment.remark" id="remark"
                                      placeholder="备注信息" rows="3"></textarea>
                        </div>
                    </div>
                </form>
                <div class="tip-container">
                    <div class="tip" id="saveClassTip" aria-label="0">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-info" type="button"
                        onclick="func.employmentApproval('up')">提交
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="detailInfoModel" tabindex="-1" role="dialog" aria-labelledby="addDetailInfoLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h5 class="modal-title" id="theme">考试信息</h5>
            </div>
            <div class="modal-body">
                <form role="form" class="form-horizontal">
                    <div id="dataTables-list" class="table-responsive dataTables_wrapper form-inline" role="grid">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer"
                               id="dataTables-example" aria-describedby="dataTables-example_apply">
                            <caption id="" class="text-center label-info">历史信息</caption>
                            <thead>
                            <tr>
                                <th>
                                    时间
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