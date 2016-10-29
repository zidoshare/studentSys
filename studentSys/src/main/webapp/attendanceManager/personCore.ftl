<#include "../macro-item.ftl">
<#include "../macro-paginate.ftl">


<div class="panel panel-default">
    <div class="panel-body">

        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label for="typeSelect_list" class="control-label">类型：</label>

                <#assign types=["旷课","请假","迟到","早退"]>
                    <select id="typeSelect_list" class="selectpicker show-tick form-control" data-live-search="true">
                        <option value="" <#if typeName == "不限">selected</#if>>不限</option>
                    <#list types as t>
                        <option value="${t}" <#if typeName == t>selected</#if>>${t}</option>
                    </#list>
                    </select>
                </div>
            </div>
            <div class="col-md-6">
                <label>选择时间范围:</label>
                <div class="row">
                    <div class="col-md-6">
                        <label for="start_time_list" class="sr-only control-label">选择起始时间</label>
                        <div class="date datetimepicker input-group datetimepicker-inline"
                             data-date-format="yyyy-mm-dd">
                            <input id="start_time_list" class="form-control input-sm" type="text"
                                   readonly placeholder="开始时间">

                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                        </div>
                    </div>
                    <div class="col-md-6 front-line">
                        <label for="end_time_list" class="sr-only control-label">选择结束时间</label>
                        <div class="date datetimepicker input-group datetimepicker-inline"
                             data-date-format="dd-mm-yyyy">
                            <input id="end_time_list" placeholder="结束时间" class="form-control input-sm" type="text"
                                   readonly>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="per-list">
            <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
                <table class="table table-striped table-bordered table-hover dataTable no-footer"
                       id="dataTables-example" aria-describedby="dataTables-example_info">
                    <thead>
                    <tr>
                        <th>
                            添加时间
                        </th>
                        <th>
                            类型
                        </th>
                        <th>
                            记录时间
                        </th>
                        <th>
                            记录人
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
                    <form id="attendance" role="form">
                        <tr id="core_form" style="display: none">
                            <td><span class="small text-success">无需填写</span></td>
                            <td>
                                <div class="form-group">
                                    <label for="core_type" class="control-label sr-only">记录类型</label>
                                    <select class="form-control no-border input-sm" name="attendance.type"
                                            id="core_type">
                                        <option value="旷课">旷课</option>
                                        <option value="请假">请假</option>
                                        <option value="迟到">迟到</option>
                                        <option value="早退">早退</option>
                                    </select>
                                </div>
                            </td>

                            <td>
                                <div class="form-group sr-only">
                                    <label for="core_attendanceId" class="col-sm-2 control-label">考勤id</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="attendance.id"
                                               id="core_attendanceId"
                                               placeholder="考勤id">
                                    </div>
                                </div>
                                <div class="form-group sr-only ">
                                    <label for="core_studentId" class="control-label">学生id</label>
                                    <input type="text" class="form-control" name="attendance.studentId"
                                           id="core_studentId"
                                           placeholder="学生id">
                                </div>
                                <div class="form-group sr-only">
                                    <label for="core_createTime" class="control-label">创建时间</label>
                                    <input type="text" class="form-control no-border input-sm"
                                           name="attendance.createTime"
                                           id="core_createTime"
                                           placeholder="创建时间" disabled>
                                </div>
                                <div class="form-group sr-only">
                                    <label for="core_time" class="control-label">记录时间</label>
                                    <input name="attendance.time" class="form-control input-sm no-border" type="text"
                                           id="core_time"
                                           placeholder="创建时间" disabled>
                                </div>

                                <label for="core_time_temp" class="control-label sr-only">记录时间</label>
                                <div class="date datetimepicker input-group no-border input-sm"
                                     data-date-format="yyyy-mm-dd" style="padding: 0;margin: 0;border: none;">
                                    <input id="core_time_temp" class="form-control input-sm" type="text"
                                           readonly placeholder="记录时间">
                                    <span class="input-group-addon input-sm">
                                        <span class="glyphicon glyphicon-calendar">
                                        </span>
                                    </span>
                                </div>
                            </td>
                            <td>
                                <span class="small text-success">无需填写</span>
                                <div class="form-group sr-only">
                                    <label for="core_operaterId" class="control-label sr-only">操作人</label>
                                    <input type="text" class="form-control no-border input-sm"
                                           name="attendance.operaterId"
                                           id="core_operaterId"
                                           placeholder="操作人"
                                           value="${user.id}"
                                           disabled>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="core_message" class="control-label sr-only">备注信息</label>
                                    <input type="text" class="form-control no-border input-sm" name="attendance.message"
                                           id="core_message"
                                           placeholder="备注信息">
                                </div>
                            </td>
                            <td>
                                <a class="res" onclick="func.addAttendance('table-save')">保存</a>
                                <a class="res" onclick="hideTr()">取消</a>
                            </td>
                        </tr>
                    </form>
                    <#list personalAttendancePage.list as at>
                    <tr id="attendance${at.id}">
                        <td>
                        ${at.createTime?number_to_datetime}
                        </td>
                        <td id="core_type${at.id}">
                        ${at.type}
                        </td>
                        <td id="core_time${at.id}">
                        ${at.time?number_to_date}
                        </td>
                        <td>
                        ${userMap["${at.operaterId}"].userNickname}
                        </td>
                        <td id="core_message${at.id}">
                        <#if at.message??>${at.message}<#else>暂无</#if>
                        </td>
                        <td>
                            <a class="res" onclick="func.addAttendance('table','${at.studentId}')">添加</a>
                            /<a class="res" onclick="func.updateAttendance('table','${at.id}','${at.studentId}')">修改</a>
                            /<a class="res" onclick="func.deleteAttendance('${at.id}')">删除</a>
                        </td>
                    </tr>
                    </#list>
                    <#if personalAttendancePage.list?size == 0>
                    <tr>
                        <td colspan="6">
                            <h5 align="center">暂无记录,你可以进行<a class="res"
                                                            onclick="func.addAttendance('table','${student.id}')">添加考勤信息</a>
                            </h5>
                        </td>
                    </tr>
                    </#if>
                    </tbody>
                </table>

            </div>

        </div>
    <#assign str = "?">
    <#if holdPath?contains("?")><#assign str = "&"></#if>
    <@paginate page = personalAttendancePage url=holdPath+str pageAfter="list_p" selector="core-page" method="load" container="#per-list">
    </@paginate>
    </div>

</div>

<script type="text/javascript">
    function hideTr() {
        $('#core_form').hide(300);
    }
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
        var start = new Date(<#if start_time_list??>${start_time_list}</#if>);
        var end = new Date(<#if end_time_list??>${end_time_list}</#if>);
    <#if end_time_list??>
        end.setDate(end.getDate() - 1);
    </#if>
    <#if start_time_list??>
        $('#start_time_list').val(start.getFullYear() + '-' + getzf(start.getMonth() + 1) + '-' + getzf(start.getDate()));
    <#else>
        $('#start_time_list').val(start.getFullYear() + '-' + getzf(start.getMonth() + 1) + '-01');
    </#if>
        $('#end_time_list').val(end.getFullYear() + '-' + getzf(end.getMonth() + 1) + '-' + getzf(end.getDate()));
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
        $('#start_time_list,#end_time_list,#typeSelect_list').on('change', function () {
            var start_chart = new Date($("#start_time_chart").val().replace(/-/g, "/"));
            var end_chart = new Date($('#end_time_chart').val().replace(/-/g, '/'));
            var start_list = new Date($("#start_time_list").val().replace(/-/g, "/"));
            var end_list = new Date($('#end_time_list').val().replace(/-/g, '/'));
            if (start_chart <= end_chart && start_list <= end_list) {
                end_chart.setDate(end_chart.getDate() + 1);
                end_list.setDate(end_list.getDate() + 1);
                var type = $('#typeSelect_list').val();
                loadResult($('#load_pre'), '${staticServePath}/attendanceManager/previewAttendanceList?start_time_list=' + start_list.getTime() + '&end_time_list=' + end_list.getTime() + '&list_type=' + type + '&list_p=' + 1 + '&student=${studentId}', {
                    after: Util.redrawSelects
                });
            } else {
                Util.showTip($('#wholeTip'), '结束时间应大于开始时间', 'alert alert-danger');
            }
        });
    });
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }
</script>