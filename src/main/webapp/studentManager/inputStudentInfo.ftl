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
    <div class="col-md-12" id="page-inner">
        <div class="panel-heading">
            <label class="control-label">导入Excel:（注意：请使用Microsoft Excel 97-2003 工作表）</label>
            <form class="clearfix" enctype="multipart/form-data" method="post">
                <div class="input-group hdwx-input-sm pull-left">
                    <input id="upExcel" name="excel" type="file" accept="application/vnd.ms-excel">
                </div>
            </form>
        </div>
        <div class="panel-body">
            <div id="table-inner">
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
                            <label class="control-label">选择班级:</label>
                            <div class="input-group input-group-sm">
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
                            <form class="clearfix" enctype="multipart/form-data" method="post">
                                <label class="control-label">上传头像:（格式：手机号.jpg/.png/.gif）</label>
                                <input id="upPhoto" name="photo" type="file" accept="image/jpeg,image/png,image/gif">
                            </form>
                        </td>
                    </tr>

                    <tr class="info">
                        <td colspan="4">
                            <div id="stuName" class="input-group input-group-sm ">
                                <span class="input-group-addon">姓名:</span>
                                <input name="student.name" type="text" class="form-control" placeholder="输入姓名">
                            </div>
                        </td>
                        <td colspan="4">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">性别:</span>
                                <select name="student.sex" class="form-control">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>

                            </div>
                        </td>
                        <td colspan="4">
                            <div id="stuName" class="input-group input-group-sm ">
                                <span class="input-group-addon">出生日期:</span>
                                <input id="birthday_time_list" name="student.birthday" type="date" class="form-control">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <div id="stuPhoneNumber" class="input-group input-group-sm">
                                <span class="input-group-addon">手机号:</span>
                                <input name="student.contactInformation" type="text" class="form-control"
                                       placeholder="请输入手机号">
                            </div>
                        </td>
                        <td colspan="4">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">学历:</span>
                                <select name="student.educationBackground" class="form-control">
                                    <option value="大专">大专</option>
                                    <option value="本科">本科</option>
                                    <option value="本科以上">本科以上</option>
                                    <option value="高中">高中</option>
                                    <option value="中专">中专</option>
                                    <option value="高中以下">高中以下</option>
                                </select>
                            </div>

                        </td>
                        <td colspan="4">
                            <div id="stuMajor" class="input-group input-group-sm">
                                <span class="input-group-addon">专业:</span>
                                <input name="student.major" type="text" class="form-control"
                                       placeholder="请输入专业名称">
                            </div>
                        </td>
                    </tr>

                    <tr class="info">
                        <td colspan="4">
                            <div id="stuEmail" class="input-group input-group-sm">
                                <span class="input-group-addon">邮箱:</span>
                                <input name="student.email" type="email" class="form-control"
                                       placeholder="输入邮箱">
                            </div>
                        </td>
                        <td colspan="4">
                            <div id="stuQq" class="input-group input-group-sm">
                                <span class="input-group-addon">QQ:</span>
                                <input name="student.qq" type="text" class="form-control" placeholder="输入QQ">
                            </div>
                        </td>
                        <td colspan="4">
                            <div id="stuName" class="input-group input-group-sm ">
                                <span class="input-group-addon">毕业时间:</span>
                                <input id="graduationTime_time_list" name="student.graduationTime" type="date"
                                       class="form-control">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="6">
                            <div id="stuIdNumber" class="input-group input-group-sm">
                                <span class="input-group-addon">身份证号:</span>
                                <input name="student.idNumber" type="text" class="form-control"
                                       placeholder="输入身份证号">
                            </div>
                        </td>
                        <td colspan="6">
                            <div id="stuSchool" class="input-group input-group-sm">
                                <span class="input-group-addon">毕业学校:</span>
                                <input name="student.college" type="text" class="form-control"
                                       placeholder="输入毕业学校">
                            </div>
                        </td>
                    </tr>

                    <tr class="info">
                        <td colspan="12">
                            <div class="hj input-group input-group-sm div-no-spacing">
                                <span class="input-group-addon">户籍地址:</span>
                                <input class="hide">
                            </div>
                            <div class="hj input-group input-group-sm col-xs-10">
                                <span class="input-group-addon hide"></span>
                                <input name="student.permanentAddress" type="text" class="form-control"
                                       placeholder="输入身份证户籍地址">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="12">
                            <div class="xj input-group input-group-sm div-no-spacing">
                                <span class="input-group-addon">现居地址:</span>
                                <input class="hide">
                            </div>
                            <div class="xj input-group input-group-sm col-xs-10">
                                <span class="input-group-addon hide"></span>
                                <input name="student.presentAddress" type="text" class="form-control"
                                       placeholder="输入现居地址">
                            </div>
                        </td>
                    </tr>

                    <tr class="info">
                        <td colspan="6">
                            <div class="input-group input-group-sm">
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
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">课程:</span>
                                <select name="student.subject" class="form-control">
                                    <option value="java全栈工程师">java全栈工程师</option>
                                    <option value="Android工程师">Android工程师</option>
                                </select>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <label class="control-label form-control-static">支付方式:</label>
                        </td>
                        <td colspan="4">
                            <form class="form-inline">
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
                            </form>
                        </td>
                        <td colspan="6">
                            <div id="stuTuition" class="input-group input-group-sm">
                                <span class="input-group-addon">学费:</span>
                                <input name="student.tuition" type="number" class="form-control" value="0">
                            </div>
                        </td>
                    </tr>

                    <tr class="pay info">
                        <td colspan="6">
                            <div id="stuName" class="input-group input-group-sm ">
                                <span class="input-group-addon">首次还款日:</span>
                                <input id="firstRepaymentTime_time_list" name="student.firstRepaymentTime" type="date"
                                       class="form-control">
                            </div>
                        </td>
                        <td colspan="6">
                            <div id="stuName" class="input-group input-group-sm ">
                                <span class="input-group-addon">学生首次还款日:</span>
                                <input id="studentRepaymentTime_time_list" name="student.studentRepaymentTime"
                                       type="date"
                                       class="form-control">
                            </div>
                        </td>
                    </tr>

                    <tr class="pay">
                        <td colspan="6">
                            <div id="stuSubsidy" class="input-group input-group-sm">
                                <span class="input-group-addon">补助总金额:</span>
                                <input name="student.subsidy" type="number" class="form-control">
                            </div>
                        </td>
                        <td colspan="6">
                            <div id="stuResidualFrequency" class="input-group input-group-sm">
                                <span class="input-group-addon">补助次数:</span>
                                <input name="student.residualFrequency" type="number" class="form-control">
                            </div>
                        </td>
                    </tr>

                    <tr class="pay info">
                        <td colspan="6">
                            <div id="stuBankCard" class="input-group input-group-sm">
                                <span class="input-group-addon">银行卡号:</span>
                                <input name="student.bankCard" type="text" class="form-control"
                                       placeholder="输入学员银行卡号">
                            </div>
                        </td>
                        <td colspan="6">
                            <div id="stuBankName" class="input-group input-group-sm">
                                <span class="input-group-addon">开户行:</span>
                                <input name="student.bankName" type="text" class="form-control"
                                       placeholder="输入开户行名称">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="5">
                        </td>
                        <td colspan="7">
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
                            <div id="stuParentName" class="form-group">
                                <input id="parentName" name="student.emergencyContact" type="text" class="form-control"
                                       placeholder="输入父亲或母亲姓名">
                            </div>
                        </td>
                        <td colspan="3">
                            <select name="student.emergencyContact" class="form-control">
                                <option value="父亲">父亲</option>
                                <option value="母亲">母亲</option>
                            </select>
                        </td>
                        <td colspan="3">
                            <div id="stuParentPhoneNumber" class="form-group ">
                                <input id="parentPhoneNumber" name="student.emergencyContact" type="text"
                                       class="form-control"
                                       placeholder="输入电话号码">
                            </div>
                        </td>
                    </tr>

                    <tr class="info">
                        <td colspan="3">
                            <label class="control-label">紧急联系人</label>
                        </td>
                        <td colspan="3">
                            <div id="stuOther" class="form-group">
                                <input id="otherName" name="student.emergencyContact" type="text"
                                       class="contacts form-control"
                                       placeholder="输入紧急联系人姓名">
                            </div>
                        </td>
                        <td colspan="3">
                            <select name="student.emergencyContact" class="form-control">
                                <option value="亲戚">亲戚</option>
                                <option value="朋友">朋友</option>
                                <option value="同学">同学</option>
                            </select>
                        </td>
                        <td colspan="3">
                            <div id="stuOtherPhone" class="form-group">
                                <input id="otherPhoneNumber" name="student.emergencyContact" type="text"
                                       class="form-control"
                                       placeholder="输入电话号码">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label">备注:</label>
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
</@item>

<script>
    $(function () {
        Util.redrawFileInput({
            selector: '#upExcel',
            uploadUrl: Label.staticServePath + '/upAndDownLoadManager/upLoadExcel',
            allowedFileExtensions: ['xls'],//接收的文件后缀
            dropZoneEnabled: false,
        });

        Util.redrawFileInput({
            selector: '#upPhoto',
            uploadUrl: Label.staticServePath + '/upAndDownLoadManager/upLoadPhoto',
            allowedFileExtensions: ['jpg', 'png', 'gif'],//接收的文件后缀
            dropZoneEnabled: false,
        });
    });
</script>

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
    $(function () {
        var defaultTime = new Date();
        $('#birthday_time_list').val('1990-01-01');
        $('#graduationTime_time_list').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-01');
        $('#firstRepaymentTime_time_list').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-01');
        $('#studentRepaymentTime_time_list').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-01');
        $('#save-btn').on('click', sub);
    });
    function sub() {
//        if (judgeAll()) {
        func.addStudent('up');
//        } else {
//            alert("存在不合规范的上传内容");
//        }
    }
    function judge(mtime) {
        if (isNaN(mtime) || mtime == null) {
            return 0;
        }
        return mtime;
    }
</script>

<script type="text/javascript">
    function judge(boo, elem) {
        if (boo) {
            $(elem).removeClass('has-error');
            $(elem).addClass('has-success');
            return true;
        } else {
            $(elem).removeClass('has-success');
            $(elem).addClass('has-error');
            return false;
        }
    }
    var elem_name = $('input[name="student.name"]');
    var elem_contactInformation = $('input[name="student.contactInformation"]');
    var elem_major = $('input[name="student.major"]');
    var elem_email = $('input[name="student.email"]');
    var elem_qq = $('input[name="student.qq"]');
    var elem_idNumber = $('input[name="student.idNumber"]');
    var elem_school = $('input[name="student.college"]');
    var elem_permanentAddress = $('input[name="student.permanentAddress"]');
    var elem_presentAddress = $('input[name="student.presentAddress"]');
    var elem_bankCard = $('input[name="student.bankCard"]');
    var elem_bankName = $('input[name="student.bankName"]');
    var elem_parentName = $('#parentName');
    var elem_parentPhoneNumber = $('#parentPhoneNumber');
    var elem_otherName = $('#otherName');
    var elem_otherPhoneNumber = $('#otherPhoneNumber');
    $(function () {
        elem_name.change(function () {
            checkName(this);
        });

        elem_contactInformation.change(function () {
            checkPhoneNum(this);
        });

        elem_major.change(function () {
            checkMajor(this);
        });

        elem_email.change(function () {
            checkEmail(this);
        });

        elem_qq.change(function () {
            checkQq(this);
        });

        elem_idNumber.change(function () {
            checkIdNumber(this);
        });

        elem_school.change(function () {
            checkSchool(this);
        });

        elem_permanentAddress.change(function () {
            checkPermanentAddress(this);
        });

        elem_presentAddress.change(function () {
            checkPresentAddress(this);
        });

        elem_bankCard.change(function () {
            checkBankCard(this);
        });

        elem_bankName.change(function () {
            checkBankName(this);
        });

        elem_parentName.change(function () {
            checkParentName(this);
        });

        elem_parentPhoneNumber.change(function () {
            checkParentPhoneNumber(this);
        });

        elem_otherName.change(function () {
            checkOtherName(this);
        });

        elem_otherPhoneNumber.change(function () {
            checkOtherPhoneNumber(this);
        });
    });

    function checkName(elem) {
        var name = $(elem).val();
        var rule = new RegExp("\\S");
        return judge(rule.test(name), $('#stuName'));
    }

    function checkPhoneNum(elem) {
        var phoneNum = $(elem).val();
        var rule = new RegExp("^1[3578][0-9]{9}$");
        return judge(rule.test(phoneNum), $('#stuPhoneNumber'));
    }
    function checkMajor(elem) {
        var major = $(elem).val();
        var rule = new RegExp("\\S");
        return judge(rule.test(major), $('#stuMajor'));
    }

    function checkEmail(elem) {
        var email = $(elem).val();
        var rule = new RegExp("^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$");
        return judge(rule.test(email), $('#stuEmail'));
    }

    function checkQq(elem) {
        var qq = $(elem).val();
        var rule = new RegExp("^[1-9][0-9]{5,14}");
        return judge(rule.test(qq), $('#stuQq'));
    }

    function checkIdNumber(elem) {
        var idNumber = $(elem).val();
        var rule = new RegExp("^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$|^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$");
        return judge(rule.test(idNumber), $('#stuIdNumber'));
    }

    function checkSchool(elem) {
        var school = $(elem).val();
        var rule = new RegExp("\\S");
        return judge(rule.test(school), $('#stuSchool'));
    }

    function checkPermanentAddress(elem) {
        var permanentAddress = $(elem).val();
        var rule = new RegExp("\\S");
        var boo = true;
        $('.hj').each(function (index, elem) {
            boo = judge(rule.test(permanentAddress), $(elem));
        });
        if (boo) {
            return true;
        } else {
            return false;
        }
    }

    function checkPresentAddress(elem) {
        var presentAddress = $(elem).val();
        var rule = new RegExp("\\S");
        var boo = true;
        $('.xj').each(function (index, elem) {
            boo = judge(rule.test(presentAddress), $(elem));
        });
        if (boo) {
            return true;
        } else {
            return false;
        }
    }

    function checkBankCard(elem) {
        var bankCard = $(elem).val();
        var rule = new RegExp("^(\\d{16}|\\d{19})$");
        return judge(rule.test(bankCard), $('#stuBankCard'));
    }

    function checkBankName(elem) {
        var bankName = $(elem).val();
        var rule = new RegExp("\\S");
        return judge(rule.test(bankName), $('#stuBankName'));
    }

    function checkParentName(elem) {
        var name = $(elem).val();
        var rule = new RegExp("\\S");
        return judge(rule.test(name), $('#stuParentName'));
    }

    function checkParentPhoneNumber(elem) {
        var phoneNum = $(elem).val();
        var rule = new RegExp("^1[3578][0-9]{9}$");
        return judge(rule.test(phoneNum), $('#stuParentPhoneNumber'));
    }

    function checkOtherName(elem) {
        var name = $(elem).val();
        var rule = new RegExp("\\S");
        return judge(rule.test(name), $('#stuOther'));
    }

    function checkOtherPhoneNumber(elem) {
        var phoneNum = $(elem).val();
        var rule = new RegExp("^1[3578][0-9]{9}$");
        return judge(rule.test(phoneNum), $('#stuOtherPhone'));
    }

    function judgeAll() {
        if ($('#loan').is(":checked")) {
            if (checkName(elem_name) && checkPhoneNum(elem_contactInformation) && checkMajor(elem_major) && checkEmail(elem_email) && checkQq(elem_qq) && checkIdNumber(elem_idNumber) && checkSchool(elem_school) && checkPermanentAddress(elem_permanentAddress) && checkPresentAddress(elem_presentAddress) && checkBankCard(elem_bankCard) && checkBankName(elem_bankName) && checkParentName(elem_parentName) && checkParentPhoneNumber(elem_parentPhoneNumber) && checkOtherName(elem_otherName) && checkOtherPhoneNumber(elem_otherPhoneNumber)) {
                return true;
            }
        } else {
            if (checkName(elem_name) && checkPhoneNum(elem_contactInformation) && checkMajor(elem_major) && checkEmail(elem_email) && checkQq(elem_qq) && checkIdNumber(elem_idNumber) && checkSchool(elem_school) && checkPermanentAddress(elem_permanentAddress) && checkPresentAddress(elem_presentAddress) && checkParentName(elem_parentName) && checkParentPhoneNumber(elem_parentPhoneNumber) && checkOtherName(elem_otherName) && checkOtherPhoneNumber(elem_otherPhoneNumber)) {
                return true;
            }
        }
        return false;
    }
</script>