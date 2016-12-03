<div id="dataTables-example_subsidy"
     class="table-responsive dataTables_wrapper form-inline" role="grid">
    <table class="table table-striped table-no-border"
           id="dataTables-example" aria-describedby="dataTables-example_apply">
        <tbody id="apply-body">
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">姓名:</span>
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
                    <input type="text" class="form-control"
                           value="<#if student.birthday??>${student.birthday}<#else>未填写</#if>">
                </div>
            </td>
            <td rowspan="4" class="text-center" width="150px">照片</td>
        </tr>
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">手机号:</span>
                    <input type="text" class="form-control"
                           value="<#if student.contactInformation??>${student.contactInformation}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">学历:</span>
                    <input type="text" class="form-control"
                           value="<#if student.educationBackground??>${student.educationBackground}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">学历:</span>
                    <input type="text" class="form-control"
                           value="<#if student.major??>${student.major}<#else>未填写</#if>">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">邮箱:</span>
                    <input type="text" class="form-control"
                           value="<#if student.email??>${student.email}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">QQ:</span>
                    <input type="text" class="form-control"
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
                    <span class="input-group-addon"><#if student.admission??>${student.admission}<#else>未填写</#if></span>
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">培训状态:</span>
                    <input type="text" class="form-control"
                           value="<#if student.trainingGraduationTime??>${student.trainingGraduationTime}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">所属班级:</span>
                    <span class="input-group-addon"><#if student.className??>${student.className}<#else>未填写</#if></span>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">  毕业学校:</span>
                    <input type="text" class="form-control" placeholder="Twitterhandle"
                           value="<#if student.college??>${student.college}<#else>未填写</#if>">
                </div>
            </td>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">毕业时间:</span>
                    <input type="text" class="form-control" placeholder="Twitterhandle"
                           value="<#if student.graduationTime??>${student.graduationTime}<#else>未填写</#if>">
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
                <div class="input-group input-group-sm col-xs-9">
                    <span class="input-group-addon">户籍地址:</span>
                    <span class="input-group-addon"><#if student.permanentAddress??>${student.permanentAddress}<#else>未填写</#if></span>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="input-group input-group-sm col-xs-9">
                    <span class="input-group-addon">现住地址:</span>
                    <input type="text" class="form-control"
                           value="<#if student.presentAddress??>${student.presentAddress}<#else>未填写</#if>">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="input-group input-group-sm col-xs-9">
                    <span class="input-group-addon">紧急联系人:</span>
                    <input type="text" class="form-control  "
                           value="<#if student.emergencyContact??>${student.emergencyContact}<#else>未填写</#if>">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">缴费方式:</span>
                    <input type="text" class="form-control"
                           value="<#if student.paymentMethod??>${student.paymentMethod}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">学费:</span>
                    <input type="text" class="form-control"
                           value="<#if student.tuition??>${student.tuition}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">课程:</span>
                    <input type="text" class="form-control"
                           value="<#if student.subject??>${student.subject}<#else>未填写</#if>">
                </div>
             </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">开户行:</span>
                    <input type="text" class="form-control"
                           value="<#if student.bankName??>${student.bankName}<#else>未填写</#if>">
                </div>
            </td>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">银行卡号:</span>
                    <input type="text" class="form-control"
                           value="<#if student.bankCard??>${student.bankCard}<#else>未填写</#if>">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">首次还款日期:</span>
                    <span class="input-group-addon"><#if student.firstRepaymentTime??>${student.firstRepaymentTime}<#else>未填写</#if></span>
                </div>
            </td>
            <td colspan="2">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">学生还款日期:</span>
                    <span class="input-group-addon"><#if student.studentRepaymentTime??>${student.studentRepaymentTime}<#else>未填写</#if></span>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">补助总金额:</span>
                    <input type="text" class="form-control"
                           value="<#if student.subsidy??>${student.subsidy}<#else>未填写</#if>">
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">补助剩余次数:</span>
                    <span class="input-group-addon"><#if student.residualFrequency??>${student.residualFrequency}<#else>未填写</#if></span>
                </div>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">补助余额:</span>
                    <span class="input-group-addon"><#if student.residualSubsidyAmount??>${student.residualSubsidyAmount}<#else>未填写</#if></span>
                </div>
            </td>
            <td></td>
        </tr>
        </tbody>
    </table>
</div>
