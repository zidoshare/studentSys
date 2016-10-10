<#include "../macro-title.ftl">
<#include "../macro-item.ftl">
<@title title="参加考试">
</@title>
<#if testing?size gt 0>
<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item">
            <div class="panel-heading"></div>
            <div class="panel-body">

                <div class="jumbotron">
                    <h3>你有正在进行中的调查，快开始吧>></h3>
                    <div class="table-responsive">
                        <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                   id="dataTables-example" aria-describedby="dataTables-example_info">
                                <thead>
                                <tr>
                                    <th>试卷</th>
                                    <th>开始时间</th>
                                    <th>结束时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <#list testing as q>
                                    <tr>
                                        <td>${q.testQuestionnaireTitle}</td>
                                        <td>${((q.testQuestionnaireStartTime)?number)?number_to_datetime}</td>
                                        <td>${((q.testQuestionnaireEndTime)?number)?number_to_datetime}</td>
                                        <td><#if (q.testQuestionnaireStartTime?number) < (nowTime?number) && (q.testQuestionnaireEndTime?number) gt (nowTime?number)>
                                            <a class="text-success">正在进行中</a>
                                        <#elseif (q.testQuestionnaireStartTime?number) gt (nowTime?number)>
                                            <a class="text-danger">尚未开始</a>
                                        <#else>
                                            <a class="text-gray">已完结</a>
                                        </#if></td>
                                        <td>
                                            <a href="/surveys/questionnaire/${q.id}" class="text-success" target="_blank">快速开始>></a>
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
</div>
<#else>
<@item>
<div class="panel-body">
    <h2 align="center">没有正在进行的考试</h2>
</div>
</@item>
</#if>