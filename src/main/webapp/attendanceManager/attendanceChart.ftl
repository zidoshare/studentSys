<#include "../macro-item.ftl">
<@item>
<div class="panel-heading title">
${view.title}
</div>
<div class="panel-body">
    <div class="row">
        <div class="col-md-2">
            <div class="form-group">
                <label for="classSelect_chart" class="control-label">班级：</label>

                <select id="classSelect_chart" class="selectpicker show-tick form-control" data-live-search="true">
                    <#list allClass as class>
                        <option value="${class.id}" <#if class_chart?? && class_chart == class.id></#if>>${class.className}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="col-md-2">
            <label for="student_search_chart">搜索</label>
            <div class="input-group">
                <input type="text" id="student_search_chart" <#if student_chart??>value="${student_chart}</#if>"
                       class="form-control" placeholder="学生...">
                <span class="input-group-btn">
                    <a class="btn btn-success" id="student_search_btn_chart">
                        <i class="glyphicon glyphicon-search"></i>
                    </a>
                </span>
            </div>
        </div>
        <div class="col-md-6">
            <label>选择时间范围:</label>
            <div class="row">
                <div class="col-md-6">
                    <label for="all_start_time_chart" class="sr-only control-label">选择起始时间</label>
                    <div class="date datetimepicker input-group datetimepicker-inline"
                         data-date-format="yyyy-mm-dd">
                        <input id="all_start_time_chart" class="form-control input-sm" type="text"
                               readonly placeholder="开始时间" <#if start_time_chart??>value="${start_time_chart}</#if>">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="col-md-6 front-line">
                    <label for="all_end_time_chart" class="sr-only control-label">选择结束时间</label>
                    <div class="date datetimepicker input-group datetimepicker-inline"
                         data-date-format="dd-mm-yyyy">
                        <input id="all_end_time_chart" placeholder="结束时间" class="form-control input-sm" type="text"
                               readonly <#if end_time_chart??>value="${end_time_chart}"</#if>>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="chart-inner">
        <div class="row">
            <#if !find?? || find>

                <#assign colors = ["easypiechart-blue","easypiechart-orange","easypiechart-teal","easypiechart-red"]>
                <#assign keys = ["旷课","请假","迟到","早退"]>
                <#list keys as key>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-body easypiechart-panel">
                                <h4>${key}：<#if childCount[key]??>${childCount[key]}<#else>
                                    0</#if>次</h4>
                                <div class="easypiechart" id="${colors[key?index]}"
                                     data-percent="<#if percentMap[key]??>${percentMap[key]?string("percent")}<#else>0%</#if>"><span
                                        class="percent">
                                    <#if percentMap[key]??>${percentMap[key]?string("percent")}<#else>0%</#if>
                        </span>

                                </div>
                                <div>
                                    <#if state??>
                                        <#if state == 0>
                                            <span class="small text-danger">提示：学生占全班${key}百分比</span>
                                        <#else>
                                            <span class="small text-danger">提示：班级占所有学生${key}百分比</span>
                                        </#if>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            <#else>
                <h3 align="center">未找到该学生(目前仅能详细搜索，你可以在考勤信息列表中进行模糊搜索查看相关信息)</h3>
            </#if>
        </div>
    </div>


</div>
<script type="text/javascript">
    function loadChart() {
        var start_chart = new Date($("#all_start_time_chart").val().replace(/-/g, "/"));
        var end_chart = new Date($('#all_end_time_chart').val().replace(/-/g, '/'));
        var start_list = new Date($("#all_start_time_list").val().replace(/-/g, "/"));
        var end_list = new Date($('#all_end_time_list').val().replace(/-/g, '/'));
        if (start_chart <= end_chart && start_list <= end_list) {
            end_chart.setDate(end_chart.getDate() + 1);
            end_list.setDate(end_list.getDate() + 1);
            var names = $('#student_search_list').val().trim();
            var cla = $('#classSelect_list').val();
            var chartCla = $('#classSelect_chart').val();
            var chartNames = $('#student_search_chart').val().trim();
            Util.loadByPjax('${staticServePath}/attendanceManager/attendance?start_time_list='
                    + start_list.getTime() + '&end_time_list=' + end_list.getTime()
                    + '&class=' + cla + '&student=' + names + '&list_p=' + 1
                    + '&start_time_chart=' + start_chart.getTime()
                    + '&end_time_chart=' + end_chart.getTime() + '&class_chart=' + chartCla + '&student_chart=' + chartNames, {
                container: '#chart-inner',
                complete: function () {
                    Animate.reDraw();
                    Util.mScroll('chart-inner', {speed: 0});
                }
            });
        } else {
            Util.showTip($('#wholeTip'), '结束时间应大于开始时间', 'alert alert-danger');
        }
    }
    $(function () {
        var defaultTime = new Date();
        $('#all_start_time_chart').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-01');
        $('#all_end_time_chart').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-' + Util.getzf(defaultTime.getDate()));
        $('#student_search_btn_chart').on('click', loadChart);
        $('#all_start_time_chart,#all_end_time_chart,#classSelect_chart').on('change', loadChart);
        $('#student_search_chart').keydown(function (e) {
            if (e.keyCode == 13) {
                loadChart();
            }
        });
    });
    $(document).on('pjax:complete',Animate.reDraw);
</script>
</@item>