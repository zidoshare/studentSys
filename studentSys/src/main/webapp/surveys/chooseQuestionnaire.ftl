<#--<#include "../macro-head-single.ftl">-->
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="modal fade text-info" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">选择试卷</h4>
            </div>
            <div class="modal-body">
                <table class="table text-success table-striped table-hover" id="ids">
                    <tr id="head">
                        <th>
                            选择
                        </th>
                        <th>
                            调查者
                        </th>
                        <th>
                            调查时长
                        </th>
                    </tr>
                <#list questionnaires as questionnaire>
                    <tr>
                        <th>
                            <input type="checkbox" id="${questionnaire.id}"/>
                        </th>
                        <th>
                        ${questionnaire.toUser}
                        </th>
                        <th>
                        ${questionnaire.date}分钟
                        </th>
                    </tr>
                </#list>
                </table>
            </div>
            <div class="modal-footer">
                <button data-style="slide-up" id="save-btn" class="btn btn-success ladda-button"
                        data-spinner-color="#75d9b7"
                        data-size="s" tabindex="10" onclick="start(${code})">
                    <span class="ladda-label">开始调查</span>
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

</script>
</body>
</html>