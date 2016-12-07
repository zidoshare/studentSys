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
                        <input id="ddd" type="file" class="file">
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
                                        <#if cls??>
                                            <#list cls as class>
                                                <option value="${(class.id)!}">${(class.className)!}</option>
                                            </#list>
                                        </#if>
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
                                    <div class="date datetimepicker input-group datetimepicker-inline"
                                         data-date-format="yyyy-mm-dd">
                                        <span class="input-group-addon">出生日期:</span>
                                        <input id="birthday_time_list"
                                               class="form-control input-sm" type="date"
                                               readonly placeholder="选择出生时间">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                    </div>
                                    <input id="birthday" class="form-control" name="student.birthday" type="hidden">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">手机号:</span>
                                    <input name="student.contactInformation" type="text" class="form-control"
                                           placeholder="请输入手机号">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">学历:</span>
                                    <input name="student.educationBackground" type="text" class="form-control"
                                           placeholder="学历">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">专业:</span>
                                    <input name="student.major" type="text" class="form-control" placeholder="请输入专业名称">
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
                                    <input name="student.qq" type="text" class="form-control" placeholder="输入QQ">
                                </div>
                            </td>
                            <td colspan="4">
                                <div class="input-group input-group-md">
                                    <div class="date datetimepicker input-group datetimepicker-inline"
                                         data-date-format="yyyy-mm-dd">
                                        <span class="input-group-addon">毕业时间:</span>
                                        <input id="graduationTime_time_list"
                                               class="form-control input-sm" type="date"
                                               readonly placeholder="选择毕业时间">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                    </div>
                                    <input id="graduationTime" class="form-control" type="hidden"
                                           name="student.graduationTime">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">身份证号:</span>
                                    <input name="student.idNumber" type="text" class="form-control"
                                           placeholder="输入身份证号">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">毕业学校:</span>
                                    <input name="student.college" type="text" class="form-control" placeholder="输入毕业学校">
                                </div>
                            </td>
                        </tr>

                        <tr class="info">
                            <td colspan="12">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">户籍地址:</span>
                                    <input name="student.permanentAddress" type="text" class="form-control"
                                           placeholder="输入身份证户籍地址">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="12">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">现居地址:</span>
                                    <input name="student.presentAddress" type="text" class="form-control"
                                           placeholder="输入现居地址">
                                </div>
                            </td>
                        </tr>

                        <tr class="info">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">咨询师:</span>
                                    <select name="student.counselorId" class="form-control">
                                        <#if counselor??>
                                            <#list counselor as user>
                                                <option value="${(user.id)!}">${(user.userNickname)!}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">课程:</span>
                                    <input name="student.subject" type="text" class="form-control"
                                           placeholder="输入开班学习方向（如：Android、Java等！）">
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
                                    <input name="student.tuition" type="number" class="form-control" value="0">
                                </div>
                            </td>
                        </tr>

                        <tr class="pay info">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <div class="date datetimepicker input-group datetimepicker-inline"
                                         data-date-format="yyyy-mm-dd">
                                        <span class="input-group-addon">首次还款日:</span>
                                        <input id="firstRepaymentTime_time_list"
                                               class="form-control input-sm" type="text"
                                               readonly placeholder="选择毕业时间">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                    </div>
                                    <input id="firstRepaymentTime" name="student.firstRepaymentTime" type="hidden"
                                           class="form-control">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <div class="date datetimepicker input-group datetimepicker-inline"
                                         data-date-format="yyyy-mm-dd">
                                        <span class="input-group-addon">学生还款日:</span>
                                        <input id="studentRepaymentTime_time_list"
                                               class="form-control input-sm" type="text"
                                               readonly placeholder="选择毕业时间">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                    </div>
                                    <input id="studentRepaymentTime" type="hidden" name="student.studentRepaymentTime"
                                           class="form-control">
                                </div>
                            </td>
                        </tr>

                        <tr class="pay">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">补助总金额:</span>
                                    <input name="student.subsidy" type="number" class="form-control">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">补助次数:</span>
                                    <input name="student.residualFrequency" type="number" class="form-control">
                                </div>
                            </td>
                        </tr>

                        <tr class="pay info">
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">银行卡号:</span>
                                    <input name="student.bankCard" type="text" class="form-control"
                                           placeholder="输入学员银行卡号">
                                </div>
                            </td>
                            <td colspan="6">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon">开户行:</span>
                                    <input name="student.bankName" type="text" class="form-control"
                                           placeholder="输入开户行名称">
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
                                       placeholder="输入父亲或母亲姓名">
                            </td>
                            <td colspan="3">
                                <select name="student.emergencyContact" class="form-control">
                                    <option value="父亲">父亲</option>
                                    <option value="母亲">母亲</option>
                                </select>
                            </td>
                            <td colspan="3">
                                <input name="student.emergencyContact" type="text" class="form-control"
                                       placeholder="输入电话号码">
                            </td>
                        </tr>

                        <tr class="info">
                            <td colspan="3">
                                <label class="control-label">紧急联系人</label>
                            </td>
                            <td colspan="3">
                                <input name="student.emergencyContact" type="text" class="form-control"
                                       placeholder="输入紧急联系人姓名">
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
                                       placeholder="输入电话号码">
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
                <button data-style="slide-up" id="save-btn" class="btn btn-primary ladda-button">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>
</@item>

<script>
    $(function () {
        $("input[type='radio']").each(function () {
            $(this).click(function () {
                if ($("#loan").is(":checked")) {
                    var trs = $(".pay");
                    for (var i = 0; i < trs.length; i++) {
                        trs[i].style.display = "table-row";
                    }
                }
                if ($("#cash").is(":checked")) {
                    var trs = $(".pay");
                    for (var i = 0; i < trs.length; i++) {
                        trs[i].style.display = "none";
                    }
                }
            });
        });
    });
</script>

<script type="text/javascript">
    $.fn.datetimepicker.dates['zh-CN'] = {
        days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
        daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        daysMin: ["日", "一", "二", "三", "四", "五", "六", "日"],
        months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一", "十二"],
        today: "今天",
        suffix: [],
        meridiem: ["上午", "下午"]
    };
    $(function () {
        var defaultTime = new Date();
        $('#all_start_time_list').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-01');
        $('.datetimepicker').datetimepicker({
            format: 'yyyy-mm-dd',
            Integer: 1,
            minView: 2,
            bootcssVer: 3,
            showMeridian: true,
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN',
            todayHighlight: true
        });
        $('#save-btn').on('click', loadAttendance);
        $('#page-inner').on('pjax:complete',function(){
            Util.redrawFileInput({
                selector:'#ddd',
                uploadUrl:''
            });
        });
    });
    function loadAttendance() {
        var birthday = new Date($("#birthday_time_list").val().replace(/-/g, "/")).getTime();
        var graduationTime = new Date($("#graduationTime_time_list").val().replace(/-/g, "/")).getTime();
        var firstRepaymentTime = new Date($("#firstRepaymentTime_time_list").val().replace(/-/g, "/")).getTime();
        var studentRepaymentTime = new Date($("#studentRepaymentTime_time_list").val().replace(/-/g, "/")).getTime();
        birthday = judge(birthday);
        graduationTime = judge(graduationTime);
        firstRepaymentTime = judge(firstRepaymentTime);
        studentRepaymentTime = judge(studentRepaymentTime);
        $("#birthday").val(birthday);
        $("#graduationTime").val(graduationTime);
        $("#firstRepaymentTime").val(firstRepaymentTime);
        $("#studentRepaymentTime").val(studentRepaymentTime);
        func.addStudent('up');
    }
    function judge(mtime) {
        if (isNaN(mtime)) {
            mtime = null;
        }
        return mtime;
    }
</script>