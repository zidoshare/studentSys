<div id="dataTables-example_subsidy"
     class="table-responsive dataTables_wrapper form-inline" role="grid">
    <table class="table table-striped table-no-border"
           id="dataTables-example" aria-describedby="dataTables-example_apply">
        <tbody id="apply-body">
        <form>
            <tr>
                <td>姓名:<span>&nbsp;&nbsp;&nbsp;<#if student.name??>${student.name}<#else>未填写</#if></span></td>
                <td>性别:<span>&nbsp;&nbsp;&nbsp;<#if student.sex??>${student.sex}<#else>未填写</#if></span></td>
                <td>出生日期:<span>&nbsp;&nbsp;&nbsp;<#if student.birthday??>${student.birthday}<#else>未填写</#if></span></td>
                <td rowspan="4" class="text-center" width="150px"><img class="carousel-inner img-responsive img-rounded" src="http://imgsrc.baidu.com/baike/pic/item/f9198618367adab43246bfa18ed4b31c8601e4ba.jpg"/></td>
            </tr>
            <tr>
                <td>手机号:<span>&nbsp;&nbsp;&nbsp;<#if student.contactInformation??>${student.contactInformation}<#else>未填写</#if></span></td>
                <td>学历:<span>&nbsp;&nbsp;&nbsp;<#if student.educationBackground??>${student.educationBackground}<#else>未填写</#if></span></td>
                <td>专业:<span>&nbsp;&nbsp;&nbsp;<#if student.major??>${student.major}<#else>未填写</#if></span></td>

            </tr>
            <tr>
                <td>邮箱:<span>&nbsp;&nbsp;&nbsp;<#if student.email??>${student.email}<#else>未填写</#if></span></td>
                <td>QQ:<span>&nbsp;&nbsp;&nbsp;<#if student.qq??>${student.qq}<#else>未填写</#if></span></td>
                <td>咨询师:<span>&nbsp;&nbsp;&nbsp;<#if student.counselorName??>${student.counselorName}<#else>未填写</#if></span></td>

            </tr>
            <tr>
                <td>学分:<span>&nbsp;&nbsp;&nbsp;<#if student.credit??>${student.credit}<#else>未填写</#if></span></td>
                <td>考试平均分:<span>&nbsp;&nbsp;&nbsp;<#if student.testAverage??>${student.testAverage}<#else>未填写</#if></span></td>
                <td>项目平均分:<span>&nbsp;&nbsp;&nbsp;<#if student.trainingEvaluation??>${student.trainingEvaluation}<#else>未填写</#if></span></td>

            </tr>
            <tr>
                <td>录入时间:<span>&nbsp;&nbsp;&nbsp;<#if student.admission??>${student.admission}<#else>未填写</#if></span></td>
                <td>培训状态:<span>&nbsp;&nbsp;&nbsp;<#if student.trainingGraduationTime??>${student.trainingGraduationTime}<#else>未填写</#if></span></td>
                <td>所属班级:<span>&nbsp;&nbsp;&nbsp;<#if student.className??>${student.className}<#else>未填写</#if></span></td>
                <td></td>
            </tr>
            <tr>
                <td>就业时间:<span>&nbsp;&nbsp;&nbsp;<#if student.className??>${student.className}<#else>未填写</#if></span></td>
                <td>就业薪资:<span>&nbsp;&nbsp;&nbsp;<#if student.className??>${student.className}<#else>未填写</#if></span></td>
                <td>就业单位:<span>&nbsp;&nbsp;&nbsp;<#if student.className??>${student.className}<#else>未填写</#if></span></td>
                <td></td>
            </tr>
            <td colspan="2"> 毕业学校:<span>&nbsp;&nbsp;&nbsp;<#if student.college??>${student.college}<#else>未填写</#if></span></td>
            <td colspan="2">毕业时间:<span>&nbsp;&nbsp;&nbsp;<#if student.graduationTime??>${student.graduationTime}<#else>未填写</#if></span></td>
            </tr>
            <td colspan="4">身份证号:<span>&nbsp;&nbsp;&nbsp;<#if student.idNumber??>${student.idNumber}<#else>未填写</#if></span></td>
            </tr>
            </tr>
            <td colspan="4">户籍地址:<span>&nbsp;&nbsp;&nbsp;<#if student.permanentAddress??>${student.permanentAddress}<#else>未填写</#if></span>
            </td>
            </tr>
            </tr>
            <td colspan="4">现住地址:<span>&nbsp;&nbsp;&nbsp;<#if student.presentAddress??>${student.presentAddress}<#else>未填写</#if></span>
            </td>
            </tr>
            </tr>
            <td colspan="4">紧急联系人:<span>&nbsp;&nbsp;&nbsp;<#if student.emergencyContact??>${student.emergencyContact}<#else>未填写</#if></span>
            </td>
            </tr>
            <tr>
                <td>缴费方式:<span>&nbsp;&nbsp;&nbsp;<#if student.paymentMethod??>${student.paymentMethod}<#else>未填写</#if></span></td>
                <td>学费:<span>&nbsp;&nbsp;&nbsp;<#if student.tuition??>${student.tuition}<#else>未填写</#if></span></td>
                <td>课程:<span>&nbsp;&nbsp;&nbsp;<#if student.subject??>${student.subject}<#else>未填写</#if></span></td>
                <td></td>
            </tr>
            </tr>
            <td colspan="2">开户行:<span>&nbsp;&nbsp;&nbsp;<#if student.bankName??>${student.bankName}<#else>未填写</#if></span></td>
            <td colspan="2">银行卡号:<span>&nbsp;&nbsp;&nbsp;<#if student.bankCard??>${student.bankCard}<#else>未填写</#if></span></td>
            </tr>
            </tr>
            <td colspan="2">首次还款日期:<span>&nbsp;&nbsp;&nbsp;<#if student.firstRepaymentTime??>${student.firstRepaymentTime}<#else>未填写</#if></span></td>
            <td colspan="2">学生还款日期:<span>&nbsp;&nbsp;&nbsp;<#if student.studentRepaymentTime??>${student.studentRepaymentTime}<#else>未填写</#if></span></td>
            </tr>
            <tr>
                <td>补助总金额:<span>&nbsp;&nbsp;&nbsp;<#if student.subsidy??>${student.subsidy}<#else>未填写</#if></span></td>
                <td>补助剩余次数:<span>&nbsp;&nbsp;&nbsp;<#if student.residualFrequency??>${student.residualFrequency}<#else>未填写</#if></span></td>
                <td>补助余额:<span>&nbsp;&nbsp;&nbsp;<#if student.residualSubsidyAmount??>${student.residualSubsidyAmount}<#else>未填写</#if></span></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4">备注:</td>
            </tr>
            <tr>
                <td colspan="4"><#if student.remark??>${student.remark}<#else>未填写</#if></td>
            </tr>
        </form>
        </tbody>
    </table>
</div>
