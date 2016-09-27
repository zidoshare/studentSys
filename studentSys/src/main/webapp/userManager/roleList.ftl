<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item">
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
                    <a onclick="func.${op.url}();" class="btn btn-success btn-sm">${op.title}</a>
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
                            <th>人数
                            </th>
                            <th>操作人
                            </th>
                        <#if updateAble || deleteAble>
                            <th>
                                <div class="checkbox3 checkbox-round">
                                    <input type="checkbox" id="all-check">
                                    <label for="all-check" class="td-check center-block">
                                        全选
                                    </label>
                                </div>
                            </th>
                        </#if>
                        </tr>
                        </thead>
                        <tbody>
                        <#list roles as role>

                        <tr class="gradeA odd">
                            <td class="sorting_1">${role.name}</td>
                            <td class=" ">${role.memberCnt}</td>
                            <td class=" ">Win 98+ / OSX.2+</td>

                            <#if updateAble || deleteAble>
                                <td>
                                    <div class="checkbox3 checkbox-round">
                                        <input type="checkbox" id="checkbox-2">
                                        <label for="checkbox-2" class="td-check center-block">
                                        </label>
                                    </div>
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
</div>