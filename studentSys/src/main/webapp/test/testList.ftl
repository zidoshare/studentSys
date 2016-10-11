<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<@item>
<div class="panel-heading title">${view.title}
    <span class="pull-right">${addBtn}</span>
</div>
<div class="panel-body">
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
<div class="modal fade bs-example-modal-lg" id="addTestQuestionnaireModal" tabindex="-1" role="dialog" aria-labelledby="addTestQuestionnaireModalLabel"
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
                            <input type="text" class="form-control" name="testQuestionnaire.testQuestionnaireTitle" id="testQuestionnaireTitle" placeholder="试卷名">
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="testQuestionnaireScore" class="col-sm-2 control-label">分数</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="testQuestionnaire.testQuestionnaireScore" id="testQuestionnaireScore" placeholder="分数">
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="testQuestionnaireScore" class="col-sm-2 control-label">分数</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="testQuestionnaire.testQuestionnaireScore" id="testQuestionnaireScore" placeholder="分数">
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
<script type="text/javascript">

</script>