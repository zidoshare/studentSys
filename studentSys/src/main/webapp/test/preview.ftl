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
    <#list types as tp>
        <li class="subject_big">
            <h3>${tp.typeName}</h3>
        </li>
        <#list questionMap[tp.id+""] as question>
            <li class="subject"
                id="${question.id}"
                aria-label="0">
                <h4 class="subject_title">${question.testQuestionTitle}</h4>
                <#list question.testQuestionContent?eval as node>
                    <label class="subject_option">
                        <input type="radio" name="iCheck">
                    ${node}
                    </label>
                </#list>
            </li>
        </#list>
    </#list>
    </ul>

</div>
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
    });
    var score = 0;
</script>

</body>
</html>