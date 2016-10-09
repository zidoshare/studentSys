<#include "../macro-item.ftl">
<@item>
<div class="panel-heading title">
${view.title}
</div>
</@item>
<@item>
<div class="panel-heading">
    <div class="btn-group">
        <#assign updateAble = false>
        <#assign deleteAble = false>
        <#list map["operators"+view.id] as op>
            <a onclick="func.${op.url}('show');" class="btn btn-success btn-sm">${op.title}</a>
            <#if op.title=="编辑">
                <#assign updateAble = true>
            </#if>
            <#if op.title == "删除">
                <#assign deleteAble = true>
            </#if>
        </#list>
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
                        <select class="form-control" name="testQuestion.testQuestionTypeId" id="testQuestionTypeId" onchange="Util.changeModel($('#testQuestionTypeId'))">
                        <#list types as type>
                            <option id="option${type.id}" value="${type.id}" data-label="${type.typeLimit?html}">${type.typeName}</option>
                        </#list>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="tags">标签（使用英文输入状态下的逗号进行分隔）：<a class="res" onclick="$('.tag-container').toggle()">选择</a></label>
                        <input class="form-control" type="text" id="tags" name="tags">
                        <div class="tag-container" style="display: none">
                        <#list tags as tag>
                            <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                <input type="checkbox" id="${tag.id}" onchange="Util.changeTag('${tag.tagName}',$('input#${tag.id}'))">
                                <label for="${tag.id}">
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
                            <label for="testQuestionShortAnswer" class="control-label">选择题答案（多选用英文状态下的逗号隔开）:</label>
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
                        <label for="testQuestionCreateTime"></label><input class="form-control" name="testQuestion.testQuestionCreateTime" id="testQuestionCreateTime">
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