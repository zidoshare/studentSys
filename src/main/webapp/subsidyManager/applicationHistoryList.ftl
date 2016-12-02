<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view saveLabel="提交"></@initBtn>
<@item>
<div class="panel-heading title">
${view.title}

</div>
<div class="panel-body">

    <div class="row">

        <div class="col-md-8">
            <form class="form-inline">
                <label  class="control-label">选择时间范围:</label>
                <div class="date datetimepicker input-group datetimepicker-inline"
                     data-date-format="yyyy-mm-dd">
                    <input id="all_start_time_list" class="form-control input-sm" type="text"
                           readonly placeholder="开始时间">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                </div>
                <label for="all_end_time_list" class="sr-only control-label">选择结束时间</label>
                <div class="date datetimepicker input-group datetimepicker-inline"
                     data-date-format="dd-mm-yyyy">
                    <input id="all_end_time_list" placeholder="结束时间" class="form-control input-sm" type="text"
                           readonly>
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                </div>
            </form>
        </div>


    </div>


    <div id="table-inner">
        <div id="dataTables-example_subsidy" class="table-responsive dataTables_wrapper form-inline" role="grid">
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                   id="dataTables-example" aria-describedby="dataTables-example_apply">
                <thead>
                <tr>
                    <th>
                        班级
                    </th>
                    <th>
                        助学金
                    </th>
                    <th>
                        奖金
                    </th>
                    <th>
                        合计
                    </th>
                    <th>
                        申请人
                    </th>
                    <th>
                        审批人
                    </th>
                    <th>
                        申请时间
                    </th>
                    <th>
                       状态
                    </th>
                </tr>
                </thead>
                <tbody>
                    <#list saPages.list as sub>
                    <tr>
                        <td>
                            ${sub.className}
                        </td>
                        <td>
                            ${sub.totalSubsidy}
                        </td>
                        <td>
                            ${sub.totalBonus}
                        </td>
                        <td>
                            ${sub.aggregateAmount}
                        </td>
                        <td>
                            ${sub.applicantName}
                        </td>
                        <td>

                        </td>
                        <td>
                        ${(sub.applicationDate?number)?number_to_date}
                        </td>
                        <#--<td>-->
                        <#--${sub.applicantName}-->
                        <#--</td>-->
                        <#--<td>-->
                        <#--<#if sub.status??>-->
                             <#--${sub.status.statusName}-->
                        <#--</#if>-->
                        <#--</td>-->
                        <td>
                        ${sub.approveStatus}
                        </td>
                    </tr>
                    </#list>
                </tbody>
            </table>
            <#if saPages??>
                <#assign str = "?">
                <#if holdPath?contains("?")><#assign str = "&"></#if>
                <@paginate page = saPages url=holdPath+str pageAfter="p">
                </@paginate>
            </#if>

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
        $('#all_start_time_list,#all_end_time_list').on('change', loadAttendance);
    });
    $(document).on('pjax:complete', function () {
        Util.redrawSelects();
    });
    function loadAttendance() {
        var start_list = new Date($("#all_start_time_list").val().replace(/-/g, "/"));
        var end_list = new Date($('#all_end_time_list').val().replace(/-/g, '/'));
        if (start_list <= end_list) {
            end_list.setDate(end_list.getDate() + 1);
        <#--Util.loadByPjax('${staticServePath}/attendanceManager/attendance?start_time_list='-->
        <#--+ start_list.getTime() + '&end_time_list=' + end_list.getTime()-->
        <#--+ '&class=' + cla + '&student=' + names + '&list_p=' + 1-->
        <#--+ '&start_time_chart=' + start_chart.getTime()-->
        <#--+ '&end_time_chart=' + end_chart.getTime() + '&class_chart=' + chartCla+'&student_chart='+chartNames);-->
        } else {
            Util.showTip($('#wholeTip'), '结束时间应大于开始时间', 'alert alert-danger');
        }
    }
</script>
</@item>
