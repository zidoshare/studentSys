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

<div class="modal fade" id="submitApplyModel" tabindex="-1" role="dialog" aria-labelledby="submitApplyModelLabel"
     aria-hidden="true">
    <div class="modal-dialog " style="width: 600px auto" >
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">申请提交信息:</h4>
            </div>
            <div class="input-group text-center">
                <span class="input-group-addon">审批人:</span>
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown">
                        Dropdown
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                    </ul>
                </div>
            </div>
            <div class="input-group">
                <h4 class="modal-title" id="myModalLabel">备注:</h4>
                <input type="text" class="form-control" id="submit-remarks">
            </div>
            <br>
            <div class="table table-bordered">
                <h5>申请班级数:<span id="submit-class">2</span></h5>
                <h5>申请总人数:<span id="submit-student">20</span></h5>
                <h5>总补助:<span id="submit-subsidy">14000</span></h5>
                <h5>总奖金:<span id="submit-bonus">6000</span></h5>
                <h5>合计:<span id="submit-total">20000</span></h5>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="func.submitApply()">提交</button>
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
                <button data-style="slide-up" id="saveRole-btn" class="btn btn-primary ladda-button" onclick="func.submitApplyClass('up')">
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
                            <div class="checkbox3 checkbox-round text-center" >
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
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
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
                    <div class="checkbox3 checkbox-round text-center" >
                        <input type="checkbox" id="index" >
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
    var  region = function (dom) {
        var regionDiv =$("#template").clone();
        regionDiv.css('width','100%');
        regionDiv.removeClass('sr-only');
        var ckeckAll = regionDiv.find('thead:first').find('div:first');

        return regionDiv;
    };
    var showTemplate = function (id) {
        $.ajax({
            type: 'post',
            url: Label.staticServePath + "/subsidyManager/showRegionClass",
            data: {
                'id': id
            },
            success: function (data, status) {
                console.log(data);
                if (data.state = 'success') {
                    if (data.msg!=''){
                        var json = JSON.parse(data.msg);
                        console.log(json);
                        var serial = 1;
                        json.map(function (elem, num) {
                            var ckeckBoox = $("#index").parent().clone();
                            var input = ckeckBoox.find('input:first');
                            var label = ckeckBoox.find('label:first');
                            input.attr('tag','input');
                            input.attr('name',elem['id']);
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
                }

            }
        })
    }
</script> 