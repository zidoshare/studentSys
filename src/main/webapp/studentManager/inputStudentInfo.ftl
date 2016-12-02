<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view></@initBtn>

<@item>
<div class="panel-heading title">
${view.title}
    <span class="pull-right">${addBtn}</span>
</div>
<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item">
            <div class="panel-heading">
                <form class="clearfix">
                    <div class="input-group hdwx-input-sm pull-left">
                        <div class="btn-group input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false">
                                选择班级 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                        <label for="all-search" class="sr-only">search</label>
                        <input type="text" class="form-control" id="all-search" placeholder="学生...">
                <span class="input-group-btn">
                    <button type="button" class="btn btn-success">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>

                </span>
                    </div>
                    <div class="pull-right btn-group">
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
                </form>
            </div>
            <div class="panel-body">

                <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
                    <table class="table table-striped table-hover dataTable panel-footer"
                           id="dataTables-example" aria-describedby="dataTables-example_info">
                        <thead>
                        <tr>
                            <th colspan="12">
                                <label class="control-label">学生信息</label>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">姓名:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">性别:</span>
                                    <select class="form-control">
                                        <option>男</option>
                                        <option>女</option>
                                    </select>

                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">出生日期:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">手机号:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">学历:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">专业:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">邮箱:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">QQ:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">毕业时间:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">身份证号:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">毕业学校:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="12">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">户籍地址:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="12">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">现居地址:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">咨询师:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">课程:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <label class="control-label">支付方式:</label>
                            </td>
                            <td colspan="4">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                        现金
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                       贷款
                                    </label>
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">学费:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr class="pay">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">首次还款日:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">学生还款日:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr class="pay">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">补助总金额:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">补助次数:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr class="pay">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">银行卡号:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">开户行:</span>
                                    <input type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="12">
                                <label class="control-label">紧急联系人</label>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3">
                                <label class="control-label">联系人</label>
                            </td>
                            <td colspan="3">
                                <label class="control-label">姓名</label>
                            </td>
                            <td colspan="3">
                                <label class="control-label">关系</label>
                            </td>
                            <td colspan="3">
                                <label class="control-label">电话</label>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3">
                                <label class="control-label">家人</label>
                            </td>
                            <td colspan="3">
                                <input type="text" class="form-control" placeholder="输入姓名">
                            </td>
                            <td colspan="3">
                                <select class="form-control">
                                    <option>父亲</option>
                                    <option>母亲</option>
                                </select>
                            </td>
                            <td colspan="3">
                                <input type="text" class="form-control" placeholder="输入姓名">
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3">
                                <label class="control-label">紧急联系人</label>
                            </td>
                            <td colspan="3">
                                <input type="text" class="form-control" placeholder="输入姓名">
                            </td>
                            <td colspan="3">
                                <select class="form-control">
                                    <option>亲戚</option>
                                    <option>朋友</option>
                                    <option>同学</option>
                                </select>
                            </td>
                            <td colspan="3">
                                <input type="text" class="form-control" placeholder="输入姓名">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="control-label">备注</label>
                            </td>
                            <td colspan="10">
                                <textarea class="form-control" rows="3"></textarea>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button data-style="slide-up" id="save-btn" class="btn btn-primary ladda-button"
                        onclick="func.addStudent('up')">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>
</@item>