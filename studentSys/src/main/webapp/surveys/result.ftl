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
    <div class="container">
        <h1 class="survey_to_title">${questionnaire.toUser}满意度调查 · ${result.idUser} · ${result.count}</h1>
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
        </div>
    </div>

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
        var result = ${result.questionsReply};
        $('#count').transition({opacity: 1, top: 0}, 1000);
        for(var i = 0; i < result.length; i++){
            for(var key in result[i]){
                var str = key + result[i][key];
                $('#'+str).prop("checked", true);
                $('#'+str).parent().addClass("checked");
                $('#'+str).parent().parent().parent().attr('aria-label', 1);
            }
        }
        $('#${questionnaire.id}comment').val('${result.comment}');
    });
    var score = 0;
</script>

</body>
</html>