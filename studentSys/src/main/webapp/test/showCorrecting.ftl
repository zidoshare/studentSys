<link href="${staticServePath}/static/css/css.css?${staticResourceVersion}" rel="stylesheet">
<script src="${staticServePath}/static/js/lib/icheck.min.js?${staticResourceVersion}"></script>

<div class="wrapper cs-wrapper" id="wrapper">
    <div class="big-container">
        <div class="tip" id="submitTip" aria-label="0">
        </div>
    </div>
    <div class="tip" id="postTip"></div>

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
                                <label class="subject_option">
                                    <input class="iCheck" id="${question.id}S${node_index}" type="radio"
                                           name="${question.id}" value="${node_index}">
                                ${xx[node_index]}、${node}
                                </label>
                            </#list>
                        <#else>
                            <#list question.testQuestionContent?eval as node>
                                <label class="subject_option">
                                    <input class="iCheck" id="${question.id}S${node_index}" type="checkbox"
                                           name="${question.id}" value="${node?index}">
                                ${xx[node_index]}、${node}
                                </label>
                            </#list>
                        </#if>

                    <#else>
                        <textarea class="comment" rows="10" tabindex="4"
                                  placeholder="答案" id="${question.id}S0"></textarea>
                    </#if>
                </li>
            </#list>
        </#list>
        </ul>
    </form>
    <div style="text-align: right">
        <button class="submit" type="submit" onclick="/*postReply()*/">提交</button>
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

        //读取内容并初始化进度
        readAnswers();
        max = ${questionSize};
        $('input').on('ifChecked', addValue);
        $('input').on('ifUnchecked', removeValue);
        $('textarea').on('input propertychange', addText);

        function readAnswers() {
            console.log('read');
            var x = 0;
            $('#questionnaire${questionnaire.id}').find('input,textarea').each(function (index, dom) {
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
            });
            return x;
        }

        function addText() {
            var val = $(this).val();
            var parent = $(this).parent();
            if (val != null && val != '') {
                answers[$(this).attr('id')] = val;
                var data = parseInt(parent.attr('data-label'));
                parent.attr('data-label', 1);
                if (val.length > 0 && data == 0) {
                    changeProgress(parseFloat((++proccer / max * 100)).toFixed(2) + "%");
                }
            }

            else {
                delete answers[$(this).attr('id')];
                var parent = $(this).parent();
                var data = parseInt(parent.attr('data-label'));
                parent.attr('data-label', 0);
                if (val.length == 0 && data == 1) {
                    changeProgress(parseFloat((--proccer / max * 100)).toFixed(2) + "%");
                }
            }

        }

        function addValue() {
            answers[$(this).attr('id')] = "checked";
            var parent = $(this).parent().parent().parent();
            var data = parseInt(parent.attr('data-label'));
            parent.attr('data-label', data + 1);
            if (data + 1 == 1) {
                changeProgress(parseFloat((++proccer / max * 100)).toFixed(2) + "%");
            }
        }

        function removeValue() {
            delete answers[$(this).attr('id')];
            var parent = $(this).parent().parent().parent();
            var data = parseInt(parent.attr('data-label'));
            parent.attr('data-label', data - 1);
            if (data - 1 <= 0) {
                changeProgress(parseFloat((--proccer / max * 100)).toFixed(2) + "%");
            }
        }

        function changeProgress(t) {
            $('#min-progress').text(t);
            $('#min-progress').css("width", t);
        }
    });
    var score = 0;
</script>