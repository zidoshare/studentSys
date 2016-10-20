<a class="btn pull-right">&times;</a>
<div>
    <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
        <table class="table table-striped table-bordered table-hover dataTable no-footer"
               id="dataTables-example" aria-describedby="dataTables-example_info">
            <thead>
            <tr>
                <td>学生名字</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <#list replies as reply>
            <tr>
                <td>${studentMap["${reply.id}"].name}</td>
                <td><a class="res" href="javascript:void(0)" onclick="showModal(${studentMap["${reply.id}"].id})">阅卷</a></td>
            </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade bs-example-modal-lg" id = "modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">

        <div class="modal-content" id="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">hh</h3>
            </div>
            <div class="pan"></div>
            <div class="panel_loading">
                <img src="${staticServePath}/images/loading.gif" class="img-sm center-block"/>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function showModal(studentId){
        $('#modal').modal('show');
        var dom = $('#modal-content');
        dom.removeClass('sr-only');
        loadResult(dom,"${staticServePath}/test/showCorrecting/${testQuestionnaireClass.id}-"+studentId);
    }
</script>