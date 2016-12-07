<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view saveLabel="提交"></@initBtn>
<@item>
<div class="panel-heading title">
${view.title}

</div>
<div class="panel-body">

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
                <tbody id="apply-body">
                    <#list subsidyClasses.list as sub>
                    <tr name="submit-tr" id="list${sub.classId}">
                        <td class="hidden">
                            <input name="applicationDate" value="${sub.applicationDate}"/>
                        </td>
                        <td>
                        ${sub.className}
                        </td>
                        <td name="number">
                        ${sub.number}
                        </td>
                        <td class=" z-money-cny" name="totalSubsidy">
                        ${sub.totalSubsidy?number}
                        </td>
                        <td class=" z-money-cny" name="totalBonus">
                        ${sub.totalBonus}
                        </td>
                        <td class=" z-money-cny" name="aggregateAmount">
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

<div class="modal fade" id="submitApplyModel" tabindex="-1" role="dialog" aria-labelledby="submitApplyModelLabel"
     aria-hidden="true">
    <div class="modal-dialog " style="width: 600px auto">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">申请提交信息:</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="classSelect_list" class="control-label col-md-2">审批人：</label>
                        <div class="col-md-10">
                            <select id="classSelect_list" class="selectpicker show-tick "
                                    data-live-search="false">
                            <#list roles as rol>
                                <option value="${rol.id}">${rol.userNickname}</option>
                            </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="name">备注：</label>
                        <div class="col-md-10">
                            <textarea name="name" class="form-control" rows="3"></textarea>
                        </div>
                    </div>
                </form>

                <div class="table table-bordered">
                    <div class="text-center">
                        <div class="row">
                            <div class="col-md-6"><label>申请班级数:<span id="submit-class">0</span></label></div>
                            <div class="col-md-6"><label>申请总人数:<span id="submit-student">0</span></label></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6"><label>总补助:<span class="z-money-unit-only z-money-cny" id="submit-subsidy">0</span></label></div>
                            <div class="col-md-6"><label>总奖金:<span class="z-money-unit-only z-money-cny" id="submit-bonus">0</span></label></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6"><label>合计:<span class="z-money-unit-only z-money-cny" id="submit-total">0</span></label></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="save-submit-btn" type="button" class="btn btn-primary" onclick="func.submitApply()">提交</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="addApplyModel" tabindex="-1" role="dialog" aria-labelledby="addApplyModelLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">班级添加</h4>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist" id="class-add-ul">

                </ul>
                <!-- Tab panes -->
                <div class="tab-content" id="classBody">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button data-style="slide-up" id="saveRole-btn" class="btn btn-primary ladda-button"
                        onclick="func.submitApplyClass('up')">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="seeApplyModel" tabindex="-1" role="dialog" aria-labelledby="addApplyModelLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">查看详情</h4>
            </div>
            <div id="dataTables-list" class="table-responsive dataTables_wrapper form-inline" role="grid">
                <table class="table table-striped table-bordered table-hover dataTable no-footer"
                       id="dataTables-example" aria-describedby="dataTables-example_apply">
                    <thead>
                    <tr>
                        <th>
                            <div class="checkbox3 checkbox-round text-center">
                                <input type="checkbox" id="index-look" checked="checked">
                                <label class="checkbox-2" style="display: inline" for="index-look">
                                </label>
                            </div>
                        </th>
                        <th>
                            姓名
                        </th>
                        <th>
                            补助金额
                        </th>
                        <th>
                            剩余补助次数
                        </th>
                        <th>
                            奖金
                        </th>
                        <th>
                            就读状态
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button data-style="slide-up" id="sa-btn" class="btn btn-primary ladda-button"
                        onclick="func.addDetails()">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>

<div class="sr-only" id="template">
    <div class="table-responsive dataTables_wrapper form-inline"
         role="grid">
        <table class="table table-striped table-bordered table-hover dataTable no-footer"
               aria-describedby="dataTables-example_apply">
            <thead>
            <tr>
                <th>
                    <div class="checkbox3 checkbox-round text-center">
                        <input type="checkbox" id="index">
                        <label class="checkbox-2" style="display: inline" for="index">
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

            </tbody>
        </table>
    </div>
</div>


<script type="text/javascript">
    $(document).on('pjax:complete', function () {
        Util.redrawSelects();
    });
    var region = function (dom) {
        var regionDiv = $("#template").clone();
        regionDiv.css('width', '100%');
        regionDiv.removeClass('sr-only');
        var ckeckAll = regionDiv.find('thead:first').find('div:first');

        return regionDiv;
    };
    var showTemplate = function (id) {
        Util.ajax(Label.staticServePath + "/subsidyManager/showRegionClass",{
            data: {
                'id': id
            },
            success: function (data, status) {
                var json = JSON.parse(data.msg);
                var serial = 1;
                json.map(function (elem, num) {
                    var ckeckBoox = $("#index").parent().clone();
                    var input = ckeckBoox.find('input:first');
                    var label = ckeckBoox.find('label:first');
                    input.attr('tag', 'input');
                    input.attr('name', elem['id']);
                    input.attr('id', 'index' + elem['id']);
                    label.attr('for', "index" + elem['id']);
                    var str = '<tr id="{id}">' +
                            '<td></td>' +
                            '<td>' + serial + '</td>' +
                            '<td>{className}</td>' +
                            '<td>{studentCnt}</td>' +
                            '<td>{classOpeningTime}</td>' +
                            '</tr>';
                    serial++;
                    str = Util.jsonToString(str, elem);
                    $('div#' + 'role' + id).find('tbody:first').append(str);
                    $('tr#' + elem['id']).find('td:first').append(ckeckBoox);
                })
            }
        });
    }
</script> 