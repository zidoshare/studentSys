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


    <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
        <table class="table table-striped table-bordered table-hover dataTable no-footer"
               id="dataTables-example" aria-describedby="dataTables-example_info">
            <thead>
            <tr>
                <td>试卷</td>
                <td>开始时间</td>
                <td>结束时间</td>
                <td>状态</td>
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
                    </#if></td>
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
    <script type="text/javascript" src="${staticServePath}/static/js/lib/bootstrap-select.min.js"></script>
    <script type="text/javascript" >
        $(document).on('pjax:complete', function () { //pjax链接加载完成后重新绘制；
            Util.redrawSelects();
        });
        $('.selectpicker').on('changed.bs.select', function (event, index, newValue, oldValue) {

        });
        $('tr[data-label="open-check"]').on("click", function () {
            $(this).siblings('.tr-show').addClass('sr-only');
            var dom = $(this).next();
            dom.removeClass('sr-only');
            loadResult(dom,"${staticServePath}/test/getResults/"+$(this).attr('id'));
        });

    </script>
</div>
</@item>
