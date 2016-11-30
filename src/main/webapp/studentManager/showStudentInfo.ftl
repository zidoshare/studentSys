<#include "../macro-item.ftl">
<div class="row animate">
    <div class="col-md-12">
        <div id="class-details" class="panel panel-default item">
            <div class="panel-heading title">
            ${view.title}
            </div>
            <div class="panel-body">
                <div id="table-inner">
                    <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer"
                               id="dataTables-example" aria-describedby="dataTables-example_info">
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
                                    手机号
                                </th>
                                <th>
                                    状态
                                </th>
                                <th>
                                    学历
                                </th>
                                <th>
                                   专业
                                </th>
                                <th>
                                    缴费方式
                                </th>
                                <th>
                                    补贴剩余次数
                                </th>

                                <th>
                                    备注
                                </th>
                                <th>
                                   操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <div class="checkbox3 checkbox-round text-center">
                                        <input type="checkbox" id="index-look1" checked="checked">
                                        <label class="checkbox-2" style="display: inline" for="index-look1">
                                        </label>
                                    </div>
                                </td>
                                <td>
                                    張三
                                </td>
                                <td>
                                    13881959623
                                </td>
                                <td>
                                   在读
                                </td>
                                <td>
                                    大专
                                </td>
                                <td>
                                    电子信息科学与技术
                                </td>
                                <td>
                                    贷款
                                </td>
                                <td>
                                    2
                                </td>
                                <td>
                                    [原]成都0719班
                                </td>
                                <td>
                                    <#--<#if  addAble ||  deleteAble>-->
                                        <#--<td>-->
                                            <button  onclick="func.seeStudentInformation()">详情</button>
                                            <#--<#list map["operators"+views.id] as op>-->
                                                <#--<#if op.url == "seeStudent">-->
                                                    <#--<@macroBtn url = op.url title = op.title></@macroBtn>-->
                                                    <#--<#assign op = map["operators"+view.id][0]>-->
                                                <#--${InsertKit(btnLabel)}/-->
                                                <#--</#if>-->
                                            <#--</#list>-->
                                            <#--<#list map["operators"+view.id] as op>-->
                                                <#--<#if op.url == "updateStudent">-->
                                                    <#--<@macroBtn url = op.url title = op.title></@macroBtn>-->
                                                    <#--<#assign op = map["operators"+view.id][0]>-->
                                                <#--${InsertKit(btnLabel)}/-->
                                                <#--</#if>-->
                                            <#--</#list>-->
                                        <#--${InsertKit(deleteBtn)}-->
                                        <#--</td>-->
                                    <#--</#if>-->
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="studentInformationModel" tabindex="-1" role="dialog" aria-labelledby="submitApplyModelLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">学生详情</h4>
            </div>
            <div class="modal-body">
                <div id="table-inner">
                    <div id="dataTables-example_subsidy" class="table-responsive dataTables_wrapper form-inline" role="grid">
                        <table   class="table table-striped "
                               id="dataTables-example" aria-describedby="dataTables-example_apply">
                            <tbody id="apply-body">
                            <form>
                                <tr>
                                    <td>姓名:<span>&nbsp;&nbsp;&nbsp;张三</span></td>
                                    <td>性别:<span>&nbsp;&nbsp;&nbsp;男</span></td>
                                    <td>出生日期:<span>&nbsp;&nbsp;&nbsp;2016.07.07</span></td>
                                    <td rowspan="4" class="text-center">照片</td>
                                </tr>
                                <tr>
                                    <td>手机号:<span>&nbsp;&nbsp;&nbsp;12345678900</span></td>
                                    <td>学历:<span>&nbsp;&nbsp;&nbsp;专科</span></td>
                                    <td>专业:<span>&nbsp;&nbsp;&nbsp;电子信息科学与技术</span></td>

                                </tr>
                                <tr>
                                    <td>邮箱:<span>&nbsp;&nbsp;&nbsp;352532535@qq.com</span></td>
                                    <td>QQ:<span>&nbsp;&nbsp;&nbsp;24121413251</span></td>
                                    <td>咨询师:<span>&nbsp;&nbsp;&nbsp;李四</span></td>

                                </tr>
                                <tr>
                                    <td>学分:<span>&nbsp;&nbsp;&nbsp;98</span></td>
                                    <td>考试平均分:<span>&nbsp;&nbsp;&nbsp;79</span></td>
                                    <td>项目平均分:<span>&nbsp;&nbsp;&nbsp;79</span></td>

                                </tr>
                                <tr>
                                    <td>录入时间:<span>&nbsp;&nbsp;&nbsp;2016.07.14</span></td>
                                    <td>培训毕业时间:<span>&nbsp;&nbsp;&nbsp;2016.11.14</span></td>
                                    <td>所属班级:<span>&nbsp;&nbsp;&nbsp;成都0719班</span></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>就业时间:<span>&nbsp;&nbsp;&nbsp;2016.07.14</span></td>
                                    <td>就业薪资:<span>&nbsp;&nbsp;&nbsp;4000</span></td>
                                    <td>就业单位:<span>&nbsp;&nbsp;&nbsp;互动无限</span></td>
                                    <td></td>
                                </tr>
                                    <td colspan="2"毕业学校:<span>&nbsp;&nbsp;&nbsp;成都大学</span></td>
                                    <td colspan="2">毕业时间:<span>&nbsp;&nbsp;&nbsp;2016.07.14</span></td>
                                </tr>
                                    <td colspan="4">身份证号:<span>&nbsp;&nbsp;&nbsp;5739329388337728282</span></td>
                                </tr>
                                </tr>
                                <td colspan="4">户籍地址:<span>&nbsp;&nbsp;&nbsp;成都市成都市成都市成都市成都市成都市成都市</span></td>
                                </tr>
                                </tr>
                                    <td colspan="4">现住地址:<span>&nbsp;&nbsp;&nbsp;成都市成都市成都市成都市成都市成都市成都市</span></td>
                                </tr>
                                </tr>
                                <td colspan="4">紧急联系人:<span>&nbsp;&nbsp;&nbsp;成都市成都市成都市成都市成都市成都市成都市</span></td>
                                </tr>
                                <tr>
                                    <td>缴费方式:<span>&nbsp;&nbsp;&nbsp;全款</span></td>
                                    <td>学费:<span>&nbsp;&nbsp;&nbsp;4000</span></td>
                                    <td>课程:<span>&nbsp;&nbsp;&nbsp;Java</span></td>
                                    <td></td>
                                </tr>
                                </tr>
                                    <td colspan="2">开户行:<span>&nbsp;&nbsp;&nbsp;成都银行</span></td>
                                    <td colspan="2">银行卡号:<span>&nbsp;&nbsp;&nbsp;1234567890309862</span></td>
                                </tr>
                                </tr>
                                <td colspan="2">首次还款日期:<span>&nbsp;&nbsp;&nbsp;2016.07.14</span></td>
                                <td colspan="2">学生还款日期:<span>&nbsp;&nbsp;&nbsp;2016.07.14</span></td>
                                </tr>
                                <tr>
                                    <td>补助总金额:<span>&nbsp;&nbsp;&nbsp;2100</span></td>
                                    <td>补助剩余次数:<span>&nbsp;&nbsp;&nbsp;3</span></td>
                                    <td>补助余额:<span>&nbsp;&nbsp;&nbsp;2100</span></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="4">备注:</td>
                                </tr>
                                <tr>
                                    <td colspan="4">欧ID萨福哦is阿富汗扫和或发哦is急撒风景哦isA级佛is阿金费isA级  和爱几分地发掘  就看见对方</td>
                                </tr>
                            </form>
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
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
