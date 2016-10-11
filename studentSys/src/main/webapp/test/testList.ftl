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