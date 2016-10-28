<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view theme="res"></@initBtn>
<@item>
<div class="panel-heading title">
${view.title}
</div>
<div class="panel-body">
    <div class="row">
        <div class="col-md-2">
            <div class="form-group">
                <label for="classSelect_list" class="control-label">班级：</label>

                <select id="classSelect_list" class="selectpicker show-tick form-control" data-live-search="true">
                    <option value="0">不限</option>
                    <#list allClass as class>
                        <option value="${class.id}">${class.className}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="col-md-2">
            <label for="student_search_list">搜索</label>
            <div class="input-group">
                <input type="text" id="student_search_list" class="form-control" placeholder="学生...">
                <span class="input-group-btn">
                    <a class="btn btn-success" id="student_search_btn_list">
                        <i class="glyphicon glyphicon-search"></i>
                    </a>
                </span>
            </div>
        </div>
        <div class="col-md-6">
            <label>选择时间范围:</label>
            <div class="row">
                <div class="col-md-6">
                    <label for="all_start_time_list" class="sr-only control-label">选择起始时间</label>
                    <div class="date datetimepicker input-group datetimepicker-inline"
                         data-date-format="yyyy-mm-dd">
                        <input id="all_start_time_list" class="form-control input-sm" type="text"
                               readonly placeholder="开始时间">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="all_end_time_list" class="sr-only control-label">选择结束时间</label>
                    <div class="date datetimepicker input-group datetimepicker-inline"
                         data-date-format="dd-mm-yyyy">
                        <input id="all_end_time_list" placeholder="结束时间" class="form-control input-sm" type="text"
                               readonly>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="table-inner">
        <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
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
                        旷课
                    </th>
                    <th>
                        请假
                    </th>
                    <th>
                        迟到
                    </th>
                    <th>
                        早退
                    </th>
                    <#if addAble||updateAble||deleteAble>
                        <th>
                            操作
                        </th>
                    </#if>
                </tr>
                </thead>
                <tbody>
                    <#list counts as count>
                    <tr id="${count.student.id}">
                        <td>
                        ${count.student.name}
                        </td>
                        <td>
                        ${count.aClass.className}
                        </td>
                        <td>
                            <#if count.perTypeMap["旷课"]??>
                            ${count.perTypeMap["旷课"]}
                            <#else>
                                0
                            </#if>
                            <#if claTypeMap["${count.aClass.id}"]["旷课"]??>
                                /${claTypeMap["${count.aClass.id}"]["旷课"]}
                            <#else>
                                /0
                            </#if>
                        </td>
                        <td>
                            <#if count.perTypeMap["请假"]??>
                            ${count.perTypeMap["请假"]}
                            <#else>
                                0
                            </#if>
                            <#if claTypeMap["${count.aClass.id}"]["请假"]??>
                                /${claTypeMap["${count.aClass.id}"]["请假"]}
                            <#else>
                                /0
                            </#if>
                        </td>
                        <td>
                            <#if count.perTypeMap["迟到"]??>
                            ${count.perTypeMap["迟到"]}
                            <#else>
                                0
                            </#if>
                            <#if claTypeMap["${count.aClass.id}"]["迟到"]??>
                                /${claTypeMap["${count.aClass.id}"]["迟到"]}
                            <#else>
                                /0
                            </#if>
                        </td>
                        <td>
                            <#if count.perTypeMap["早退"]??>
                            ${count.perTypeMap["早退"]}
                            <#else>
                                0
                            </#if>
                            <#if claTypeMap["${count.aClass.id}"]["早退"]??>
                                /${claTypeMap["${count.aClass.id}"]["早退"]}
                            <#else>
                                /0
                            </#if>
                        </td>
                        <#if addAble||updateAble||deleteAble>
                            <td>
                            ${InsertKit(updateBtn,"${count.student.id}")}/${InsertKit(addBtn,"${count.student.id}")}
                                /${InsertKit(deleteBtn,"${count.student.id}")}
                            </td>
                        </#if>
                    </tr>
                    </#list>
                    <#if counts?size < 1>
                    <tr>
                        <td colspan="<#if addAble||updateAble||deleteAble>7<#else>6</#if>">
                            <h5 align="center">暂无记录</h5>
                        </td>
                    </tr>
                    </#if>
                </tbody>
            </table>
            <#if page??>
                <#assign str = "?">
                <#if holdPath?contains("?")><#assign str = "&"></#if>
                <@paginate page = page url=holdPath+str pageAfter="list_p">
                </@paginate>
            </#if>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-lg" id="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 1200px;">
        <div class="modal-content " id="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">查看详情</h3>
            </div>

            <div id="load_pre">
                <div class="panel_loading">
                    <img src="${staticServePath}/images/loading.gif" class="img-sm center-block"/>
                </div>
                <div class="pan">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addAttendanceModal" tabindex="-1" role="dialog" aria-labelledby="addAttendanceModelLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">添加考勤信息</h4>
            </div>
            <div class="modal-body">
                <form id="attendance" role="form">
                    <div class="form-group sr-only">
                        <label for="attendanceId" class="col-sm-2 control-label">考勤id</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="attendance.id" id="attendanceId"
                                   placeholder="考勤id">
                        </div>
                    </div>
                    <div class="form-group sr-only ">
                        <label for="studentId" class="control-label">学生id</label>
                        <input type="text" class="form-control" name="attendance.studentId" id="studentId"
                               placeholder="学生id">
                    </div>
                    <div class="form-group">
                        <label for="studentName" class="control-label">学生姓名</label>
                        <input type="text" class="form-control" id="studentName"
                               placeholder="学生姓名" readonly>
                    </div>
                    <div class="form-group sr-only">
                        <label for="createTime" class="control-label">创建时间</label>
                        <input type="text" class="form-control" name="attendance.createTime"
                               id="createTime"
                               placeholder="创建时间" disabled>
                    </div>
                    <div class="form-group sr-only">
                        <label for="time" class="control-label">记录时间</label>
                        <input name="attendance.time" class="form-control input-sm" type="text"
                               id="time"
                               placeholder="创建时间" disabled>
                    </div>
                    <label for="time_temp" class="control-label">记录时间</label>
                    <div class="date datetimepicker input-group"
                         data-date-format="yyyy-mm-dd">
                        <input id="time_temp" class="form-control input-sm" type="text"
                               readonly placeholder="记录时间">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                    <div class="form-group">
                        <label for="type" class="control-label">记录类型</label>
                        <select class="form-control" name="attendance.type" id="type">
                            <option value="旷课">旷课</option>
                            <option value="请假">请假</option>
                            <option value="迟到">迟到</option>
                            <option value="早退">早退</option>
                        </select>
                    </div>
                    <div class="form-group sr-only">
                        <label for="operaterId" class="control-label">操作人</label>
                        <input type="text" class="form-control" name="attendance.operaterId"
                               id="operaterId"
                               placeholder="操作人"
                               value="${user.id}"
                               disabled>
                    </div>
                    <div class="form-group">
                        <label for="message" class="control-label">备注信息</label>
                        <input type="text" class="form-control" name="attendance.message"
                               id="message"
                               placeholder="备注信息">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <span class="pull-right">${saveBtn}</span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $.fn.datetimepicker.dates['zh-CN'] = {
        days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
        daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        daysMin: ["日", "一", "二", "三", "四", "五", "六", "日"],
        months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一", "十二"],
        today: "今天",
        suffix: [],
        meridiem: ["上午", "下午"]
    };
    $(function () {
        var defaultTime = new Date();
        $('#all_start_time_list').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-01');
        $('#all_end_time_list').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-' + Util.getzf(defaultTime.getDate()));
        $('.datetimepicker').datetimepicker({
            format: 'yyyy-mm-dd',
            Integer: 1,
            minView: 2,
            bootcssVer: 3,
            endDate: new Date(),
            showMeridian: true,
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN',
            todayHighlight: true
        });
        $('#student_search_btn_list').on('click', loadAttendance);
        $('#all_start_time_list,#all_end_time_list,#classSelect_list').on('change', loadAttendance);
        $('#student_search_list').keydown(function (e) {
            if (e.keyCode == 13) {
                loadAttendance();
            }
        });
    });
    $(document).on('pjax:complete', function () {
        Util.redrawSelects();
    });
    function loadAttendance() {
        var start_chart = new Date($("#start_time_chart").val().replace(/-/g, "/"));
        var end_chart = new Date($('#end_time_chart').val().replace(/-/g, '/'));
        var start_list = new Date($("#all_start_time_list").val().replace(/-/g, "/"));
        var end_list = new Date($('#all_end_time_list').val().replace(/-/g, '/'));
        if (start_chart <= end_chart && start_list <= end_list) {
            end_chart.setDate(end_chart.getDate() + 1);
            end_list.setDate(end_list.getDate() + 1);
            var names = $('#student_search_list').val().trim();
            var cla = $('#classSelect_list').val();
            Util.loadByPjax('${staticServePath}/attendanceManager/attendance?start_time_list=' + start_list.getTime() + '&end_time_list=' + end_list.getTime() + '&class=' + cla + '&student=' + names + '&list_p=' + 1 + '&start_time_chart=' + start_chart.getTime() + '&end_time_chart=' + end_chart.getTime() + '&chart_p=' + 1);
        } else {
            Util.showTip($('#wholeTip'), '结束时间应大于开始时间', 'alert alert-danger');
        }
    }
</script>
</@item>