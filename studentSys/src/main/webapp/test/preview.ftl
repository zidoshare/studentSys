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
    <h1 class="survey_to_title">试卷预览</h1>
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
                    <h4 class="subject_title">${index}、${question.testQuestionTitle}·<label for="questionScore${question.id}">分数：</label><input id="${question.id}"  class="form-control que" style="width:100px"
                                                                                           value="${question.testQuestionDefaultScore}"/></h4>
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
    });
    var score = 0;
</script>

</body>
</html>