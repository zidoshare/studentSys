<#include "../macro-item.ftl">
<@item>
<div class="panel-heading title">
${view.title}
</div>
<div class="panel-body">
    <div class="row">
        <div class="col-md-2">
            <div class="form-group">
                <label for="domainSelect_list" class="control-label">类型：</label>

                <select id="domainSelect_list" class="selectpicker show-tick form-control" data-live-search="true">
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
    <div id="table-inner">
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
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="5">
                        <h5 align="center">暂无记录</h5>
                    </td>
                </tr>
                </tbody>
            </table>
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
        console.log('ready');
        var defaultTime = new Date();
        $('#start_time_list').val(defaultTime.getFullYear()+'-'+getzf(defaultTime.getMonth()+1)+'-01');
        $('#end_time_list').val(defaultTime.getFullYear()+'-'+getzf(defaultTime.getMonth()+1)+'-'+getzf(defaultTime.getDate()));
        $('.datetimepicker').datetimepicker({
            format: 'yyyy-mm-dd',
            Integer: 1,
            minView: 2,
            bootcssVer: 3,
            endDate : new Date(),
            showMeridian: true,
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN',
            todayHighlight: true
        });
    });
    $(document).on('pjax:complete', function () {
        Util.redrawSelects();
    });
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }
</script>
</@item>