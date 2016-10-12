
<div class="modal-header">
    <h4 class="modal-title" id="myModalLabel">${questionnaire.toUser}调查表统计 平均分${avg} 人数${results?size}</h4>
</div>
<div class="modal-body">
        <table class="table text-success table-striped table-hover" id="ids">
            <tr id="head">
                <th>
                    名字
                </th>
                <th>
                    评分
                </th>
            </tr>
        <#list results as result>
            <tr id="${result.id}" data-label="open-count" onclick="showAfter('${result.id}')">
                <td>
                ${result.idUser}
                </td>
                <td>
                ${result.count}
                </td>
            </tr>
            <tr class="sr-only pan">
                <td colspan="3">
                    <div class="panel panel-default">
                        <div class="panel-body" style="white-space:normal; width:100%;">
                            <label>评价:</label><a class="res pull-right" href="${staticServePath}/surveys/result/${result.id}" target="_blank">查看详情</a>
                            <#if result.comment??>
                                <p>
                                ${result.comment}
                                </p>
                            </#if>
                        </div>
                    </div>
                </td>
            </tr>
        </#list>
        </table>
</div>
<div class="modal-footer">
</div>
<script type="text/javascript">
    function showAfter(id) {
        $('#'+id).siblings('.pan').addClass('sr-only');
        $('#'+id).next().removeClass('sr-only');
    }
    /*$('tr[data-label="open-count"]').on('click', function () {
        $(this).after().removeClass('sr-only');
        //window.open("${staticServePath}/surveys/result/" + $(this).attr('id'));
    });*/
</script>