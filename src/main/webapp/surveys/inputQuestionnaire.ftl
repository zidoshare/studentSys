<!DOCTYPE html>
<html>
<head>
    <title>组卷</title>
</head>
<body>
<div class="container-fluid">
<#include "macro-head.ftl">
    <div class="popover-title"><h3>试卷操作</h3></div>
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover ">
            <tr>
                <th>班级</th>
                <th>创建时间</th>
                <th>班主任</th>
                <th>调查对象</th>
                <th>结束时间</th>
                <th>操作</th>
            </tr>
        <#list questionnaires.list as questionnaire>
            <tr id="${questionnaire.id}">
                <td>${questionnaire.className}</td>
                <td>${(questionnaire.date?number)?number_to_datetime}</td>
                <td>${questionnaire.classChief}</td>
                <td>${questionnaire.toUser}</td>
                <td>${(questionnaire.endTime?number)?number_to_datetime}</td>
                <td><a>修改</a>/<a>删除</a></td>
            </tr>
        </#list>
        </table>
    </div>
    <br/>
    <hr/>
    <br/>
    <div class="popover-title">
        <h3>选择题目</h3>
        <button class="btn btn-danger" onclick="clearChoose()">取消全选</button>
        <button class="btn btn-danger" onclick="fillChoose()">全选</button>
    </div>
    <div class="table-responsive">
        <table class="table" id="question">
            <tr>
                <th>
                    选择
                </th>
                <th>
                    大分类
                </th>
                <th>
                    类型
                </th>
                <th>
                    题目
                </th>
            </tr>
        <#list questions as question>
            <tr id="question${question.id}" class="question-flag">
                <td>
                    <label>
                        <input type="checkbox">
                    </label>
                </td>
                <td>
                ${question.bigTypeId}
                </td>
                <td>${question.type}</td>
                <td>${question.title}</td>
                <td class="hidden score">${question.maxScore}</td>
            </tr>
        </#list>
        </table>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">填写试卷信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form">
                        <div class="form-group">
                            <label for="class-name">班级名称</label>
                            <input type="text" id="class-name" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="class-chief">班主任</label>
                            <input type="text" id="class-chief" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="to-user">调查对象</label>
                            <input type="text" id="to-user" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="date">开始时间</label>
                            <input type="text" id="date" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="end-time">结束时间</label>
                            <input type="text" id="end-time" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="note">备注</label>
                            <input type="text" id="note" class="form-control"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button data-style="slide-up" id="save-btn" class="btn btn-success btn-lg ladda-button"
                            data-spinner-color="#75d9b7"
                            data-size="s" tabindex="10" onclick="addQuestionnaire()">
                        <span class="ladda-label">保存</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <button class="btn btn-danger" onclick="clearChoose()">取消全选</button>
    <button class="btn btn-danger" onclick="fillChoose()">全选</button>
    <button class="btn btn-success pull-right" data-toggle="modal" data-target="#myModal" onclick="createTime()">添加试卷
    </button>
</body>
<script type="text/javascript">
    $('tr').click(function () {
        var input = $(this).find('input').first();
        var isChoose = input.prop('checked');
        if (isChoose == true)
            input.prop('checked', false);
        else
            input.prop('checked', true);
    });
    function addQuestionnaire() {
        var trs = $("#question").find(".question-flag");
        var ids = "";
        var sum = 0;
        trs.each(function () {
            var b = $(this).find("input[type='checkbox']").first().is(':checked');
            var id = $(this).attr('id').replace("question", "");
            if (b == true) {
                ids += id + ",";
                sum += parseInt($(this).find('.score').first().text());
            }
        });
        ids.substr(0, ids.length - 1);
        var testQuestionnaireStartTime = new Date($("#date").val()).getTime();
        var testQuestionnaireEndTime = new Date($("#end-time").val()).getTime();
        var jsonObj = {
            "questionnaire.class_name": $("#class-name").val(),
            "questionnaire.date": testQuestionnaireStartTime,
            "questionnaire.class_chief": $("#class-chief").val(),
            "questionnaire.to_user": $("#to-user").val(),
            "questionnaire.end_time": testQuestionnaireEndTime,
            "questionnaire.note": $("#note").val(),
            "questionnaire.maxScore": sum,
            "questionsId": ids
        };
        Util.ajax("${staticServePath}/surveys/postQuestionnaire", {
            data: jsonObj,
            success: {
                bindContainer: ['#page-inner'],
                bindModal: $('#myModal')
            }
        });
    }
    function clearChoose() {
        var trs = $("#question").find(".question-flag");
        trs.each(function () {
            var b = $(this).find("input[type='checkbox']").first();
            b.prop("checked", false);
        });
    }
    function fillChoose() {
        var trs = $("#question").find(".question-flag");
        trs.each(function () {
            var b = $(this).find("input[type='checkbox']").first();
            b.prop("checked", true);
        });
    }
    function createTime() {
        Util.ajax("${staticServePath}/surveys/getNowTime", {
            success: function (data, status) {
                $("#end-time").val(getMyDate(Number(data.msg)));
                $("#date").val(getMyDate(Number(data.msg)));
            }
        })
    }
    //获得年月日      得到日期oTime
    function getMyDate(str) {
        var oDate = new Date(str),
                oYear = oDate.getFullYear(),
                oMonth = oDate.getMonth() + 1,
                oDay = oDate.getDate(),
                oHour = oDate.getHours(),
                oMin = oDate.getMinutes(),
                oSen = oDate.getSeconds(),
                oTime = oYear + '/' + getzf(oMonth) + '/' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
        return oTime;
    }
    ;
    //补0操作
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }

</script>
</html>