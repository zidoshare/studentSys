<#include "../macro-paginate.ftl">
<div>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span
                aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">申请详情:${className}</h4>
    </div>
    <div class="modal-body">
        <div id="dataTables-list" class="table-responsive dataTables_wrapper form-inline" role="grid">
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                   id="dataTables-example" aria-describedby="dataTables-example_apply">
                <thead>
                <tr>
                    <th>
                        姓名
                    </th>
                    <th>
                        补助金额
                    </th>
                    <th>
                        剩余补助次数
                    </th>
                    <th>
                        奖金
                    </th>
                    <th>
                        就读状态
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list classInfoList as classInfoList>
                    <tr>
                        <td>
                            ${classInfoList.studentName}
                        </td>
                        <td class=" z-money-cny">
                            ${classInfoList.subsidyAmount}
                        </td>
                        <td >
                            ${classInfoList.residualFrequency}
                        </td>
                        <td class=" z-money-cny">
                            ${classInfoList.bonus}
                        </td>
                        <td>
                            ${classInfoList.status}
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    <div class="modal-footer center-pill text-center">
        <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary ">同意</button>
    </div>
</div>
