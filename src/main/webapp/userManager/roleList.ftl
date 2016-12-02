<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item" id="chart-inner">
            <div class="panel-heading title">
            ${view.title}
            <#--<a class="btn btn-success pull-right" href="/user/addUser">
                添加角色
                <i class="glyphicon glyphicon-plus"></i>
            </a>-->
                <div class="pull-right btn-group">
                <#assign updateAble = false>
                <#assign deleteAble = false>
                <#list map["operators"+view.id] as op>
                <#--<a onclick="func.${op.url}('show');" class="btn btn-success btn-sm">${op.title}</a>-->
                    <#if op.title=="编辑">
                        <#assign updateAble = true>
                    </#if>
                    <#if op.title == "删除">
                        <#assign deleteAble = true>
                    </#if>
                </#list>
                </div>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>角色名
                            </th>
                            <th>
                                人数
                            </th>
                            <th>创建时间
                            </th>
                            <th>操作人
                            </th>
                        <#if updateAble || deleteAble>
                            <th>
                                操作
                            <#--<div class="checkbox3 checkbox-round">
                                <input type="checkbox" id="all-check">
                                <label for="all-check" class="td-check center-block">
                                    全选
                                </label>
                            </div>-->
                            </th>
                        </#if>
                        </tr>
                        </thead>
                        <tbody>
                        <#list roles as role>

                        <tr class="gradeA odd" id="${role.id}">
                            <td class="sorting_1" aria-label="name">${role.name}</td>
                            <td class=" " aria-label="memberCnt">${role.memberCnt}</td>
                            <td class="" aria-label="createTime"><#if role.createTime??>${(role.createTime?number)?number_to_datetime}<#else>
                                未记录</#if></td>
                            <td class=" " aria-label="oprater"><#if role.operater??>${role.operater}<#else>未记录</#if></td>
                            <#if updateAble || deleteAble>
                                <td>
                                    <#list map["operators"+view.id] as op>
                                        <#if op_index != 0>/</#if>
                                        <a onclick="func.${op.url}('show','${role.id}');" class="res">${op.title}</a>
                                    </#list>
                                <#--<div class="checkbox3 checkbox-round">
                                    <input type="checkbox" id="checkbox-2">
                                    <label for="checkbox-2" class="td-check center-block">
                                    </label>
                                </div>-->
                                </td>
                            </#if>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">信息录入</h4>
            </div>
            <div class="modal-body">
                <form id="role" role="form" class="form-horizontal">
                    <div class="form-group">
                        <label for="role.name" class="col-sm-2 control-label">角色名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="role.name" id="role.name" placeholder="角色名">
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="createTime" class="col-sm-2 control-label">createTime</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="role.createTime" id="createTime"
                                   placeholder="角色名" disabled>
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="id" class="col-sm-2 control-label">id</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="role.id" id="id"
                                   placeholder="id" disabled>
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="treeData" class="col-sm-2 control-label">treeData</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="role.treeData" id="treeData" placeholder="角色名"
                                   disabled>
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="operater" class="col-sm-2 control-label">operater</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="role.operater" id="operater" placeholder="操作人"
                                   value="${user.userNickname}"
                                   disabled>
                        </div>
                    </div>
                </form>
                <div class="checkbox3 checkbox-round sr-only">
                    <input type="checkbox" data-arialabel="1" checked name="${root.id}" id="${root.id}">
                    <label for="${root.id}">
                    </label>
                </div>
                <div id="permissions"
                     style="/*display: none;*//*height:${root.childCount * 40}px;*/overflow-y:auto;overflow-x:hidden; "></div>
                <div class="tip-container">
                    <div class="tip" id="saveRoleTip" aria-label="0">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button data-style="slide-up" id="saveRole-btn" class="btn btn-primary ladda-button"
                        onclick="func.addRole('up')">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('input[data-arialabel="1"]').change(function () {
                if ($(this).prop('checked')) {
                    var id = $(this).attr('id');
                    func.showPermissions(id, 'permission' + id);
                }
            }
    );
</script>