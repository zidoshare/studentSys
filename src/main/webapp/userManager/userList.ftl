<div class="modal fade" id="addUserModel" tabindex="-1" role="dialog" aria-labelledby="addUserModelLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">添加用户信息</h4>
            </div>
            <div class="modal-body">
                <form id="user" role="form" class="form-horizontal">
                    <div class="form-group">
                        <label for="userAccount" class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user.userAccount" id="userAccount"
                                   placeholder="账号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user.userPassword" id="userPassword"
                                   placeholder="密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userNickname" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user.userNickname" id="userNickname"
                                   placeholder="名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userRole" class="col-sm-2 control-label">角色</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="user.userRole" id="userRole">
                            <#list roles as role>
                                <option value="${role.id}">${role.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userRole" class="col-sm-2 control-label">负责区域</label>
                        <div class="col-sm-10">
                                <select id="regionList" name="user.regionData" class="selectpicker form-control" multiple data-live-search="false">
                                    <#if regionList??>
                                        <#list regionList as region>
                                            <option value="${region.id}">${region.regionName}</option>
                                        </#list>
                                    </#if>
                                </select>
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="userCreateTime" class="col-sm-2 control-label">createTime</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user.userCreateTime" id="userCreateTime"
                                   placeholder="创建时间" disabled>
                        </div>
                    </div>
                    <div class="form-group sr-only">
                        <label for="operater" class="col-sm-2 control-label">operater</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="role.operater" id="operater" placeholder="创建者"
                                   value="${user.userNickname}"
                                   disabled>
                        </div>
                    </div>

                </form>
                <div class="tip-container">
                    <div class="tip" id="saveUserTip" aria-label="0">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button data-style="slide-up" id="saveUser-btn" class="btn btn-primary ladda-button"
                        onclick="func.addUser('up')">
                    <span class="ladda-label">保存</span>
                </button>
            </div>
        </div>
    </div>
</div>
<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item" id="table-inner">
            <div class="panel-heading title">
            ${view.title}
            <#--<a class="btn btn-success pull-right" href="/user/addUser">
                用户
                <i class="glyphicon glyphicon-plus"></i>
            </a>-->
                <div class="pull-right btn-group">
                <#assign updateAble = false>
                <#assign deleteAble = false>
                <#list map["operators"+view.id] as op>
                    <a onclick="func.${op.url}('show');" class="btn btn-success btn-sm">${op.title}</a>
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

                <ul id="tables" class="nav nav-tabs">
                <#list roles as role>
                    <li <#if role_index == 0>class="active"</#if>>
                        <a href="#${role.name}" data-toggle="pill">
                        ${role.name}列表
                        </a>
                    </li>
                </#list>

                <#--<li>
                    <a href="#teacher" data-toggle="pill">
                        教师列表
                    </a>
                </li>
                <li>
                    <a href="#consultant"
                       data-toggle="pill">咨询师列表
                    </a>
                </li>
                <li>
                    <a href="#manager" data-toggle="pill">管理员列表</a>
                </li>-->
                </ul>
                <div id="tablesContent" class="tab-content">
                <#list roles as role>
                    <div class="tab-pane fade in <#if role_index == 0>active</#if>" id="${role.name}">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>
                                        账户名
                                    </th>
                                    <th>
                                        名字
                                    </th>
                                    <th>
                                        创建时间
                                    </th>
                                    <th>
                                        用户最后登录ip
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                    <#list roleMap[role.name] as user >
                                    <tr>
                                        <td>
                                        ${user.userAccount}
                                        </td>
                                        <td>
                                        ${user.userNickname}
                                        </td>
                                        <td>
                                        ${(user.userCreateTime?number)?number_to_date}
                                        </td>
                                        <td>
                                            0.0.0.0
                                        </td>
                                    </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </#list>
                </div>

            </div>
        </div>
    </div>
</div>