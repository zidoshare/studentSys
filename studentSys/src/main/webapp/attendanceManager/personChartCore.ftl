
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


