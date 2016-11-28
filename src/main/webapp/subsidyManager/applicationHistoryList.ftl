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
                        编号
                    </th>
                    <th>
                        申请时间
                    </th>
                    <th>
                        申请人
                    </th>
                    <th>
                        申请状态
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                    <#list saPages.list as sub>
                    <tr>
                        <td>
                            ${sub_index+1}
                        </td>
                        <td>
                        ${(sub.applicationDate?number)?number_to_date}
                        </td>
                        <td>
                        ${sub.applicantName}
                        </td>
                        <td>
                        <#if sub.status??>
                             ${sub.status.statusName}
                        </#if>
                        </td>
                        <td>

                        </td>
                    </tr>
                    </#list>
                <#--<#list classes.list as class>-->
                <#--<tr id="class${class.id}" data-label="${class.id}"  data-target="#classId" data-method="prop">-->
                <#--<td id="className${class.id}" data-label="${class.className?html}" data-target="#className">${class.className}</td>-->
                <#--<td id="number${class.id}" data-label="${class.number}" data-target="#number">${class.number}</td>-->
                <#--<td id="subsidyAmount${class.id}" data-label="${class.subsidyAmount}" data-target="#subsidyAmount">${class.subsidyAmount}</td>-->
                <#--<td id="bonus${class.id}" data-label="${class.bonus}" data-target="bonus">${class.bonus}</td>-->
                <#--<td id="total${class.id}" data-label="${class.total}" data-target="total">${class.total}</td>-->
                <#--<td id="applicant${class.id}" data-label="${class.applicant}" data-target="applicant">${class.applicant}</td>-->
                <#--<#if updateAble || deleteAble>-->
                <#--<td>-->
                <#--<#if updateAble>-->
                <#--${InsertKit(updateBtn,"${class.id}")}/-->
                <#--</#if>-->
                <#--${InsertKit(deleteBtn,"${class.id}")}-->
                <#--</td>-->
                <#--</#if>-->
                <#--<td id="classUpdateTime${class.id}" class="hidden" data-label="${class.classUpdateTime}" data-target="#classUpdateTime" data-method="prop">-->
                <#--</td>-->
                <#--</tr>-->
                <#--</#list>-->

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
