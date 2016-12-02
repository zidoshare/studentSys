<#include "../macro-title.ftl">
<@title title="学生信息录入">
</@title>
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
                        <input id="lefile" type="file" style="display:none">
                        <div class="input-append">
                            <input id="photoCover" class="input-large" type="text" style="height:30px;">
                            <a class="btn " onclick="$('input[id=lefile]').click();">Browse</a>
                        </div>

                        <script type="text/javascript">
                            $('input[id=lefile]').change(function () {
                                $('#photoCover').val($(this).val());
                            });
                        </script>
                    </div>
                </form>
            </div>
            <div class="panel-body">
                <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline"
                     role="grid">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 id="myModalLabel">添加学生信息</h4>
                        </div>
                        <div class="panel-body">

                            <div id="student" role="form" class="form-horizontal">
                                <div class="form-group col-sm-12 My-marginTop">
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentName" class="col-sm-4 control-label">姓名：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.name" id="studentName"
                                                   placeholder="姓名">
                                        </div>
                                    </div>
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentSex" class="col-sm-4 control-label">性別：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.sex"
                                                   id="studentSex"
                                                   placeholder="性别">
                                        </div>
                                    </div>
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentBirthDay" class="col-sm-4 control-label">出生日期：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.birthDay"
                                                   id="studentBirthDay"
                                                   placeholder="日期">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-sm-12 My-marginTop">
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentContactInformation"
                                               class="col-sm-4 control-label">手机号：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.contactInformation"
                                                   id="studentContactInformation"
                                                   placeholder="电话号码">
                                        </div>
                                    </div>
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentEducationBackground"
                                               class="col-sm-4 control-label">学历：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.educationBackground"
                                                   id="studentEducationBackground"
                                                   placeholder="学历">
                                        </div>
                                    </div>
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentMajor" class="col-sm-4 control-label">专业：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.major"
                                                   id="studentMajor"
                                                   placeholder="专业">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-sm-12 My-marginTop">
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentEmail" class="col-sm-4 control-label">邮箱：</label>
                                        <div class="col-sm-8">
                                            <input type="email" class="form-control" name="student.email"
                                                   id="studentEmail"
                                                   placeholder="邮箱">
                                        </div>
                                    </div>
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentQq" class="col-sm-4 control-label">QQ：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.qq"
                                                   id="studentQq"
                                                   placeholder="QQ">
                                        </div>
                                    </div>
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentGraduationTime" class="col-sm-4 control-label">毕业时间：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.graduationTime"
                                                   id="studentGraduationTime"
                                                   placeholder="毕业时间">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-sm-12 My-marginTop">
                                    <div class="form-group min-clear col-sm-6">
                                        <label for="studentIdNumber" class="col-sm-4 control-label">身份证号：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.idNumber"
                                                   id="studentIdNumber"
                                                   placeholder="身份证号">
                                        </div>
                                    </div>
                                    <div class="form-group min-clear col-sm-6">
                                        <label for="studentCollege" class="col-sm-4 control-label">毕业学校：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.college"
                                                   id="studentcollege"
                                                   placeholder="毕业学校">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-sm-12 My-marginTop">
                                    <div class="form-group min-clear col-sm-12">
                                        <label for="studentPermanentAddress"
                                               class="col-sm-2 control-label">户籍地址：</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="student.permanentAddress"
                                                   id="studentPermanentAddress"
                                                   placeholder="户籍地址">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-12 My-marginTop">
                                    <div class="form-group min-clear col-sm-12">
                                        <label for="studentPresentAddress" class="col-sm-2 control-label">现居地址：</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="student.presentAddress"
                                                   id="studentPresentAddress"
                                                   placeholder="现居地址">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-sm-12 My-marginTop">
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentCounselorId" class="col-sm-4 control-label">咨询师：</label>
                                        <div class="col-sm-8">
                                            <select type="text" class="form-control" name="student.counselorId"
                                                    id="studentCounselorId">
                                                <option value="111">XXX</option>
                                                <option value="111">XXX</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentSubject" class="col-sm-4 control-label">课程：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.subject"
                                                   id="studentSubject"
                                                   placeholder="课程">
                                        </div>
                                    </div>

                                    <div class="form-group min-clear col-sm-4">
                                        <label for="studentSubject" class="col-sm-4 control-label">学费：</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="student.subject"
                                                   id="studentSubject"
                                                   placeholder="课程">
                                        </div>
                                    </div>


                                </div>

                                <div class="form-group col-sm-12 My-marginTop">
                                    <div class="form-group min-clear col-sm-6">
                                        <label for="studentPaymentMethod" class="col-sm-4 control-label">缴费方式：</label>
                                        <div class="col-sm-8">
                                            <input type="radio" class="form-control" name="student.paymentMethod"
                                                   id="studentPaymentMethod1"/>
                                            <label for="studentPaymentMethod1" class="col-sm-4 control-label">现金</label>
                                            <input type="radio" class="form-control" name="student.paymentMethod"
                                                   id="studentPaymentMethod2"/>
                                            <label for="studentPaymentMethod2" class="col-sm-4 control-label">贷款</label>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group col-sm-12 My-marginTop">
                                    <div class="form-group col-sm-12 My-marginTop">
                                        <div class="form-group min-clear col-sm-6">
                                            <label for="studentFirstRepaymentTime"
                                                   class="col-sm-4 control-label">首次还款日：</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control"
                                                       name="student.firstRepaymentTime"
                                                       id="studentFirstRepaymentTime"
                                                       placeholder="首次还款日">
                                            </div>
                                        </div>
                                        <div class="form-group min-clear col-sm-6">
                                            <label for="studentStudentRepaymentTime" class="col-sm-4 control-label">学生还款日：</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control"
                                                       name="student.studentRepaymentTime"
                                                       id="studentStudentRepaymentTime"
                                                       placeholder="学生还款日">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-12 My-marginTop">
                                        <div class="form-group min-clear col-sm-6">
                                            <label for="studentSubsidy" class="col-sm-4 control-label">补助总金额：</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" name="student.subsidy"
                                                       id="studentSubsidy"
                                                       placeholder="0">
                                            </div>
                                        </div>
                                        <div class="form-group min-clear col-sm-6">
                                            <label for="studentResidualFrequency"
                                                   class="col-sm-4 control-label">补助次数：</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control"
                                                       name="student.residualFrequency"
                                                       id="studentResidualFrequency"
                                                       placeholder="3">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-12 My-marginTop">
                                        <div class="form-group min-clear col-sm-6">
                                            <label for="studentBankCard" class="col-sm-4 control-label">银行卡号：</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" name="student.bankCard"
                                                       id="studentBankCard"
                                                       placeholder="0">
                                            </div>
                                        </div>
                                        <div class="form-group min-clear col-sm-6">
                                            <label for="studentBankName" class="col-sm-4 control-label">开户行：</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="student.bankName"
                                                       id="studentBankName"
                                                       placeholder="3">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group My-tableMarginTop">
                                    <table class=" table table-striped table-bordered table-hover dataTable no-footer"
                                           id="dataTables-example" aria-describedby="dataTables-example_info">
                                        <thead>
                                        <tr>
                                            <th colspan="4" class="text-center">
                                                紧急联系人
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                联系人
                                            </th>
                                            <th>
                                                姓名
                                            </th>
                                            <th>
                                                关系
                                            </th>
                                            <th>
                                                电话
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <label class="control-label min-clear text-right">家人：</label>
                                            </td>
                                            <td>
                                                <div class="form-group min-clear col-sm-6">
                                                    <input type="text" class="form-control" name="student.emergencyContact"
                                                           id="studentEmergencyContactPName"
                                                           placeholder="家人姓名">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group min-clear col-sm-6">
                                                    <select class="form-control" name="student.emergencyContact" id="studentEmergencyContactPR"
                                                            placeholder="3">
                                                        <option>父亲</option>
                                                        <option>母亲</option>
                                                    </select>
                                            </td>
                                            <td>
                                                <div class="form-group min-clear col-sm-6">
                                                    <input type="text" class="form-control" name="student.emergencyContact"
                                                           id="studentEmergencyContactP"
                                                           placeholder="3">
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label class="control-label text-right">紧急联系人：</label>
                                            </td>
                                            <td>
                                                <div class="form-group min-clear col-sm-12">
                                                    <input type="text" class="form-control" name="student.emergencyContact"
                                                           id="studentEmergencyContactFName"
                                                           placeholder="紧急联系人姓名">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group min-clear col-sm-12">
                                                    <select class="form-control" name="student.emergencyContact" id="studentEmergencyContactFR"
                                                            placeholder="3">
                                                        <option>亲戚</option>
                                                        <option>朋友</option>
                                                        <option>同学</option>
                                                    </select>
                                            </td>
                                            <td>
                                                <div class="form-group min-clear col-sm-6">
                                                    <input type="text" class="form-control" name="student.emergencyContact"
                                                           id="studentEmergencyContactF"
                                                           placeholder="3">
                                                </div>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>

                                <div class="form-group min-clear My-marginTop col-sm-12">
                                    <label for="studentRemark" class="col-sm-2 control-label clear-left">备注：</label>
                                    <div class="col-sm-10">
                                        <textarea type="text" class="form-control clear-left My-textAreaWidth"
                                                  name="student.remark"
                                                  id="studentRemark"
                                                  placeholder="内容">
                                        </textarea>
                                    </div>
                                </div>


                                </form>


                            </div>

                            <div class="tip-container">
                                <div class="tip" id="saveTip" aria-label="0">
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="clearfix">
                                <button data-style="slide-up" id="save-btn"
                                        class="btn btn-primary ladda-button pull-right"
                                        onclick="func.addStudent('up')">
                                    <span class="ladda-label">保存</span>
                                </button>

                                <button type="button" class="btn btn-default pull-right" data-dismiss="modal">取消
                                </button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>