<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<@initBtn map = map view=view></@initBtn>
<@item>
<div class="panel-heading">
    <div class="panel-heading title">
    ${view.title}
        <span class="pull-right">${addBtn}</span>
    </div>
</div>
<div class="panel-body">
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
                <#list questions as question>
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
                            <div class="panel-heading">
                                <label class="panel-title"
                                       id="testQuestionTitle${question.id}">${question.testQuestionTitle}</label class="panel-title">
                                <div class="pull-right">
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
                                                <span class="short-answer">${answer}</span>
                                            </#list>
                                        </div>
                                    <#else>
                                        <p><label>答案:</label></p>
                                        <span class="long-answer">${question.testQuestionLongAnswer}</span>
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
    $('.showQuestion').on('mouseenter', function () {
        $(this).siblings('tr.question-panel').addClass("sr-only");
        var trId = $(this).attr('id');
        $('#show-' + trId).removeClass("sr-only");
    });
</script>