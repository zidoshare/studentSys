<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view></@initBtn>
<@item>
<div class="panel-heading title">
${view.title}
    <span class="pull-right">${addBtn}</span>
</div>
<div class="panel-body">
    <div class="row">

        <div class="col-md-4">
            <div class="form-group">
                <label for="testQuestionTypeId" class="control-label">题目类型：</label>
                <select class="form-control" name="testQuestion.testQuestionTypeId" id="testQuestionTypeId"
                        onclick="">
                    <option id="option0" value="0">不限</option>
                    <#list types as type>
                        <option id="option${type.id}" value="${type.id}" <#if type.id == typeId>selected</#if>>${type.typeName}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="domainSelect" class="control-label">标签分类：</label>

                <select id="domainSelect" class="selectpicker show-tick form-control" data-live-search="true">
                    <option value="0">不限</option>
                    <#list domains as domain>
                        <option value="${domain.id}" <#if domain.id == domainId>selected</#if>>${domain.domainTitle}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="tagSelect" class="control-label">标签：</label>
                <select id="tagSelect" class="selectpicker show-tick form-control" data-live-search="true">
                    <option value="0">不限</option>
                    <#list domainTags as tag>
                        <option value="${tag.id}" <#if tag.id == tagId>selected</#if>>${tag.tagName}</option>
                    </#list>
                </select>
            </div>
        </div>
    </div>
    <div id="table-inner">
        <div class="table-responsive">

            <table style="table-layout: fixed" class="table table-striped table-bordered table-hover"
                   id="dataTables-example" aria-describedby="dataTables-example_info">
                <thead>
                <tr>
                    <th>
                        题目
                    </th>
                    <th>
                        题目类型
                    </th>
                    <th>
                        创建时间
                    </th>
                    <th>
                        创建人
                    </th>
                </tr>
                </thead>
                <tbody>
                    <#list questions.list as question>
                    <tr id="tr${question.id}" class="showQuestion">
                        <td width="40%"
                            style="overflow:hidden;WORD-WRAP: break-word;white-space:nowrap;text-overflow:ellipsis;">${question.testQuestionTitle?html}</td>
                        <td width="20%" id="type${question.id}"
                            data-label="${testTypeMap["${question.testQuestionTypeId}"].id}">
                        ${testTypeMap["${question.testQuestionTypeId}"].typeName}
                        </td>
                        <td width="20%">
                        ${((question.testQuestionCreateTime)?number)?number_to_datetime}
                        </td>
                        <td width="20%">
                        ${userMap["${question.testQuestionOperaterId}"].userNickname}
                        </td>
                    </tr>
                    <tr id="show-tr${question.id}" class="question-panel sr-only">
                        <td colspan="<#if updateAble || deleteAble>4<#else>3</#if>">
                            <div class="panel panel-success far-top">
                                <div class="panel-heading clearfix">
                                    <div class="col-md-10"><label class="panel-title"
                                                                  id="testQuestionTitle${question.id}">${question.testQuestionTitle}</label class="panel-title">
                                    </div>
                                    <div class="col-md-2">
                                        <#list map["operators"+view.id] as op>
                                            <#if op.title != "添加">
                                                <a onclick="func.${op.url}('show','${question.id}');"
                                                   class="res">${op.title}</a>
                                                <#if op_index < map["operators"+view.id]?size - 1>/</#if>
                                            </#if>
                                        </#list>
                                    </div>
                                </div>
                                <div class="panel-body" id="item${question.id}">
                                    <#assign xx = ['A','B','C','D','E','F','G']>
                                    <#list testTypeMap["${question.testQuestionTypeId}"].typeLimit?eval as model>
                                        <#if model="shortModel">
                                            <div class="panel-body">
                                                <p><label>选项:</label></p>
                                                <div id="testQuestionSelect${question.id}">
                                                    <#list question.testQuestionContent?eval as s>
                                                        <div><span><span class="optionName">${xx[s_index]}</span>: <span
                                                                class="optionValue">${s}</span></span></div>
                                                    </#list>
                                                </div>
                                                <p><label>答案:</label></p>
                                                <#list question.testQuestionShortAnswer?eval as answer>
                                                    <span class="short-answer">${xx[answer?number]}</span>
                                                </#list>
                                            </div>
                                        <#else>
                                            <p><label>答案:</label></p>
                                            <pre class="long-answer">${question.testQuestionLongAnswer}</pre>
                                        </#if>
                                    </#list>
                                </div>
                                <div class="panel-footer">
                                    <label>标签:</label>
                                <span id="tagsLabel${question.id}">
                                    <#list testQuestionTags["${question.id}"] as tag>
                                        <span data-label="${tag.id}">${tag.tagName}</span>
                                    </#list>
                                </span>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </#list>
                </tbody>
            </table>

        </div>
        <#assign str = "?">
        <#if holdPath?contains("?")><#assign str = "&"></#if>
        <@paginate page = questions url=holdPath+str>
        </@paginate>
    </div>

</div>
</@item>
<div class="modal fade" id="addTestQuestion" tabindex="-1" role="dialog" aria-labelledby="addTestQuestionLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">添加题目</h4>
            </div>
            <div class="modal-body">
                <form id="testQuestion" role="form">
                    <div class="form-group">
                        <label for="testQuestionTitle" class="control-label">题目</label>
                        <textarea class="form-control" rows="3" name="testQuestion.testQuestionTitle"
                                  id="testQuestionTitle"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="testQuestionTypeId" class="control-label">题目类型</label>
                        <select class="form-control" name="testQuestion.testQuestionTypeId" id="testQuestionTypeId"
                                onchange="Util.changeModel($('#testQuestionTypeId'))">
                        <#list types as type>
                            <option id="option${type.id}" value="${type.id}"
                                    data-label="${type.typeLimit?html}">${type.typeName}</option>
                        </#list>
                        </select>
                    </div>
                    <div class="form-group sr-only">
                        <label for="id" class="col-sm-2 control-label">id</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="testQuestion.id" id="id"
                                   placeholder="id" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tags">标签（使用英文输入状态下的逗号进行分隔）：<a class="res"
                                                                  onclick="$('.tag-container').toggle()">选择</a></label>
                        <input class="form-control" type="text" id="tags" name="tags">
                        <div class="tag-container" style="display: none">
                        <#list tags as tag>
                            <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                <input type="checkbox" id="tagCheckbox${tag.id}"
                                       onchange="Util.changeTag('${tag.tagName}',$('input#tagCheckbox${tag.id}'))">
                                <label for="tagCheckbox${tag.id}">
                                ${tag.tagName}
                                </label>
                            </div>
                        </#list>
                        </div>
                    </div>
                    <hr/>
                    <div id="shortModel">
                        <a class="res" id="add" onclick="Util.addSelect()">添加选项</a>
                        <a class="res" id="remove" onclick="Util.removeSelect()">删除选项</a>
                        <div class="form-group sr-only">
                            <label for="testQuestionContent" class="control-label">选项</label>
                            <input type="text" class="form-control" name="testQuestion.testQuestionContent"
                                   id="testQuestionContent">
                        </div>
                        <div class="form-group sr-only">
                            <label for="testQuestionShortAnswer" class="control-label">选择题答案(请选用英文状态下的逗号隔开）:</label>
                            <input type="text" class="form-control" name="testQuestion.testQuestionShortAnswer"
                                   id="testQuestionShortAnswer">
                        </div>
                    </div>
                    <div id="longModel" class="sr-only">
                        <div class="form-group">
                            <label for="testQuestionLongAnswer" class="control-label">答案:</label>
                        <textarea rows="3" class="form-control" name="testQuestion.testQuestionLongAnswer"
                                  id="testQuestionLongAnswer"></textarea>
                        </div>
                    </div>
                    <div class="sr-only">
                        <label for="testQuestionCreateTime"></label><input class="form-control"
                                                                           name="testQuestion.testQuestionCreateTime"
                                                                           id="testQuestionCreateTime">
                    </div>

                </form>
                <div class="tip-container">
                    <div class="tip" id="saveTestQuestionTip" aria-label="0">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button data-style="slide-up" id="saveTestQuestion-btn" class="btn btn-primary ladda-button"
                        onclick="func.addTestQuestion('up')">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var ds = $('#domainSelect');
    var ts = $('#tagSelect');
    var tps = $('#testQuestionTypeId');
    $('.showQuestion').on('click', function () {
        var trId = $(this).attr('id');
        var dom = $('#show-' + trId);
        var isHave = dom.hasClass("sr-only");
        $(this).siblings('tr.question-panel').addClass("sr-only");
        if (isHave) {
            dom.removeClass("sr-only");
        }
        else {
            dom.addClass("sr-only");
        }
    });
    $(function () {
        Util.redrawSelects();
        ds.on('changed.bs.select', function () {
            getTags(ds.val());
        });
        tps.on('change', function () {
            loadQuestions();
        });
        ts.on('changed.bs.select',loadQuestions);
    });
    $('#table-inner').on('pjax:complete',function(){
        $('.showQuestion').on('click', function () {
            var trId = $(this).attr('id');
            var dom = $('#show-' + trId);
            var isHave = dom.hasClass("sr-only");
            $(this).siblings('tr.question-panel').addClass("sr-only");
            if (isHave) {
                dom.removeClass("sr-only");
            }
            else {
                dom.addClass("sr-only");
            }
        });
    });
    function loadQuestions() {
        $.pjax({
            url: '${staticServePath}/test/questions?type='+tps.val()+'&domain='+ds.val()+'&tag='+ts.val(),
            container: '#table-inner',
            fragment: '#table-inner',
            cache: true,
            maxCacheLength: 5,
            timeout:8000,
            storage: false,
            replace: true
        });
    }
    function getTags(domain) {
        var json = {'domain': domain};
        $.ajax({
            url: '${staticServePath}/test/getTags',
            type: 'post',
            data: json,
            success: function (data, state) {
                if (data.state == 'error') {
                    Util.showTip($('#wholeTip'), data.msg, 'alert alert-danger');
                    return;
                }
                var array = data;

                var str = '<select id="tagSelect" class="selectpicker show-tick form-control" data-live-search="true">' +
                        '<option value="0">不限</option>';
                var parent = ts.parent();
                ts.next().remove();
                ts.remove();
                $.each(array, function (index, obj) {
                    str += '<option value="' + obj.id + '">' + obj.tagName + '</option>';
                });
                str += '</select>';
                parent.append(str);
                Util.redrawSelects();
                ts = $('#tagSelect');
                ts.on('changed.bs.select',loadQuestions);
                loadQuestions();
                //$('#questions_loading').addClass('sr-only');
                //getQuestions();
            }
        });
    }
</script>