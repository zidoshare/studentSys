<#include "../macro-title.ftl">
<#include "../macro-item.ftl">
<#include "../macro-paginate.ftl">
<#if testing.list?size gt 0>
    <@item>

    <div class="panel-heading title">
    ${view.title}
    </div>
    <div class="panel-body">
        <div id="page-inner">


            <div class="jumbotron">
                <h3>你有正在进行中的考试，快开始吧>></h3>

                <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline"
                     role="grid">
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
                            <#list testing.list as q>
                            <tr>
                                <td>${q.testQuestionnaireTitle}</td>
                                <td>${((q.testQuestionnaireStartTime)?number)?number_to_datetime}</td>
                                <td>${((q.testQuestionnaireEndTime)?number)?number_to_datetime}</td>
                                <td><#if (q.testQuestionnaireStartTime?number) < (nowTime?number) && (q.testQuestionnaireEndTime?number) gt (nowTime?number)>
                                    <span class="text-success">正在进行中</span>
                                <#elseif (q.testQuestionnaireStartTime?number) gt (nowTime?number)>
                                    <span class="text-danger">尚未开始</span>
                                <#else>
                                    <span class="text-gray">已完结</span>
                                </#if></td>
                                <td>
                                    <a href="${staticServePath}/test/questionnaire/${q.testQuestionnaireClassId}"
                                       class="text-success"
                                       target="_blank">快速开始>></a>
                                </td>
                            </tr>
                            </#list>

                        </tbody>
                    </table>
                </div>

            </div>
            <#if testing??>
                <#assign str = "?">
                <#if holdPath?contains("?")><#assign str = "&"></#if>
                <@paginate page = testing url=holdPath+str pageAfter="p">
                </@paginate>
            </#if>
        </div>
    </div>

    </@item>
<#else>
    <@item>
    <div class="panel-heading title">
    ${view.title}
    </div>
    <div class="panel-body">
        <div class="jumbotron">
            <h3>暂无正在进行的考试>></h3>
        </div>
    </div>
    </@item>
</#if>