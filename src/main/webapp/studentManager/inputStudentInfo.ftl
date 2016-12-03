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
                        <input type="file" class="file">
                    </div>
                    <div class="input-group hdwx-input-sm pull-right">

                    </div>
                </form>
            </div>
            <div class="panel-body">

                <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline"
                     role="grid">
                    <table class="table table-striped table-hover dataTable panel-footer"
                           id="student" aria-describedby="dataTables-example_info">
                        <thead>
                        <tr>
                            <th colspan="5">

                            </th>
                            <th colspan="7">
                                <label class="control-label">学生信息</label>
                            </th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr class="warning">
                            <td colspan="8">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">班级:</span>
                                    <select name="student.classId" class="form-control">
                                        <option value=20160824>xxx</option>
                                        <option value=20160719>xxx</option>
                                    </select>
                                </div>
                            </td>
                            <td colspan="4">
                                <input type="file" class="file">
                            </td>
                        </tr>

                        <tr class="info">
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">姓名:</span>
                                    <input name="student.name" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">性别:</span>
                                    <select name="student.sex" class="form-control">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>

                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">出生日期:</span>
                                    <input name="student.birthday" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">手机号:</span>
                                    <input name="student.contactInformation" type="text" class="form-control"
                                           placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">学历:</span>
                                    <input name="student.educationBackground" type="text" class="form-control"
                                           placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">专业:</span>
                                    <input name="student.major" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr class="info">
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">邮箱:</span>
                                    <input name="student.email" type="email" class="form-control" placeholder="输入邮箱">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">QQ:</span>
                                    <input name="student.qq" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">毕业时间:</span>
                                    <input name="student.graduationTime" type="text" class="form-control"
                                           placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">身份证号:</span>
                                    <input name="student.idNumber" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">毕业学校:</span>
                                    <input name="student.college" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr class="info">
                            <td colspan="12">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">户籍地址:</span>
                                    <input name="student.permanentAddress" type="text" class="form-control"
                                           placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="12">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">现居地址:</span>
                                    <input name="student.presentAddress" type="text" class="form-control"
                                           placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr class="info">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">咨询师:</span>
                                    <select name="student.counselorId" class="form-control">
                                        <option value="1001">xxx</option>
                                        <option value="1002">xxx</option>
                                    </select>
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">课程:</span>
                                    <input name="student.subject" type="text" class="form-control" placeholder="输入姓名">
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
                                        <input type="radio" name="student.paymentMethod" id="loan"
                                               class="form-control" value="贷款" checked>
                                        贷款
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="student.paymentMethod" id="cash"
                                               class="form-control" value="现金">
                                        现金
                                    </label>
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">学费:</span>
                                    <input name="student.tuition" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr class="pay info">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">首次还款日:</span>
                                    <input name="student.firstRepaymentTime" type="text" class="form-control"
                                           placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">学生还款日:</span>
                                    <input name="student.studentRepaymentTime" type="text" class="form-control"
                                           placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr class="pay">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">补助总金额:</span>
                                    <input name="student.subsidy" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">补助次数:</span>
                                    <input name="student.residualFrequency" type="text" class="form-control"
                                           placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr class="pay info">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">银行卡号:</span>
                                    <input name="student.bankCard" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">开户行:</span>
                                    <input name="student.bankName" type="text" class="form-control" placeholder="输入姓名">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="12">
                                <label class="control-label">紧急联系人</label>
                            </td>
                        </tr>

                        <tr class="info">
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
                                <input name="student.emergencyContact" type="text" class="form-control"
                                       placeholder="输入姓名">
                            </td>
                            <td colspan="3">
                                <select name="student.emergencyContact" class="form-control">
                                    <option value="父亲">父亲</option>
                                    <option value="母亲">母亲</option>
                                </select>
                            </td>
                            <td colspan="3">
                                <input name="student.emergencyContact" type="text" class="form-control"
                                       placeholder="输入姓名">
                            </td>
                        </tr>

                        <tr class="info">
                            <td colspan="3">
                                <label class="control-label">紧急联系人</label>
                            </td>
                            <td colspan="3">
                                <input name="student.emergencyContact" type="text" class="form-control"
                                       placeholder="输入姓名">
                            </td>
                            <td colspan="3">
                                <select name="student.emergencyContact" class="form-control">
                                    <option value="亲戚">亲戚</option>
                                    <option value="朋友">朋友</option>
                                    <option value="同学">同学</option>
                                </select>
                            </td>
                            <td colspan="3">
                                <input name="student.emergencyContact" type="text" class="form-control"
                                       placeholder="输入姓名">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="control-label">备注</label>
                            </td>
                            <td colspan="10">
                                <textarea name="student.remark" class="form-control" rows="3"></textarea>
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