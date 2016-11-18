<#include "../macro-item.ftl">
<@item>
<div class="panel-heading title">
${view.title}
</div>
<div class="panel-body">
    <div class="row">
        <div class="col-md-6">
            <label>选择时间范围:</label>
            <div class="row">
                <div class="col-md-6">
                    <label for="start_time_chart" class="sr-only control-label">选择起始时间</label>
                    <div class="date datetimepicker input-group datetimepicker-inline"
                         data-date-format="yyyy-mm-dd">
                        <input id="start_time_chart" class="form-control input-sm" type="text"
                               readonly placeholder="开始时间">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="col-md-6 front-line">
                    <label for="end_time_chart" class="sr-only control-label">选择结束时间</label>
                    <div class="date datetimepicker input-group datetimepicker-inline"
                         data-date-format="dd-mm-yyyy">
                        <input id="end_time_chart" placeholder="结束时间" class="form-control input-sm" type="text"
                               readonly>
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
            <#assign colors = ["easypiechart-blue","easypiechart-orange","easypiechart-teal","easypiechart-red"]>
            <#assign keys = ["旷课","请假","迟到","早退"]>
            <#list keys as key>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-body easypiechart-panel">
                            <h4>${key}：<#if studentCountAttendanceMap[key]??>${studentCountAttendanceMap[key]}<#else>
                                0</#if>次</h4>
                            <div class="easypiechart" id="${colors[key?index]}"
                                 data-percent="<#if percentMap[key]??>${percentMap[key]?string("percent")}<#else>0%</#if>"><span
                                    class="percent">
                                <#if percentMap[key]??>${percentMap[key]?string("percent")}<#else>0%</#if>
                        </span>

                            </div>
                            <div>
                                <span class="small text-danger">提示：占全班旷课百分比</span>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </div>


</div>
<script type="text/javascript">
    $(function () {
        var defaultTime = new Date();
        $('#start_time_chart').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-01');
        $('#end_time_chart').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-' + getzf(defaultTime.getDate()));
        $('#start_time_chart,#end_time_chart').on('change', function () {
            var start_chart = new Date($("#start_time_chart").val().replace(/-/g, "/"));
            var end_chart = new Date($('#end_time_chart').val().replace(/-/g, '/'));
            var start_list = new Date($("#start_time_list").val().replace(/-/g, "/"));
            var end_list = new Date($('#end_time_list').val().replace(/-/g, '/'));
            if (start_chart <= end_chart && start_list <= end_list) {
                end_chart.setDate(end_chart.getDate() + 1);
                end_list.setDate(end_list.getDate() + 1);
                var type = $('#typeSelect_list').val();
                Util.loadByPjax('${staticServePath}/attendanceManager/personalAttendance?start_time_list=' + start_list.getTime() + '&end_time_list=' + end_list.getTime() + '&type=' + type + '&list_p=' + 1 + '&start_time_chart=' + start_chart.getTime() + '&end_time_chart=' + end_chart.getTime() + '&chart_p=' + 1,{container:'#chart-inner',complete:Animate.reDraw});
            } else {
                Util.showTip($('#wholeTip'), '结束时间应大于开始时间', 'alert alert-danger');
            }
        });
    });
    $(document).on('pjax:complete', function () {
        Animate.reDraw();
    });

</script>
</@item>