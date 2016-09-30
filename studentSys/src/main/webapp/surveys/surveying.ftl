<#include "../macro-title.ftl">
<@title title="调查列表">
</@title>
<#if surveying?size gt 0>
<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item">
            <div class="panel-heading"></div>
            <div class="panel-body">
                <div class="jumbotron">
                    <h3>你有正在进行中的调查，快开始吧>></h3>
                    <#list surveying as s>
                        <#if s.note??><p>信息：${s.note}</p></#if>
                    </#list>
                    <p><a class="btn btn-primary" href="/surveys/questionnaire" target="_blank" role="button">快速进入</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
</#if>
<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item">
            <div class="panel-heading title">
                调查历史
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer"
                               id="dataTables-example" aria-describedby="dataTables-example_info">
                            <thead>
                            <th>班级</th>
                            <th>调查对象</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>状态</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                            <#list questionnaires as q>
                            <tr>
                                <td>${q.className}</td>
                                <td>${q.toUser}</td>
                                <td>${((q.date)?number)?number_to_datetime}</td>
                                <td>${((q.endTime)?number)?number_to_datetime}</td>
                                <td><#if (q.date?number) < (nowTime?number) && (q.endTime?number) gt (nowTime?number)>
                                    <a class="text-success">正在进行中</a>
                                    <#elseif (q.date?number) gt (nowTime?number)>
                                    <a class="text-danger">尚未开始</a>
                                    <#else>
                                    <a class="text-gray">已完结</a>
                                </#if></td>
                                <td>
                                <#if (q.endTime?number) < (nowTime?number)>
                                    <a href="#">查看</a>
                                <#else>
                                    <a>无法查看</a>
                                </#if>
                                </td>
                            </tr>
                            </#list>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>