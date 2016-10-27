<#include "../macro-item.ftl">
<@item>
<div class="panel-heading title">
${view.title}
</div>
<div class="panel-body">
    <div class="row">
        <div class="col-md-2">
            <div class="form-group">
                <label for="domainSelect_chart" class="control-label">类型：</label>

                <select id="domainSelect_chart" class="selectpicker show-tick form-control" data-live-search="true">
                    <option value="0">不限</option>
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
                        <input id="start_time_chart" class="form-control input-sm" type="text"
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
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>旷课：5次</h4>
                    <div class="easypiechart" id="easypiechart-blue" data-percent="82"><span
                            class="percent">82%</span>
                    </div>
                    <div>
                        <span class="small text-danger">提示：占全班旷课百分比</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>迟到：6次</h4>
                    <div class="easypiechart" id="easypiechart-orange" data-percent="55">
                        <span class="percent">55%</span>
                    </div>
                    <div>
                        <span class="small text-danger">提示：占全班迟到百分比</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>早退：3次</h4>
                    <div class="easypiechart" id="easypiechart-teal" data-percent="84"><span
                            class="percent">84%</span>
                    </div>
                    <div>
                        <span class="small text-danger">提示：占全班早退百分比</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>请假：3次</h4>
                    <div class="easypiechart" id="easypiechart-red" data-percent="46"><span
                            class="percent">46%</span>
                    </div>
                    <div>
                        <span class="small text-danger">提示：占全班请假百分比</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    $(function(){
        var defaultTime = new Date();
        $('#start_time_chart').val(defaultTime.getFullYear()+'-'+getzf(defaultTime.getMonth())+'-01');
        $('#end_time_chart').val(defaultTime.getFullYear()+'-'+getzf(defaultTime.getMonth())+'-'+getzf(defaultTime.getDate()));
    })
    $(document).on('pjax:complete', function () {
        Animate.reDraw();
    })
</script>
</@item>