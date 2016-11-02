<#include "../macro-item.ftl">
<#include "../macro-paginate.ftl">
<@item>
<div class="panel-heading title">
    考试历史
</div>
<div class="panel-body">
    <#if testing.list?size gt 0>

        <div id="table-inner">
            <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
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
                            </#if>
                            </td>
                            <td>
                                <#if (q.testQuestionnaireEndTime?number) < (nowTime?number)>
                                    <a class="res" href="javascript:void(0)"
                                       onclick="showModal(${q.testQuestionnaireClassId})">查看</a>
                                <#else>
                                    <span class="text-danger">无法查看</span>
                                </#if>
                            </td>
                        </tr>
                        </#list>

                    </tbody>
                </table>
            </div>
            <#if testing??>
                <#assign str = "?">
                <#if holdPath?contains("?")><#assign str = "&"></#if>
                <@paginate page = testing url=holdPath+str pageAfter="p">
                </@paginate>
            </#if>
        </div>

    <#else>
        <div class="jumbotron">
            <h3>暂无历史记录>></h3>
        </div>
    </#if>
    <div class="modal fade bs-example-modal-lg" id="modal" tabindex="-1" role="dialog"
         aria-labelledby="myLargeModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" style="width: 1200px;">
            <div class="modal-content " id="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <div class="col-md-8">
                            <h3 class="modal-title">查看考试结果</h3>
                        </div>
                        <div class="col-md-4">
                            <h3 class="modal-title">分数：<span id="icon-span" class="text-success"></span></h3>
                        </div>
                    </div>
                    <div id="survey_progress" class="center-block" style="800px;height:1px;background: #dddddd">
                        <div class="progress-bar" role="progressbar"
                             style="width: 0;height:2px;" id="min-progress">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="table-bordered col-md-10 col-lg-offset-1">
                        <div class="pan">
                        </div>
                        <div class="panel_loading">
                            <img src="${staticServePath}/images/loading.gif" class="img-sm center-block"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function showModal(qcId) {
        var dom = $('#modal-content');
        dom.removeClass('sr-only');
        loadResult(dom, "${staticServePath}/test/showCorrecting/" + qcId + "-${student.id}");
        $('#modal').modal('show');
    }
</script>
</@item>