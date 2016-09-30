<!DOCTYPE html>
<html>
<head>
    <title>统计</title>
</head>
<body>

<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover ">
        <tr>
            <th>班级</th>
            <th>调查对象</th>
            <th>创建时间</th>
            <th>结束时间</th>
        </tr>
    <#list questionnaires.list as questionnaire>
        <tr data-label="open-check" id="${questionnaire.id}">
            <td>${questionnaire.className}</td>
            <td>${questionnaire.toUser}</td>
            <td>${(questionnaire.date?number)?number_to_datetime}</td>
            <td>${(questionnaire.endTime?number)?number_to_datetime}</td>
        </tr>
    </#list>
    </table>
</div>

<#--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    Launch demo modal
</button>

<!-- Modal &ndash;&gt;
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>-->
<div class="modal fade text-info" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="check">

        </div>
    </div>
</div><script type="text/javascript">
    $('tr[data-label="open-check"]').on("click", function () {
        loadResult($(this).attr('id'));
    });
</script>
</body>
</html>