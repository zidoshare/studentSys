<#include "../macro-item.ftl">
<link rel="stylesheet" href="${staticServePath}/static/css/lib/bootstrap-select.min.css">

<@item>
<div class="panel-heading title">
    <div class="row">
        <div class="col-md-8">
        ${view.title}
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="classSelect" class="sr-only">选择班级：</label>
                <select id="classSelect" data-size="5" data-header="选择一个班级..."
                        class="selectpicker  show-menu-arrow form-control"
                        data-live-search="true">
                    <#list classes as class>
                        <option value="${class.id}">${class.className}</option>
                    </#list>
                </select>
            </div>
        </div>
    </div>
</div>
<div class="panel-body">
    <div id="table-inner">


        <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                   id="dataTables-example" aria-describedby="dataTables-example_info">
                <thead>
                <tr>
                    <td>试卷</td>
                    <td>开始时间</td>
                    <td>结束时间</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                    <#list questionnaires as q>
                    <tr id="${q.testQuestionnaireClassId}" data-label="open-check">
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
                            <#list map["operators"+view.id] as op>
                                <#if q.testQuestionnaireTempTime == 0 && op.url="delayTest">
                                    <a class="res" onclick="func.${op.url}('${q.testQuestionnaireClassId}'')">${op.title}</a>
                                <#elseif  q.testQuestionnaireTempTime gt 0 && op.url="closeTest">
                                    <a class="res" onclick="func.${op.url}('${q.testQuestionnaireClassId}')">${op.title}</a>
                                </#if>
                            </#list>
                        </td>
                    </tr>
                    <tr class="sr-only tr-show">
                        <td colspan="4">
                            <div class="pan"></div>
                            <div class="panel_loading">
                                <img src="${staticServePath}/images/loading.gif" class="img-sm center-block"/>
                            </div>
                        </td>
                    </tr>
                    </#list>

                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-lg" id="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 1200px;">
        <div class="modal-content " id="modal-content">
            <div class="modal-header">
                <div class="row">
                    <div class="col-md-8">
                        <h3 class="modal-title">阅卷</h3>
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
<script type="text/javascript">
    var classes = [<#list classes as class>
        <#if class_index gt 0>,</#if>${class.id}</#list>];
    $(document).on('pjax:complete', function () { //pjax链接加载完成后重新绘制；
        Util.redrawSelects();
    });
    $('.selectpicker').on('changed.bs.select', function (event, index, newValue, oldValue) {
        console.log(event, index, newValue, oldValue);
        $.pjax({
            url: '${staticServePath}/test/count/' + classes[index],
            container: '#table-inner',
            fragment: '#table-inner',
            cache: true,
            maxCacheLength: 5,
            storage: false,
            replace: true
        });
        $('#table-inner').on('pjax:beforeSend', function () { //pjax链接点击后显示加载动画；
            console.log('before');
            event.preventDefault();
        });
        $('#table-inner').on('pjax:complete', function () { //pjax链接加载完成后隐藏加载动画；
            console.log('complete');
            event.preventDefault();
        });
    });
    $('tr[data-label="open-check"]').on("click", function () {
        $(this).siblings('.tr-show').addClass('sr-only');
        var dom = $(this).next();
        dom.removeClass('sr-only');
        loadResult(dom, "${staticServePath}/test/getResults/" + $(this).attr('id'));
    });

</script>
</@item>

