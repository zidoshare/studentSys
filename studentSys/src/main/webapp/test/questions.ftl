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
                <h4 class="modal-title" id="myModalLabel">添加学生信息</h4>
            </div>
            <div class="modal-body">
                <form id="user" role="form" class="form-horizontal">
                    <div class="form-group">
                        <label for="userAccount" class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user.userAccount" id="userAccount"
                                   placeholder="账号">
                        </div>
                    </div>
                </form>
                <div class="tip-container">
                    <div class="tip" id="saveUserTip" aria-label="0">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button data-style="slide-up" id="saveUser-btn" class="btn btn-primary ladda-button"
                        onclick="func.add('up')">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>