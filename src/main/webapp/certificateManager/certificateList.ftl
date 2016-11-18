<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view></@initBtn>
<@item>
<div class="panel-heading title">${view.title}
    <span class="pull-right">${addBtn}</span>
</div>
<div class="panel-body">
    <div class="modal fade" id="addCertificateModel" tabindex="-1"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">填写证书信息</h4>
                </div>
                <div class="modal-body">
                    <form id="certificate" role="form" class="form-horizontal">
                        <div class="form-group sr-only">
                            <label for="certificateId" class="col-sm-2 control-label">证书记录id</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="certificate.id" id="certificateId"
                                       placeholder="证书记录id">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="studentId" class="col-sm-2 control-label">学生姓名</label>
                            <div class="col-sm-10">
                                <select class="selectpicker show-tick form-control" name="certificate.studentId"
                                        id="studentId" data-live-search="true">
                                    <#list students as stu>
                                        <option value="${stu.id}">${stu.name}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>
                        <div class="form-group sr-only">
                            <label for="enrollTime" class="col-sm-2 control-label">入学时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="certificate.enrollTime"
                                       id="enrollTime"
                                       placeholder="入学时间">
                            </div>
                        </div>
                        <div class="form-group sr-only">
                            <label for="endTime" class="col-sm-2 control-label">结业时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="certificate.endTime" id="endTime"
                                       placeholder="结业时间">
                            </div>
                        </div>
                        <div class="form-group sr-only">
                            <label for="addTime" class="col-sm-2 control-label">添加时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="certificate.addTime" id="addTime"
                                       placeholder="添加时间">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="enrollTime_temp" class="col-sm-2 control-label">入学时间</label>
                            <div class="col-sm-10">
                                <div class="date datetimepicker input-group datetimepicker-inline"
                                     data-date-format="yyyy-mm-dd">
                                    <input id="enrollTime_temp" class="form-control input-sm"
                                           type="text" value="${.now?date}"
                                           readonly placeholder="入学时间">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="endTime_temp" class="col-sm-2 control-label">结业时间</label>
                            <div class="col-sm-10">
                                <div class="date datetimepicker input-group datetimepicker-inline"
                                     data-date-format="yyyy-mm-dd">
                                    <input id="endTime_temp" class="form-control input-sm"
                                           type="text" value="${.now?date}"
                                           readonly placeholder="结业时间">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="addTime_temp" class="col-sm-2 control-label">添加时间</label>
                            <div class="col-sm-10">
                                <div class="date datetimepicker input-group datetimepicker-inline"
                                     data-date-format="yyyy-mm-dd">
                                    <input id="addTime_temp" class="form-control input-sm"
                                           type="text" value="${.now?date}"
                                           readonly placeholder="添加时间">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="code" class="col-sm-2 control-label">证书编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="certificate.code"
                                       id="code"
                                       placeholder="证书编号">
                            </div>
                        </div>
                    </form>
                    <div class="tip-container">
                        <div class="tip" id="saveClassTip" aria-label="0">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span class="pull-right">${saveBtn}</span>
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
                        入学时间
                    </th>
                    <th>
                        结业时间
                    </th>
                    <th>
                        证书添加时间
                    </th>
                    <th>
                        证书编号
                    </th>
                    <#if addAble||updateAble||deleteAble>
                        <th>
                            操作
                        </th>
                    </#if>
                </tr>
                </thead>
                <tbody>
                    <#list page.list as c>
                    <tr id="${c.id}">
                        <td>
                            <span id="name${c.id}" data-label="${studentMap["${c.id}"].id}">${studentMap["${c.id}"].name}</span>
                        </td>
                        <td>
                            <span>${classMap["${c.id}"].className}</span>
                        </td>
                        <td>
                            <#if c.enrollTime??><span
                                    id="enrollTime${c.id}">${(c.enrollTime?number)?number_to_date}</span>
                            <#else>
                                未知
                            </#if>
                        </td>
                        <td>
                            <#if c.endTime??><span id="endTime${c.id}">${(c.endTime?number)?number_to_date}</span>
                            <#else>
                                未知
                            </#if>
                        </td>
                        <td>
                            <#if c.addTime??><span id="addTime${c.id}">${(c.addTime?number)?number_to_date}</span>
                            <#else>
                                未知
                            </#if>
                        </td>
                        <td>
                            <#if c.code??>
                                <span id="code${c.id}">${c.code}</span>
                            <#else>
                                未知
                            </#if>
                        </td>
                        <#if updateAble || deleteAble>
                            <td>
                            ${InsertKit(updateBtn,"${c.id}")}
                                /${InsertKit(deleteBtn,"${c.id}")}
                            </td>
                        </#if>
                    </tr>
                    </#list>
                    <#if page.list?size < 1>
                    <tr>
                        <td colspan="<#if updateAble||deleteAble>7<#else>6</#if>">
                            <h5 align="center">暂无记录</h5>
                        </td>
                    </tr>
                    </#if>
                </tbody>
            </table>
            <#if page??>
                <#assign str = "?">
                <#if holdPath?contains("?")><#assign str = "&"></#if>
                <@paginate page = page url=holdPath+str pageAfter="p">
                </@paginate>
            </#if>
        </div>

    </div>
</div>
<script type="text/javascript">
    $('#table-inner').on('pjax:complete', Util.redrawSelects);
    $(function () {

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
            $('.datetimepicker').datetimepicker({
                format: 'yyyy-mm-dd',
                Integer: 1,
                minView: 2,
                bootcssVer: 3,
                showMeridian: true,
                autoclose: true,
                todayBtn: true,
                language: 'zh-CN',
                todayHighlight: true
            });
        });
    });
    $(document).on('pjax:complete', function () {
        Util.redrawSelects();
    });
</script>
</@item>