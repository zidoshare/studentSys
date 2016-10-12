<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<head>
    <link rel="stylesheet" href="${staticServePath}/static/css/lib/bootstrap-select.min.css">
</head>
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
                            <input type="email" class="form-control" name="testQuestionnaire.testQuestionnaireCreateTime"
                                   id="testQuestionnaireCreateTime" placeholder="试卷总分">
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade in" id="tab2">
                    <div id="tab2_loading" class="panel_loading">
                        <img src="${staticServePath}/images/loading.gif" class="img-sm center-block"/>
                    </div>
                    <div class="form-group">
                        <label for="testQuestionTypeId" class="control-label">题目类型</label>
                        <select class="form-control" name="testQuestion.testQuestionTypeId" id="testQuestionTypeId" onchange="Util.changeModel($('#testQuestionTypeId'))">
                            <option id="option1" value="1" data-label="[&quot;shortModel&quot;]">单选题</option>
                            <option id="option2" value="2" data-label="[&quot;shortModel&quot;]">多选题</option>
                            <option id="option3" value="3" data-label="[&quot;longModel&quot;]">问答题</option>
                            <option id="option4" value="4" data-label="[&quot;longModel&quot;]">编程题</option>
                        </select>
                    </div>
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="basic" class="col-lg-2 control-label">"Basic" (liveSearch enabled)</label>

                            <div class="col-lg-10">
                                <select id="basic" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option>cow</option>
                                    <option data-subtext="option subtext">bull</option>
                                    <option class="get-class" disabled>ox</option>
                                    <optgroup label="test" data-subtext="optgroup subtext">
                                        <option>ASD</option>
                                        <option selected>Bla</option>
                                        <option>Ble</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade in" id="tab3">
                    333333333333
                </div>
            </div>

            <a class="btn btn-default pull-right">下一步</a>
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
<div class="modal fade bs-example-modal-lg" id="addTestQuestionnaireModal" tabindex="-1" role="dialog"
     aria-labelledby="addTestQuestionnaireModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">填写试卷基本信息</h4>
            </div>
            <div class="modal-body">
                <form id="role" role="form" class="form-horizontal">
                    <div class="form-group">
                        <label for="testQuestionnaireTitle" class="col-sm-2 control-label">试卷名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="testQuestionnaire.testQuestionnaireTitle"
                                   id="testQuestionnaireTitle" placeholder="试卷名">
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="testQuestionnaireScore" class="col-sm-2 control-label">分数</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="testQuestionnaire.testQuestionnaireScore"
                                   id="testQuestionnaireScore" placeholder="分数">
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="testQuestionnaireScore" class="col-sm-2 control-label">分数</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="testQuestionnaire.testQuestionnaireScore"
                                   id="testQuestionnaireScore" placeholder="分数">
                        </div>
                    </div>
                </form>
                <div class="checkbox3 checkbox-round sr-only">
                    <input type="checkbox" data-arialabel="1" checked name="${root.id}" id="${root.id}">
                    <label for="${root.id}">
                    </label>
                </div>
                <div id="permissions"
                     style="/*display: none;*//*height:${root.childCount * 40}px;*/overflow-y:auto;overflow-x:hidden; "></div>
                <div class="tip-container">
                    <div class="tip" id="saveRoleTip" aria-label="0">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button data-style="slide-up" id="saveRole-btn" class="btn btn-primary ladda-button"
                        onclick="func.addRole('up')">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>
<script  type="text/javascript" src="${staticServePath}/static/js/lib/bootstrap-select.min.js"></script>
<script type="text/javascript">

    $('#tabBtn2').on('shown.bs.tab',function(e){
        $.holdReady(false);
        if(!$('#tab2_loading').hasClass('sr-only')){

        }
    })
</script>