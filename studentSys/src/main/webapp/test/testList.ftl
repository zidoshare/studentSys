<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<@item>
    <@initBtn map = map view=view></@initBtn>
<link rel="stylesheet" href="${staticServePath}/static/css/lib/bootstrap-select.min.css">
<div class="panel-heading title">${view.title}
    <span class="pull-right">${addBtn}</span><span class="pull-right">&nbsp</span>
    <span class="pull-right"><a class="btn btn-success"
                                onclick="func.distributeTestQuestionnaire('show');redrawSelects()">分配试卷</a></span>
</div>
<div class="panel-body">
    <ul id="model-nav" class="nav nav-tabs hidden">

    </ul>
    <div class="tab-content" id="model-content">


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
                    <tr id="testQuestionnaire${q.id}">
                        <td id="testQuestionnaireTitle${q.id}"
                            data-label="${q.testQuestionnaireTitle?html}">${q.testQuestionnaireTitle}</td>
                        <td id="testQuestionnaireCreateTime${q.id}"
                            data-label="${q.testQuestionnaireCreateTime}">${(q.testQuestionnaireCreateTime?number)?number_to_datetime}</td>
                        <td id="testQuestionnaireScore${q.id}"
                            data-label="${q.testQuestionnaireScore}">${q.testQuestionnaireScore}</td>
                        <td id="testQuestionnaireUserNickname${q.id}"
                            data-label="${operaterMap["${q.id}"].userNickname}">${operaterMap["${q.id}"].userNickname}</td>
                        <#if updateAble || deleteAble>
                            <td>
                                <#if updateAble>
                                ${InsertKit(updateBtn,"${q.id}")}/
                                </#if>
                            ${InsertKit(deleteBtn,"${q.id}")}
                            </td>
                        </#if>
                        <td id="testQuestionnaireMessage${q.id}" class="hidden"
                            data-label="${q.testQuestionnaireMessage?html}">

                        </td>
                        <td id="testQuestionnaireTypeList${q.id}" class="hidden"
                            data-label="${q.testQuestionnaireTypeList?html}">

                        </td>
                        <td id="testQuestionnaireUpdateTime${q.id}" class="hidden"
                            data-label="${q.testQuestionnaireUpdateTime}">
                        ${q.testQuestionnaireUpdateTime}
                        </td>
                    </tr>
                    </#list>


                </tbody>
            </table>
        </div>
    </div>
</div>
<div id="template" class="hidden">
    <ul class="nav nav-tabs">
        <li id="add-nav" class="active"><a href="#addTestQuestionnaire" data-toggle="tab">组卷
            <button type="button" class="close"
                    onclick="closePanel('#add-nav','#addTestQuestionnaire');Util.clearPanel($('#inputQuestionnairePanel'),{hidden:false})"
                    aria-hidden="true">&times;</button>
        </a></li>
        <li id="distribute-nav"><a href="#distribute" data-toggle="tab">分配试卷
            <button type="button" class="close" onclick="closePanel('#distribute-nav','#distribute')"
                    aria-hidden="true">&times;</button>
        </a></li>
    </ul>
    <div class="tab-content" id="template-content">
        <div class="tab-pane" id="addTestQuestionnaire">
            <div class="panel panel-default" id="inputQuestionnairePanel"<#-- style="display: none"-->>
                <div class="panel-heading">
                    <h3 align="center">组卷</h3>
                </div>

                <div class="panel-body">
                    <ul class="nav nav-pills nav-tabs nav-justified step step-arrow">
                        <li class="active">
                            <a id="show1" onclick="Util.step($('#tabBtn1'),$('#show1'))">填写基本信息</a>
                        </li>
                        <li>
                            <a id="show2" onclick="Util.step($('#tabBtn2'),$('#show2'))">选择题目</a>
                        </li>
                        <li>
                            <a id="show3" onclick="Util.step($('#tabBtn3'),$('#show3'))">预览提交</a>
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
                            <form role="form" id="testQuestionnaire">
                                <div class="form-group sr-only">
                                    <label for="testQuestionnaireId">试卷id：</label>
                                    <input type="text" class="form-control" name="testQuestionnaire.id"
                                           id="testQuestionnaireId" placeholder="试卷标题">
                                </div>
                                <div class="form-group">
                                    <label for="testQuestionnaireTitle">试卷标题：</label>
                                    <input type="text" class="form-control"
                                           name="testQuestionnaire.testQuestionnaireTitle"
                                           id="testQuestionnaireTitle" placeholder="试卷标题">
                                </div>
                                <div class="form-group">
                                    <label for="testQuestionnaireMessage">试卷备注信息：</label>
                                    <input type="text" class="form-control"
                                           name="testQuestionnaire.testQuestionnaireMessage"
                                           id="testQuestionnaireMessage" placeholder="试卷备注信息">
                                </div>
                                <div class="form-group sr-only">
                                    <label for="testQuestionnaireScore">试卷总分：</label>
                                    <input type="text" class="form-control"
                                           name="testQuestionnaire.testQuestionnaireScore"
                                           id="testQuestionnaireScore" placeholder="试卷总分">
                                </div>
                                <div class="form-group sr-only">
                                    <label for="testQuestionnaireCreateTime">试卷创建时间：</label>
                                    <input type="text" class="form-control"
                                           name="testQuestionnaire.testQuestionnaireCreateTime"
                                           id="testQuestionnaireCreateTime" placeholder="试卷创建时间">
                                </div>
                                <div class="form-group sr-only">
                                    <label for="testQuestionnaireUpdateTime">试卷修改时间：</label>
                                    <input type="text" class="form-control"
                                           name="testQuestionnaire.testQuestionnaireUpdateTime"
                                           id="testQuestionnaireUpdateTime" placeholder="试卷修改时间">
                                </div>
                                <div class="form-group sr-only">
                                    <label for="testQuestionnaireTypeList">已选择的题目：</label>
                                    <input type="text" class="form-control" id="testQuestionnaireTypeList"
                                           name="testQuestionnaire.testQuestionnaireTypeList"
                                           value="[[],[]]">
                                </div>
                                <div class="form-group sr-only">
                                    <label for="testQuestionnaireOperaterId">操作用户</label>
                                    <input type="text" class="form-control" id="testQuestionnaireOperaterId"
                                           name="testQuestionnaire.testQuestionnaireOperaterId"
                                    >
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
                            <span class="pull-right">${saveBtn}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="distribute">
            <div class="panel panel-default">
                <div class="panel-body">

                    <form id="testQuestionnaireClass">
                        <div class="form-group">
                            <label for="testQuestionnaireId" class="control-label">试卷：</label>
                            <select name="testQuestionnaireClass.testQuestionnaireId" id="testQuestionnaireId"
                                    class="selectpicker show-tick form-control" data-live-search="true">
                                <#list questionnaires as q>
                                    <option value="${q.id}">${q.testQuestionnaireTitle}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="classId" class="control-label">班级：</label>
                            <select name="testQuestionnaireClass.classId" id="classId"
                                    class="selectpicker show-tick form-control" data-live-search="true">
                                <#list classes as class>
                                    <option value="${class.id}">${class.className}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="testQuestionnaireStartTime">开始时间：</label>
                            <input type="text" class="form-control"
                                   name="testQuestionnaireClass.testQuestionnaireStartTime"
                                   id="testQuestionnaireStartTime" placeholder="开始时间">
                        </div>
                        <div class="form-group">
                            <label for="testQuestionnaireEndTime">结束时间：</label>
                            <input type="text" class="form-control"
                                   name="testQuestionnaireClass.testQuestionnaireEndTime"
                                   id="testQuestionnaireEndTime" placeholder="结束时间">
                        </div>
                    </form>
                    <span class="pull-right"><button data-style="slide-up" id="save-d-btn"
                                                     class="btn btn-success ladda-button"
                                                     onclick="func.distributeTestQuestionnaire('up');"><span
                            class="ladda-label">保存</span></button></span>
                    <br/>
                    <br/>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${staticServePath}/static/js/lib/bootstrap-select.min.js"></script>
<script type="text/javascript">
    var isChanged = true;
    $('#tabBtn2').on('shown.bs.tab', function (e) {
        e.preventDefault();
        if ($('#testQuestionnaireTypeList').val().length < 2)
            $('#testQuestionnaireTypeList').val('[[],[]]');
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
    $('#tabBtn3').on('shown.bs.tab', function (e) {
        e.preventDefault();

        if (isChanged) {
            $('#tab3_loading').removeClass('sr-only');
            var str = '';
            var id = $('#testQuestionnaireId').val();
            console.log('id = ' + id);
            if (id != null)
                str = '&id=' + id;
            $('#load_preview').load('${staticServePath}/test/preview?questions=' + $('#testQuestionnaireTypeList').val() + str, function (response, status, xhr) {
                //TODO  当服务器重启而页面不刷新时，点击会发生错误，尚未处理掉，会发生错误
                if (status == 'success') {
                    $('#tab3_loading').addClass('sr-only');
                    isChanged = false;
                }
                else
                    window.location.href = '${staticServePath}/user/showLogin';
            });
        }
    });
    function closePanel(nav, dom) {
        $('#template>ul:nth-child(1)').append($(nav));
        //不知道为什么，这里用这个不行
        //console.log($('#template>div:nth-child(1)'));
        $('#template-content').append($(dom));
        var nav = $('#model-nav');
        if (nav.children().length <= 0) {
            nav.addClass('hidden');
        }
    }
    function redrawSelects() {
        $(".selectpicker").each(function (index, dom) {
            var b = $(dom);
            $.fn.selectpicker.call(b, b.data())
        });
    }
</script>
</@item>