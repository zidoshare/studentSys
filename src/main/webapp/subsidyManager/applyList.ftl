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
                <span class="input-group-addon">表名:</span>
                <input type="text" class="form-control">
            </div>
        </div>
    </div>
    <div id="table-apply">
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
                    <#if addAble || updateAble || deleteAble>
                        <th>
                            操作
                        </th>
                    </#if>
                </tr>

                </thead>
                <tbody>
                <#list page.list as sub>
                <tr>
                    <td>
                        ${sub.className}
                    </td>
                    <td>
                        11
                    </td>
                    <td>
                        2100
                    </td>
                    <td>
                        300
                    </td>
                    <td>
                        2400
                    </td>
                    <#if  addAble || updateAble || deleteAble>
                        <td>
                            <#if addAble>
                                <#list map["operators"+view.id] as op>
                                    <#if op.url == "seeApply">
                                        <@macroBtn url = op.url title = op.title></@macroBtn>
                                        <#assign op = map["operators"+view.id][0]>
                                    ${InsertKit(btnLabel,5)}/
                                    </#if>
                                </#list>
                            </#if>
                            <#if updateAble>
                            ${InsertKit(updateBtn,"修改")}/
                            </#if>
                        ${InsertKit(deleteBtn,"删除")}
                        </td>
                    </#if>
                </tr>
                </#list>
                <tr>
                    <td>
                        0719班
                    </td>
                    <td>
                        11
                    </td>
                    <td>
                        2100
                    </td>
                    <td>
                        300
                    </td>
                    <td>
                        2400
                    </td>
                    <#if  addAble || updateAble || deleteAble>
                        <td>
                            <#if addAble>
                            <#list map["operators"+view.id] as op>
                            <#if op.url == "seeApply">
                            <@macroBtn url = op.url title = op.title></@macroBtn>
                            <#assign op = map["operators"+view.id][0]>
                            ${InsertKit(btnLabel,5)}/
                            </#if>
                            </#list>
                            </#if>
                            <#if updateAble>
                            ${InsertKit(updateBtn,"修改")}/
                            </#if>
                             ${InsertKit(deleteBtn,"删除")}
                        </td>
                    </#if>
                </tr>
                <tr>
                    <td>
                        0719班
                    </td>
                    <td>
                        11
                    </td>
                    <td>
                        2100
                    </td>
                    <td>
                        300
                    </td>
                    <td>
                        2400
                    </td>

                    <#if addAble || updateAble || deleteAble>
                        <td>
                            <#if updateAble>
                            ${InsertKit(updateBtn,"修改")}/
                            </#if>
                        ${InsertKit(deleteBtn,"删除")}
                        </td>
                    </#if>
                </tr>
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
            <#--<-- 分頁 &ndash;&gt;-->
            <#--<#assign str = "?">-->
            <#--<#if holdPath?contains("?")><#assign str = "&"></#if>-->
            <#--<@paginate page = classes url=holdPath+str pageAfter="p">-->
            <#--</@paginate>-->
            <span class="center-block text-center">${addBtn}</span>
            <span class="pull-right text-center">${saveBtn}</span>
        </div>
    </div>
</div>
</@item>


<div class="modal fade" id="addApplyModel" tabindex="-1" role="dialog" aria-labelledby="addApplyModelLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">班级添加</h4>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">成都</a></li>
                    <li role="presentation"><a href="#profile" role="tab" data-toggle="tab">重庆</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <div id="table-apply">
                            <div id="dataTables-example_subsidy" class="table-responsive dataTables_wrapper form-inline" role="grid">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                       id="dataTables-example" aria-describedby="dataTables-example_apply">
                                    <thead>
                                    <tr>
                                        <th>
                                            <div class="checkbox3 checkbox-round">
                                                <input type="checkbox" id="all-check">
                                                <label for="all-check" class="td-check center-block">
                                                </label>
                                            </div>
                                        </th>
                                        <th>
                                            序号
                                        </th>
                                        <th>
                                            班级名称
                                        </th>
                                        <th>
                                            人数
                                        </th>
                                        <th>
                                            开班日期
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="checkbox3 checkbox-round">
                                                <input type="checkbox" id="checkbox-2">
                                                <label for="checkbox-2" class="td-check center-block">
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            0719班
                                        </td>
                                        <td>
                                            12
                                        </td>
                                        <td>
                                            2016.07.19
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="profile">
                        <div id="table-apply">
                            <div id="dataTables-example_subsidy" class="table-responsive dataTables_wrapper form-inline" role="grid">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                       id="dataTables-example" aria-describedby="dataTables-example_apply">
                                    <thead>
                                    <tr>
                                        <th>
                                        <div class="checkbox3 checkbox-round">
                                            <input type="checkbox" id="all-check">
                                            <label for="all-check" class="td-check center-block">
                                            </label>
                                        </div>
                                    </th>
                                        <th>
                                            序号
                                        </th>
                                        <th>
                                            班级名称
                                        </th>
                                        <th>
                                            人数
                                        </th>
                                        <th>
                                            开班日期
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="checkbox3 checkbox-round">
                                                <input type="checkbox" id="checkbox-2">
                                                <label for="checkbox-2" class="td-check center-block">
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            2
                                        </td>
                                        <td>
                                            0719班
                                        </td>
                                        <td>
                                            12
                                        </td>
                                        <td>
                                            2016.07.19
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>
