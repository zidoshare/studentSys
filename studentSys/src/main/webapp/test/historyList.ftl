<#include "../macro-item.ftl">
<@item>
<div class="panel-heading title">
    考试历史
</div>
<div class="panel-body">
    <#if testing?size gt 0>

        <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                   id="dataTables-example" aria-describedby="dataTables-example_info">
                <thead>
                <th>试卷</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>状态</th>
                <th>操作</th>
                </thead>
                <tbody>
                    <#list testing as q>
                    <tr>
                        <td>${q.testQuestionnaireTitle}</td>
                        <td>${((q.testQuestionnaireStartTime)?number)?number_to_datetime}</td>
                        <td><#if q.testQuestionnaireTempTime?number == 5000000000000>${((q.testQuestionnaireEndTime)?number)?number_to_datetime}<#else>max</#if></td>
                        <td><#if (q.testQuestionnaireStartTime?number) < (nowTime?number) && (q.testQuestionnaireEndTime?number) gt (nowTime?number)>
                            <span class="text-success">正在进行中</span>
                        <#elseif (q.testQuestionnaireStartTime?number) gt (nowTime?number)>
                            <span class="text-danger">尚未开始</span>
                        <#else>
                            <span class="text-gray">已完结</span>
                        </#if>
                        </td>
                        <td>
                            <#if (q.testQuestionnaireEndTime?number) < (nowTime?number)>
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

    <#else>
        <div class="jumbotron">
            <h3>暂无历史记录>></h3>
        </div>
    </#if>
</div>

</@item>