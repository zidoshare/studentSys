<!DOCTYPE html>
<!--suppress ALL -->
<html lang="zh_cn">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width" name="viewport">
    <link href="${staticServePath}/static/css/css.css?${staticResourceVersion}" rel="stylesheet">
    <script src="${staticServePath}/static/js/lib/icheck.min.js?${staticResourceVersion}"></script>
</head>
<body>
<div class="wrapper" id="wrapper">
    <div class="survey_title">
        <h1 align="center">123456</h1>
        <h4 class="survey_summary">
            <span style="color: red">试卷提示:</span>
            123456
        </h4>
        <h4>总分:<span id="preview_score" class="text-danger">${score}</span></h4>
    </div>
    <ul class="subject_list">
    <#assign index = 0>
    <#assign bigNumber = ["一","二","三","四","五","六","七","八","九","十"]>
    <#assign xx = ['A','B','C','D','E','F','G']>
        <form class="form-inline" role="form">
        <#list types as tp>
            <li class="subject_big">
                <h3>${bigNumber[tp_index]}、${tp.typeName}</h3>
            </li>
            <#list questionMap[tp.id+""] as question>
                <li class="subject"
                    id="${question.id}"
                    aria-label="0">
                    <#assign index++>
                    <h4 class="subject_title">${index}、${question.testQuestionTitle}·<label
                            for="questionScore${question.id}">分数：</label><input id="${question.id}"
                                                                                class="form-control que"
                                                                                style="width:100px" type="number"
                                                                                value="<#if scoreMap["${question.id}"]??>${scoreMap["${question.id}"]}<#else>${question.testQuestionDefaultScore}</#if>"/>
                    </h4>
                    <#if (question.testQuestionContent?eval)?size gt 0>
                        <#list question.testQuestionContent?eval as node>
                            <label class="subject_option">
                                <input class="iCheck" type="radio" name="iCheck" disabled>
                            ${xx[node_index]}、${node}
                            </label>
                        </#list>
                    <#else>
                        <textarea class="comment" rows="10" tabindex="4"
                                  placeholder="答案"></textarea>

                    </#if>
                </li>
            </#list>
        </#list>
        </form>
    </ul>

</div>
<script>

    var progressFlag;
    var proccer = 0;
    var max = 0;
    $(document).ready(function () {
        $('input.iCheck').iCheck({
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
        $('input[type=number]').on('input onpropertychange',function(){
            var score = 0;
            $('input.que').each(function(index,dom){
                if(Validate.isNum($(dom).val())){
                    score+=parseInt($(dom).val());
                }
            });
            $('#preview_score').html(score);
        });
    });

</script>

</body>
</html>