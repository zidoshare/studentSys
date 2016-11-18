<a class="btn pull-right" onclick="closeResults()">&times;</a>
<div class="panel-body">
    <div id="dataTables-example_wrapper" class="table-responsive" role="grid">
        <table class="table"
               id="dataTables-example" aria-describedby="dataTables-example_info">
            <thead>
            <tr>
                <td>学生名字</td>
                <td>状态</td>
                <td>分数</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <#list replies as reply>
            <tr id="${reply.id}">
                <td>${studentMap["${reply.id}"].name}</td>
                <td class="state"><#if reply.correcting == 0><span class="text-danger">未批改</span>
                    <#else>
                        <span class="text-success">已批改</span>
                </#if></td>
                <td class="score">${reply.score}</td>
                <td><a class="res" href="javascript:void(0)" onclick="showModal(${studentMap["${reply.id}"].id})">阅卷</a></td>
            </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    function showModal(studentId){

        var dom = $('#modal-content');
        dom.removeClass('sr-only');
        loadResult(dom,"${staticServePath}/test/showCorrecting/${testQuestionnaireClass.id}-"+studentId+'-true');
        $('#modal').modal('show');
    }
    function closeResults(){
        $('.tr-show').addClass('sr-only');
    }
</script>