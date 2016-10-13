<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<link rel="stylesheet" href="${staticServePath}/static/css/lib/bootstrap-select.min.css">
<@item>
<div class="panel-heading title">${view.title}
    <span class="pull-right">${addBtn}</span>
</div>
<div class="panel-body">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 align="center">组卷</h3>
        </div>
        <div class="panel-body">
            <ul class="nav nav-pills nav-tabs nav-justified step step-arrow">
                <li class="active">
                    <a id="show1" onclick="Util.step($('#tabBtn1'),$('#show1'))">step1</a>
                </li>
                <li>
                    <a id="show2" onclick="Util.step($('#tabBtn2'),$('#show2'))">step2</a>
                </li>
                <li>
                    <a id="show3" onclick="Util.step($('#tabBtn3'),$('#show3'))">step3</a>
                </li>
            </ul>
            <ul class="nav nav-pills nav-tabs nav-justified step step-arrow sr-only">
                <li class="active">
                    <a href="#tab1" id="tabBtn1" data-toggle="pill">step1</a>
                </li>
                <li>
                    <a href="#tab2" id="tabBtn2" data-toggle="pill">step2</a>
                </li>
                <li>
                    <a href="#tab3" id="tabBtn3" data-toggle="pill">step3</a>
                </li>
            </ul>
            <div id="tablesContent" class="tab-content">
                <div class="tab-pane fade in active" id="tab1">
                    <form role="form">
                        <div class="form-group">
                            <label for="testQuestionnaireTitle">试卷标题：</label>
                            <input type="email" class="form-control" name="testQuestionnaire.testQuestionnaireTitle"
                                   id="testQuestionnaireTitle" placeholder="试卷标题">
                        </div>
                        <div class="form-group">
                            <label for="testQuestionnaireMessage">试卷备注信息：</label>
                            <input type="email" class="form-control" name="testQuestionnaire.testQuestionnaireMessage"
                                   id="testQuestionnaireMessage" placeholder="试卷备注信息">
                        </div>
                        <div class="form-group sr-only">
                            <label for="testQuestionnaireScore">试卷总分：</label>
                            <input type="email" class="form-control" name="testQuestionnaire.testQuestionnaireScore"
                                   id="testQuestionnaireScore" placeholder="试卷总分">
                        </div>
                        <div class="form-group sr-only">
                            <label for="testQuestionnaireCreateTime">试卷创建时间：</label>
                            <input type="email" class="form-control"
                                   name="testQuestionnaire.testQuestionnaireCreateTime"
                                   id="testQuestionnaireCreateTime" placeholder="试卷总分">
                        </div>
                        <div class="form-group">
                            <label for="selectedQuestions">已选择的题目：</label>
                            <input type="text" class="form-control" id="selectedQuestions" name="selectedQuestions" value="[[],[]]">
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade in" id="tab2">
                    <div id="tab2_loading" class="panel_loading">
                        <img src="${staticServePath}/images/loading.gif" class="img-sm center-block"/>
                    </div>
                    <div id="load_questions"></div>
                </div>
                <div class="tab-pane fade in" id="tab3">
                    <div id="tab3_loading" class="panel_loading">
                        <img src="${staticServePath}/images/loading.gif" class="img-sm center-block"/>
                    </div>
                    <div id="load_preview"></div>
                </div>
            </div>

            <a class="btn btn-default pull-right" onclick="func.postTestQuestionnaire()">保存</a>
        </div>
    </div>
    <div class="table-responsive">
        <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                   id="dataTables-example" aria-describedby="dataTables-example_info">
                <thead>
                <tr>

                    <th>
                        试卷
                    </th>
                    <th>
                        创建时间
                    </th>
                    <th>
                        分数
                    </th>
                    <th>
                        创建者
                    </th>
                    <#if updateAble || deleteAble>
                        <th>
                            操作
                        </th>
                    </#if>
                </tr>
                </thead>
                <tbody>

                    <#list questionnaires as q>
                    <tr>
                        <td>${q.testQuestionnaireTitle}</td>
                        <td>${(q.testQuestionnaireCreateTime?number)?number_to_datetime}</td>
                        <td>${q.testQuestionnaireScore}</td>
                        <td>${q.testQuestionnaireOperater}</td>
                        <#if updateAble || deleteAble>
                            <td>
                                <@macroUpdateBtn q.id></@macroUpdateBtn>
                                <@macroDeleteBtn q.id></@macroDeleteBtn>
                                <#if updateAble>
                                ${updateBtn}/
                                </#if>
                            ${deleteBtn}
                            </td>
                        </#if>
                    </tr>
                    </#list>


                </tbody>
            </table>
        </div>
    </div>
</div>
</@item>
<script type="text/javascript">
    $('#tabBtn2').on('shown.bs.tab', function (e) {
        e.preventDefault();

        if (!$('#tab2_loading').hasClass('sr-only')) {
            $('#load_questions').load('${staticServePath}/test/selectQuestions', function (response, status, xhr) {
                //TODO  当服务器重启而页面不刷新时，点击会发生错误，尚未处理掉，会发生错误
                if (status == 'success')
                    $('#tab2_loading').addClass('sr-only');
                else
                    window.location.href = '${staticServePath}/user/showLogin';
            });
        }
    });
    $('#tabBtn3').on('shown.bs.tab',function(e){
        e.preventDefault();
        if (!$('#tab3_loading').hasClass('sr-only')) {
            $('#load_preview').load('${staticServePath}/test/preview?questions='+$('#selectedQuestions').val(), function (response, status, xhr) {
                //TODO  当服务器重启而页面不刷新时，点击会发生错误，尚未处理掉，会发生错误
                if (status == 'success')
                    $('#tab3_loading').addClass('sr-only');
                else
                    window.location.href = '${staticServePath}/user/showLogin';
            });
        }
    });
</script>