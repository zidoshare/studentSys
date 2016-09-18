<!DOCTYPE html>
<!--suppress ALL -->
<html lang="zh_cn">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width" name="viewport">
    <title>问卷调查</title>
    <link href="${staticServePath}/static/css/css.css" rel="stylesheet">
    <link href="${staticServePath}/static/css/base.css" rel="stylesheet">
    <script src="${staticServePath}/static/js/lib/jquery-3.1.0.min.js"></script>
    <script src="${staticServePath}/static/js/lib/icheck.min.js"></script>
    <script src="${staticServePath}/static/js/lib/jquery.transit.js"></script>
</head>
<body>
<div class="wrapper" id="wrapper">
<#if questionnaires?size gt 0 >
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
            <h1>学员调查问卷</h1>
            <h4 class="survey_summary">
                <span style="color: red">提示:</span>
                "本问卷是一份用于了解在线学习情况的问卷，调查结果只会用于学术研究，我们保证不会对您的生活与学习带来任何的负面影响。希望您能抽出一点您宝贵的时间，帮我们填答一份问卷。我们非常感谢您的支持！
                "
            </h4>
        </div>
        <#list questionnaires as questionnaire>
            <form method="get" id="questionnaire${questionnaire.id}">
                <h1 class="survey_to_title">${questionnaire.toUser}满意度调查</h1>
                <ul class="subject_list">
                    <#list questionnaire.questionnaireNodeList as questionnaireNode>
                        <li class="subject_big">
                            <h3>${questionnaireNode.questionBigType.name}</h3>
                        </li>
                        <#list questionnaireNode.questionsList as question>
                            <li class="subject"
                                id="${questionnaire.id}T${questionnaireNode.questionBigType.id}T${question.id}"
                                aria-label="0">
                                <h4 class="subject_title">${question.title}</h4>
                                <#list question.questionsNodes as node>
                                    <label class="subject_option">
                                        <input name="${questionnaire.id}T${questionnaireNode.questionBigType.id}T${question.id}"
                                               id="${questionnaire.id}T${questionnaireNode.questionBigType.id}T${question.id}T${node.score}"
                                               type="radio" name="iCheck" value="${node.score}">
                                    ${node.select}
                                    </label>
                                </#list>
                            </li>
                        </#list>
                    </#list>
                </ul>
                <div class="tip-container">
                <textarea class="comment" name="comment" id="${questionnaire.id}comment" rows="10" tabindex="4"
                          placeholder="输入评论内容...字数在两百字以内" aria-label="0"></textarea>
                    <div class="absolute" id="${questionnaire.id}commentTip"
                         style="right: 0px;bottom: 10px;color: #8b5e21;font-size:12px;">剩余<font id="wnum">0</font>字
                    </div>
                </div>

            </form>
        </#list>
        <div style="text-align: right">
            <button class="submit" type="submit" onclick="postReply()">提交</button>
        </div>
    </div>
<#else>
    <h2 style="text-align: center;">可能调查尚未开始或你所属班级没有调查</h2>
</#if>

</div>
<script type="text/javascript" src="${staticServePath}/static/js/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="${staticServePath}/static/js/common.js"></script>
<script>

    var progressFlag;
    var proccer = 0;
    var max = 0;
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
    <#list questionnaires as questionnaire>
        var start = ${questionnaire.date};
        var end = ${questionnaire.endTime};
        progressFlag = ${questionnaire.id};
        getMyDate(new Date(${questionnaire.date})) + "   " + getMyDate(${questionnaire.endTime});
        $('#start-time').text(getMyDate(start));
        $('#end-time').text(getMyDate(end));
        $('#now').text(getMyDate(new Date().getTime()));
        var time = ${questionnaire.endTime?number}-new Date().getTime();
        formatDuring(time);
        countDown();
        <#break >
    </#list>
        $('#count').transition({opacity: 1, top: 0}, 1000);

        if (check()) {
            //读取内容并初始化进度
            proccer = readReply();
            max = $('li.subject').length + 2;
            changeProgress(parseFloat((proccer / max * 100)).toFixed(2) + "%");
            $("label").on("click", saveReply);
            $("ins").on("click", saveReply);
            $('textarea').on('input propertychange', saveReply);
        }
        var minutes;
        var mm;

        function countDown() {
            var now = new Date().getTime();
            $("#count-down").text(formatDuring(end - now));
            if (minutes <= 0 && mm <= 0) {
                Util.showTip($('#submitTip'), "你已超时，将不能再提交");
                $("#count-down").text(0);
                code = 0;
                return;
            }
            setTimeout(countDown, 100);
        }

        function formatDuring(mss) {
            var days = parseInt(mss / (1000 * 60 * 60 * 24));
            var hours = parseInt((mss % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
//            var minutes = parseInt((mss % (1000 * 60 * 60)) / (1000 * 60));
            minutes = parseInt(mss / (1000 * 60));
            var min = getzf(minutes);
            var seconds = parseInt((mss % (1000 * 60)) / 1000);

            mm = parseInt(mss % 1000);
            var mmmin = get3zf(mm);
            return min + " 分 "
                    + mmmin + " 毫秒 ";
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
            $.cookie("" + progressFlag, proccer, {expires: 1});
        }

        function changeMax(ta) {
            var tip = $('#' + ta.attr('id') + 'Tip');
            var num = 200 - ta.val().length;
            if (num > 0)
                tip.html('剩余<span>' + num + '</span>字');
            else
                tip.html('剩余<span class="text-danger">' + num + '</span>字');
        }

        function saveReply() {

            if ($(this).is('textarea')) {
                var x = $(this).val();
                changeMax($(this));
                if ($(this).val().length >= 200) {
                    x = x.substr(0, 200);
                    Util.showTip($('#submitTip'), '评论长度大于200,将无法提交，并且下次保存仅保存前<font color="red" size="5">200</font>字', 'alert alert-warning');
                }
                $.cookie($(this).attr('id'), x, {expires: 1});
                if ($(this).attr('aria-label') == 0) {
                    $(this).attr('aria-label', 1);
                    proccer++;
                    changeProgress(parseFloat((proccer / max * 100)).toFixed(2) + "%");
                }
                else if ($(this).attr('aria-label') == 1 && $(this).val() == '') {
                    $(this).attr('aria-label', 0);
                    proccer--;
                    changeProgress(parseFloat((proccer / max * 100)).toFixed(2) + "%");
                }
                return;
            }
            var radio;
            if ($(this).is('ins'))
                radio = $(this).prev();
            else if ($(this).is('label'))
                radio = $(this).find('input:radio').first();
            if (radio.attr('aria-label') == 0) {
                radio.attr('aria-label', 1);
            }

            if (radio != null) {
                var label = radio.parent().parent();
                label.siblings('label').find('input').each(function (index, dom) {
                    $.cookie($(this).attr('id'), null);
                });
                if (radio.prop('checked') == true)
                    $.cookie(radio.attr('id'), true, {expires: 1});
                else if (radio.prop('checked') == false)
                    $.cookie(radio.attr('id'), null);
                var li = label.parent();
                if (li.attr('aria-label') == 0) {
                    changeProgress(parseFloat(((++proccer) / max * 100)).toFixed(2) + "%");
                    li.attr('aria-label', 1);
                }
            }

            /*$('input:radio').each(function (index, domEle) {
                var id = $(this).attr("id");

                $.cookie(id, $(this).prop("checked"), {expires: 1});
            });
            $('textarea').each(function (index, domEle) {
                var id = $(this).attr("id");
                $.cookie(id, $(this).val(), {expires: 1});
            });*/
        }

        function readReply() {
            $('input:radio').each(function (index, domEle) {
                var id = $(this).attr("id");
                if ($.cookie(id) == 'true') {
                    $(this).prop("checked", true);
                    $(this).parent().addClass("checked");
                    $(this).parent().parent().parent().attr('aria-label', 1);
                }
            });
            $('textarea').each(function (index, domEle) {
                var id = $(this).attr("id");

                if ($.cookie(id) != null && $.cookie(id) != '') {
                    $("#" + id).val($.cookie(id));
                    $(this).attr('aria-label', 1);
                }
                changeMax($(this));
            });
            var p = $.cookie("" + progressFlag);
            if (p == null)
                p = 0;
            return p;
        }

        function check() {
            if (window.navigator.cookieEnabled) {
                return true;
            }

            else {
                alert("浏览器配置错误，cookie不可用！");
                return false;
            }
        }
    });
    var code = '${code}';
    var score = 0;
    function validateComment(data) {
        return data.length <= 200;
    }
    $('textarea').on('input propertychange', validate);
    function postReply() {
        if (proccer < max) {
            Util.showTip($('#submitTip'), '你尚未完成调查表，不能提交！', 'alert alert-warning');
            return;
        }
        var mode;
        var btn;
    <#list questionnaires as questionnaire>
        if (!validateComment($("#${questionnaire.id}comment").val())) {
            Util.showTip($('#submitTip'), '${questionnaire.toUser}调查表的评论长度应在200字以内！', 'alert alert-warning');
            return;
        }
    </#list>
    <#list questionnaires as questionnaire>
        mode = {
            "questionnaireResult.id_user": "${user.name}",
            "questionnaireResult.id_questionnaire": "${questionnaire.id}",
            "questionnaireResult.comment": $("#${questionnaire.id}comment").val()
        };
        var reply = new Array();
        var i = 0;
        score = 0;
        $("#questionnaire${questionnaire.id}").find('input:radio').each(function (index, domEle) {
            if ($(this).prop("checked") == true) {
                var id = $(this).attr("id");
                var index = id.lastIndexOf("T");
                var front = id.substr(0, index);
                var behind = id.substr(index, id.length - 1);
                var rp = $.parseJSON("{\"" + front + "\":\"" + behind + "\"}");
                reply[i++] = rp;
                score += Number($(this).val());

            }
        });
        reply[i++] = $.parseJSON("{\"score\":\"" + score + "\"}");
        mode["questionnaireResult.questions_reply"] = JSON.stringify(reply);

        $.ajax({
            url: "/postQresult/" + code,
            type: "post",
            data: mode,
            success: function (data, textstatus) {
                if (data.state == 'success') {
                    Util.showTip($('#submitTip'), '${questionnaire.toUser}情况调查表 ' + data.msg, 'alert alert-success');
                    setTimeout(function () {
                        window.location.href = "/";
                    }, 1000);
                }
                if (data.state == 'error') {
                    Util.showTip($('#submitTip'), '${questionnaire.toUser}情况调查表 ' + data.msg, 'alert alert-success');
                }
            }, error: function () {
                Util.showTip($('#submitTip'), '${questionnaire.toUser}情况调查表 提交失败', 'alert alert-success');
            },
            complete: function () {

            }
        });
    </#list>
    }
</script>

</body>
</html>