<!DOCTYPE html>
<!--suppress ALL -->
<html lang="zh_cn">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width" name="viewport">
    <link rel="Shortcut Icon" href="${staticServePath}/images/favicon.ico"/>
    <title>考试</title>
    <link href="${staticServePath}/static/css/css.css?${staticResourceVersion}" rel="stylesheet">
    <link href="${staticServePath}/static/css/base.css?${staticResourceVersion}" rel="stylesheet">
    <script src="${staticServePath}/static/js/lib/jquery-3.1.0.min.js?${staticResourceVersion}"></script>
    <script src="${staticServePath}/static/js/lib/icheck.min.js?${staticResourceVersion}"></script>
    <script src="${staticServePath}/static/js/lib/jquery.transit.js?${staticResourceVersion}"></script>
</head>
<body>
<div class="wrapper cs-wrapper" id="wrapper">
    <div class="big-container">
        <div class="tip" id="submitTip" aria-label="0">
        </div>
    </div>
    <div id="survey_progress" class="progress">
        <div class="progress-bar" role="progressbar"
             style="width: 0;height:20px;" id="min-progress">
            0
        </div>

    <#--
            <p>开始时间<font id="start-time"></font>·结束时间<font id="end-time"></font>·现在时间<font id="now"></font></p>
    -->

    </div>
    <div class="count" id="count">倒计时：<font id="count-down"></font></div>
    <div class="tip" id="postTip"></div>
    <div class="container">
        <div class="survey_title">
            <h1>${questionnaire.testQuestionnaireTitle}</h1>
        <#if questionnaire.testQuestionnaireMessage??>
            <h4 class="survey_summary">
                <span style="color: red">试卷提示:</span>
            ${questionnaire.testQuestionnaireMessage?html}
            </h4>
        </#if>
        </div>
        <form method="get" id="questionnaire${questionnaire.id}">
        <#assign index = 0>
        <#assign bigNumber = ["一","二","三","四","五","六","七","八","九","十"]>
        <#assign xx = ['A','B','C','D','E','F','G']>
            <ul class="subject_list">
            <#list types as type>
                <li class="subject_big">
                    <h3>${type.typeName}</h3>
                </li>
                <#list questionMap["${type.id}"] as question>
                    <li class="subject"
                        id="${questionnaire.id}S${question.id}"
                        data-label='0'>
                        <#assign index++>
                        <h4 class="subject_title">${index}、${question.testQuestionTitle}
                        </h4>
                        <#if (question.testQuestionContent?eval)?size gt 0>
                            <#if type.id == 1>
                                <#list question.testQuestionContent?eval as node>
                                    <label class="subject_option point_item" id="${question.id}S${node_index}"
                                           data-label="${questionnaire.id}S${question.id}" data-index="${node_index}">
                                        <input class="iCheck" name="${questionnaire.id}S${question.id}" type="radio">
                                    ${xx[node_index]}、${node}
                                    </label>
                                </#list>
                            <#else>
                                <#list question.testQuestionContent?eval as node>
                                    <label class="subject_option point_item" id="${question.id}S${node_index}"
                                           data-label="${questionnaire.id}S${question.id}" data-index="${node_index}">
                                        <input class="iCheck" name="${questionnaire.id}S${question.id}" type="checkbox">
                                    ${xx[node_index]}、${node}
                                    </label>
                                </#list>
                            </#if>

                        <#else>
                            <textarea class="comment" rows="10" tabindex="4"
                                      placeholder="答案"></textarea>
                        </#if>
                    </li>
                </#list>
            </#list>
            </ul>
        </form>
        <div style="text-align: right">
            <button class="submit" type="submit" onclick="postReply()">提交</button>

        </div>
    </div>

</div>
<div class="whole-container">
    <div class="tip" id="wholeTip" aria-label="0">
    </div>
</div>
<script type="text/javascript"
        src="${staticServePath}/static/js/lib/jquery.cookie.js?${staticResourceVersion}"></script>
<script type="text/javascript" src="${staticServePath}/static/js/common.js?${staticResourceVersion}"></script>
<script>

    var progressFlag;
    var proccer = 0;
    var max = ${questionSize};
    var reply = ${testReply};
    var answers = JSON.parse(reply['answers']);

    $(document).ready(function () {
        $('input').iCheck({
            checkboxClass: 'iradio_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });

        var t = 0;
        $(document).find('li.subject').each(function (index, doc) {
            var d = $(this);
            setTimeout(function () {
                d.addClass('a-move-in-left');
                d.css("opacity", "1");
            }, t);
            t += 100;
        });

        //时间控制
        var start = ${questionnaire.testQuestionnaireStartTime};
        var end = ${questionnaire.testQuestionnaireEndTime};
        progressFlag = ${questionnaire.id};
        getMyDate(new Date(${questionnaire.testQuestionnaireStartTime})) + "   " + getMyDate(${questionnaire.testQuestionnaireEndTime});
        $('#start-time').text(getMyDate(start));
        $('#end-time').text(getMyDate(end));
        $('#now').text(getMyDate(new Date().getTime()));
        var time = ${questionnaire.testQuestionnaireEndTime?number}-new Date().getTime();
        formatDuring(time);
        countDown();
        $('#count').transition({opacity: 1, top: 0}, 1000);

        //读取内容并初始化进度
        readAnswers();
        max = ${questionSize};

        $('.point_item').on('ifChecked', addValue);
        $('.point_item').on('ifUnchecked', addValue);
        $('textarea').on('input propertychange', addText);

        function readAnswers() {
            console.log('read');
            var x = 0;
            /*$('.point_item').each(function(index,dom){
                if(answers[$(dom).attr('data-label')] != null){
                    var ans = answers[$(dom).attr('data-label')];
                    if($.inArray($(dom).val(),ans)){
                        $(dom).find('input').first().iCheck('check');
                    }
                }
            });*/

            for (var key in answers) {
                var i = 0;
                var dom = $('#'+key);
                dom.find('input,textarea').each(function (index, dom) {
                    if($(dom).is('textarea')){
                        x++;
                        $(dom).val(answers[key]);
                        return false;
                        i++;
                    }
                    var ind = $(dom).parent().parent().attr('data-index');
                    if ($.inArray(ind, answers[key]) >= 0) {
                        $(dom).iCheck('check');
                        x++;
                        i++;
                    }
                });
                if (i > 0)
                    changeProgress(parseFloat((++proccer / max * 100)).toFixed(2) + "%");
            }
            /*$('#questionnaire${questionnaire.id}

                        ').find('input,textarea').each(function (index, dom) {
                                        var ans = answers[$(dom).attr('id')];
                                        if (ans == 'checked') {
                                            $(dom).iCheck('check');
                                            var parent = $(dom).parent().parent().parent();
                                            var data = parseInt(parent.attr('data-label'));
                                            if (data + 1 == 1) {
                                                changeProgress(parseFloat((++proccer / max * 100)).toFixed(2) + "%");
                                            }
                                            parent.attr('data-label', data + 1);
                                        }
                                        else if (ans != null) {
                                            $(dom).val(ans);
                                            var parent = $(dom).parent();
                                            var data = parseInt(parent.attr('data-label'));
                                            changeProgress(parseFloat((++proccer / max * 100)).toFixed(2) + "%");
                                            parent.attr('data-label', data + 1);
                                        }
                                        else
                                            return true;
                                        x++;
                                        console.log(ans);
                                    });*/
            return x;
        }

        function addText() {
            var val = $(this).val();
            var parent = $(this).parent();
            if (val != null && val != '') {
                answers[parent.attr('id')] = [val];
                var data = parseInt(parent.attr('data-label'));
                parent.attr('data-label', 1);
                if (val.length > 0 && data == 0) {
                    changeProgress(parseFloat((++proccer / max * 100)).toFixed(2) + "%");
                }
            }

            else {
                var parent = $(this).parent();
                delete answers[parent.attr('id')];
                var data = parseInt(parent.attr('data-label'));
                parent.attr('data-label', 0);
                if (val.length == 0 && data == 1) {
                    changeProgress(parseFloat((--proccer / max * 100)).toFixed(2) + "%");
                }
            }

        }

        function addValue() {
            var ans = [];
            $(this).parent().find('input').each(function (index, dom) {
                if ($(dom).prop('checked') == true) {
                    ans.push(index+'');
                }
            });
            var len = 0;
            if (answers[$(this).attr('data-label')] != null) {
                len = answers[$(this).attr('data-label')].length;
            }
            answers[$(this).attr('data-label')] = ans;
            if (ans.length == 1 && len == 0) {
                changeProgress(parseFloat((++proccer / max * 100)).toFixed(2) + "%");
            }
            if (ans.length <= 0) {
                if (len == 1)
                    changeProgress(parseFloat((--proccer / max * 100)).toFixed(2) + "%");
                delete answers[$(this).attr('data-label')];
            }
        }

        //移除
        /*function removeValue() {
            delete answers[$(this).attr('id')];
            var parent = $(this).parent().parent().parent();
            var data = parseInt(parent.attr('data-label'));
            parent.attr('data-label', data - 1);


            var ans = answers[$(this).attr('id')];
            if(ans == null)
                    ans = [];
            var index = jQuery.inArray($(this).val(),ans);
            ans.splice(index,1);
            if(ans.length == 0)
                delete answers[parent.attr('id')];


            if (data - 1 <= 0) {
                changeProgress(parseFloat((--proccer / max * 100)).toFixed(2) + "%");
            }
        }*/

        setTimeout(cacheAnswers, 3000);
        function cacheAnswers() {
            reply['answers'] = JSON.stringify(answers);
            $.ajax({
                        url: "${staticServePath}/test/cacheAnswer",
                        dataType: 'json',
                        type: 'post',
                        data: reply,
                        success: function (data, status) {
                            if (data.state == 'success') {
                                setTimeout(cacheAnswers, 3000);
                            }
                            else
                                Util.showTip($('#wholeTip'), data.msg, 'alert alert-danger');
                        }, error: function () {

                        }
                    }
            );
        }

        var minutes;
        var mm;
        var hours;
        var days;

        function countDown() {
            var now = new Date().getTime();
            $("#count-down").text(formatDuring(end - now));
            if (days <= 0 && hours <= 0 && minutes <= 0 && mm <= 0) {
                Util.showTip($('#submitTip'), "你已超时，将不能再提交", 'alert alert-danger');
                $("#count-down").text(0);
                return;
            }
            setTimeout(countDown, 1000);
        }

        function formatDuring(mss) {
            days = parseInt(mss / (1000 * 60 * 60 * 24));
            //当大于24小时，依然全显示
            //hours = parseInt((mss % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            hours = parseInt(mss / (1000 * 60 * 60));
            minutes = parseInt((mss % (1000 * 60 * 60)) / (1000 * 60));
            //minutes = parseInt(mss / (1000 * 60));
            var seconds = parseInt((mss % (1000 * 60)) / 1000);
            mm = parseInt(mss % 1000);
            var mmmin = get3zf(mm);
            return getzf(hours) + ":" + getzf(minutes) + ":"
                    + getzf(seconds);
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

        //补0操作
        function getzf(num) {
            if (parseInt(num) < 10) {
                num = '0' + num;
            }
            return num;
        }

        function get3zf(num) {
            if (num < 10)
                num = '00' + num;
            else if (num < 100)
                num = '0' + num;
            return num;
        }

        function changeProgress(t) {
            $('#min-progress').text(t);
            $('#min-progress').css("width", t);
        }
    });
    var score = 0;
    function validateComment(data) {
        return data.length <= 200;
    }
    function postReply() {
        reply['answers'] = JSON.stringify(answers);
        $.ajax({
            url: "${staticServePath}/test/postReply",
            type: "post",
            data: reply,
            success: function (data, status) {
                if (data.state == 'success') {
                    Util.showTip($('#submitTip'), data.msg, 'alert alert-success', {
                        complete: function () {
                            window.location.href = "${staticServePath}/";
                        },
                        time: 1000
                    });
                }
                else if (data.state == 'error') {
                    Util.showTip($('#submitTip'), data.msg, 'alert alert-warning');
                }
            }, error: function () {
                Util.showTip($('#submitTip'), '提交失败，服务器错误', 'alert alert-warning');
            },
            complete: function () {

            }
        });
    }
</script>

</body>
</html>