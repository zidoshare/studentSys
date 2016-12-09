<div id="dataTables-example_subsidy"
     class="table-responsive dataTables_wrapper form-inline" role="grid">
    <table class="table table-striped table-no-border"
           id="dataTables-example" aria-describedby="dataTables-example_apply">
        <tbody id="apply-body">
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">姓名:</span>
                    <input class="hide" name="id" value="${student.id}">
                    <span class="input-group-addon"><#if student.name??>${student.name}<#else>未填写</#if></span>
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">性别:</span>
                    <span class="input-group-addon"><#if student.sex??>${student.sex}<#else>未填写</#if></span>
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">出生日期:</span>
                    <input id="birthday-input" type="text" class="form-control" name="birthday" placeholder="未填写"
                           value="<#if student.birthday??>${(student.birthday?number)?number_to_date}</#if>">
                </div>
            </td>
            <td rowspan="4" class="text-center" width="150px"><img class="carousel-inner img-responsive img-rounded"
                                                                   src="http://imgsrc.baidu.com/baike/pic/item/f9198618367adab43246bfa18ed4b31c8601e4ba.jpg"/>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">手机号:</span>
                    <input type="number" class="form-control" name="contactInformation"
                           value="<#if student.contactInformation??>${student.contactInformation}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">学历:</span>
                    <input type="text" class="form-control" name="educationBackground"
                           value="<#if student.educationBackground??>${student.educationBackground}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">专业:</span>
                    <input type="text" class="form-control" name="major"
                           value="<#if student.major??>${student.major}<#else>未填写</#if>">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">邮箱:</span>
                    <input type="text" class="form-control" name="email"
                           value="<#if student.email??>${student.email}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">QQ:</span>
                    <input type="text" class="form-control" name="qq"
                           value="<#if student.qq??>${student.qq}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">咨询师:</span>
                    <span class="input-group-addon"><#if student.counselorName??>${student.counselorName}<#else>
                        未填写</#if></span>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">录入时间:</span>
                    <span class="input-group-addon"><#if student.admission??>${(student.admission?number)?number_to_date}<#else>"未填写"</#if></span>
                </div>
            </td>
            <td>

                <div class="input-group input-group-sm">
                    <span class="input-group-addon">培训状态:</span>
                    <input id="status-input" class="hide" name="status">
                    <select id="statusSelect_list" class="show-tick  form-control" onchange="change(${student.id})"
                            data-live-search="false">
                    <#list status as statu>
                        <option value="${statu.id}">${statu.statusName}</option>
                    </#list>
                    </select>
                </div>
            </td>
            <td>
                <div id="classInfo-div" class="input-group input-group-sm">
                    <span class="input-group-addon">所属班级:</span>
                    <span class="input-group-addon"><#if student.className??>${student.className}<#else>未填写</#if></span>
                </div>
                <div id="classSelect-div" class="input-group input-group-sm hide border-color-red">
                    <input id="input-class-id" class="hide" name="classId">
                    <input id="input-class-name" class="hide" name="className">
                    <span class="input-group-addon">重修班级:</span>
                    <select id="classSelect_list" class="show-tick  form-control" name="classId"
                            onchange="classChange()"
                            data-live-search="false">

                    </select>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="input-group input-group-sm div-no-spacing">
                    <span class="input-group-addon"> 毕业学校:</span>
                    <input class="hide">
                </div>
                <div class="input-group input-group-sm col-xs-7">
                    <span class="input-group-addon hide"></span>
                    <input type="text" class="form-control col-xs-4" name="college"
                           value="<#if student.college??>${student.college}<#else>未填写</#if>">
                </div>
            </td>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">毕业时间:</span>
                    <input id="graduationTime-input" type="text" class="form-control" name="graduationTime"
                           placeholder="未填写"
                           value="<#if student.graduationTime??>${(student.graduationTime?number)?number_to_date}</#if>">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">身份证号:</span>
                    <span class="input-group-addon"><#if student.idNumber??>${student.idNumber}<#else>未填写</#if></span>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="input-group input-group-sm div-no-spacing">
                    <span class="input-group-addon">户籍地址:</span>
                    <input class="hide">
                </div>
                <div class="input-group input-group-sm ">
                    <span class="input-group-addon hide"></span>
                    <span class="input-group-addon"><#if student.permanentAddress??>${student.permanentAddress}<#else>
                        未填写</#if></span>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="input-group input-group-sm div-no-spacing">
                    <span class="input-group-addon">现住地址:</span>
                    <input class="hide">
                </div>
                <div class="input-group input-group-sm col-xs-10">
                    <span class="input-group-addon hide"></span>
                    <input type="text" class="form-control col-xs-9" name="presentAddress"
                           value="<#if student.presentAddress??>${student.presentAddress}<#else>未填写</#if>">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="input-group input-group-sm div-no-spacing">
                    <span class="input-group-addon">紧急联系人:</span>
                    <input class="hide">
                </div>
                <div class="input-group input-group-sm col-xs-10">
                    <span class="input-group-addon hide"></span>
                    <input type="text" class="form-control " name="emergencyContact"
                           value="<#if student.emergencyContact??>${student.emergencyContact}<#else>未填写</#if>">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">缴费方式:</span>
                    <input type="text" class="form-control" name="paymentMethod"
                           value="<#if student.paymentMethod??>${student.paymentMethod}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">学费:</span>
                    <input type="number" class="form-control" name="tuition" placeholder="未填写"
                           value="${(student.tuition)!}">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">课程:</span>
                    <input type="text" class="form-control" name="subject"
                           value="<#if student.subject??>${student.subject}<#else>未填写</#if>">
                </div>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">开户行:</span>
                    <input type="text" class="form-control" name="bankName"
                           value="<#if student.bankName??>${student.bankName}<#else>未填写</#if>">
                </div>
            </td>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">银行卡号:</span>
                    <input type="number" class="form-control" name="bankCard"
                           value="${student.bankCard!}">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">首次还款日期:</span>
                    <span class="input-group-addon"><#if student.firstRepaymentTime??>${student.firstRepaymentTime}<#else>
                        未填写</#if></span>
                </div>
            </td>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">学生还款日期:</span>
                    <span class="input-group-addon"><#if student.studentRepaymentTime??>${student.studentRepaymentTime}<#else>
                        未填写</#if></span>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">补助总金额:</span>
                    <input type="number" class="form-control" name="subsidy" placeholder="未填写"
                           value="${student.subsidy!}">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">补助剩余次数:</span>
                    <input type="number" class="form-control" name="residualFrequency"
                           value="<#if student.residualFrequency??>${student.residualFrequency}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">补助余额:</span>
                    <span class="input-group-addon"><#if student.residualSubsidyAmount??>${student.residualSubsidyAmount}<#else>
                        未填写</#if></span>
                </div>
            </td>
            <td></td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    var change = function (studentId) {
        var statusInput = $('#status-input');
        var dom2 = $('#classSelect-div');
        var dom1 = $('#classInfo-div');
        var objS = document.getElementById("statusSelect_list");
        var grade = objS.options[objS.selectedIndex].value;
        statusInput.val(grade);
        func.getRepairClass(studentId, grade);
    }
    var classChange = function () {
        var idInput = $('#input-class-id');
        var nameInput = $('#input-class-name');
        var classId = $("#classSelect_list").val();
        var className = $('#input' + classId).val();
        idInput.val(classId);
        nameInput.val(className);
    }

</script>