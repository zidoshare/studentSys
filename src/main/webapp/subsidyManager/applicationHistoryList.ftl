<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view saveLabel="提交"></@initBtn>
<@item>
<div class="panel-heading title">
${view.title}

</div>
<div class="panel-body">
    <div class="row">
        <div class="col-lg-6">
            <div class="input-group col-md-5">
                <span class="input-group-addon">
                     表名:
                </span>
                <input type="text" class="form-control">
            </div>
        </div>
    </div>
    <div id="table-inner">
        <div id="dataTables-example_subsidy" class="table-responsive dataTables_wrapper form-inline" role="grid">
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                   id="dataTables-example" aria-describedby="dataTables-example_apply">
                <thead>
                <tr>
                    <th>
                        班级名称
                    </th>
                    <th>
                        人数
                    </th>
                    <th>
                        补助金额
                    </th>
                    <th>
                        奖金
                    </th>
                    <th>
                        合计
                    </th>
                    <#if addAble ||  deleteAble>
                        <th>
                            操作
                        </th>
                    </#if>
                </tr>

                </thead>
                <tbody>
                    <#list subsidyClasses.list as sub>
                    <tr id="list${sub.classId}">
                        <td>
                        ${sub.className}
                        </td>
                        <td>
                        ${sub.number}
                        </td>
                        <td>
                        ${sub.totalSubsidy}
                        </td>
                        <td>
                        ${sub.totalBonus}
                        </td>
                        <td>
                        ${sub.aggregateAmount}
                        </td>
                        <#if  addAble ||  deleteAble>
                            <td>
                                <#list map["operators"+view.id] as op>
                                    <#if op.url == "seeApply">
                                        <@macroBtn url = op.url title = op.title></@macroBtn>
                                        <#assign op = map["operators"+view.id][0]>
                                    ${InsertKit(btnLabel,"${sub.classId}")}/
                                    </#if>
                                </#list>
                            ${InsertKit(deleteBtn,"${sub.classId}")}
                            </td>
                        </#if>
                    </tr>
                    </#list>
                <#--<#list classes.list as class>-->
                <#--<tr id="class${class.id}" data-label="${class.id}"  data-target="#classId" data-method="prop">-->
                <#--<td id="className${class.id}" data-label="${class.className?html}" data-target="#className">${class.className}</td>-->
                <#--<td id="number${class.id}" data-label="${class.number}" data-target="#number">${class.number}</td>-->
                <#--<td id="subsidyAmount${class.id}" data-label="${class.subsidyAmount}" data-target="#subsidyAmount">${class.subsidyAmount}</td>-->
                <#--<td id="bonus${class.id}" data-label="${class.bonus}" data-target="bonus">${class.bonus}</td>-->
                <#--<td id="total${class.id}" data-label="${class.total}" data-target="total">${class.total}</td>-->
                <#--<td id="applicant${class.id}" data-label="${class.applicant}" data-target="applicant">${class.applicant}</td>-->
                <#--<#if updateAble || deleteAble>-->
                <#--<td>-->
                <#--<#if updateAble>-->
                <#--${InsertKit(updateBtn,"${class.id}")}/-->
                <#--</#if>-->
                <#--${InsertKit(deleteBtn,"${class.id}")}-->
                <#--</td>-->
                <#--</#if>-->
                <#--<td id="classUpdateTime${class.id}" class="hidden" data-label="${class.classUpdateTime}" data-target="#classUpdateTime" data-method="prop">-->
                <#--</td>-->
                <#--</tr>-->
                <#--</#list>-->

                </tbody>
            </table>
            <#if subsidyClasses??>
                <#assign str = "?">
                <#if holdPath?contains("?")><#assign str = "&"></#if>
                <@paginate page = subsidyClasses url=holdPath+str pageAfter="p">
                </@paginate>
                <div class="modal-footer text-center">
                ${addBtn}
                ${saveBtn}
                </div>
            </#if>

        </div>
    </div>
</div>
</@item>
