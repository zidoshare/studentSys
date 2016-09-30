<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div class="modal-header">
    <h4 class="modal-title" id="myModalLabel">${questionnaire.toUser}调查表统计 平均分${avg} 人数${results?size}</h4>
</div>
<div class="modal-body">
    <div class="table-responsive">
        <table class="table text-success table-striped table-hover" id="ids">
            <tr id="head">
                <th>
                    ip
                </th>
                <th>
                    评分
                </th>
                <th>
                    评价
                </th>
            </tr>
        <#list results as result>
            <tr id= "${result.id}" data-label="open-count">
                <th>
                ${result.idUser}
                </th>
                <th>
                ${result.count}
                </th>
                <th>
                    <#if result.comment??>
                ${result.comment}
                </#if>
                </th>
            </tr>
        </#list>
        </table>
    </div>
</div>
<div class="modal-footer">
</div>
<script type="text/javascript">
    $('tr[data-label="open-count"]').on('click', function () {
        window.open("/surveys/result/" + $(this).attr('id'));
    });
</script>
</body>
</html>