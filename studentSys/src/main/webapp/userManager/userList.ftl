<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item">
            <div class="panel-heading title">
            ${view.title}
                <div class="pull-right btn-group">
                <#list map["operators"+view.id] as op>
                    <a href="${op.url}" class="btn btn-success btn-sm">${op.title}</a>
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
                    <div class="tab-pane fade in active" id="${role.name}">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <th>
                                    姓名
                                </th>
                                <th>
                                    班级
                                </th>
                                <th>
                                    辅导老师
                                </th>
                                <th>
                                    学习科目
                                </th>
                                <th>
                                    联系方式
                                </th>
                                <th>
                                    入学时间
                                </th>
                                <th>
                                    学分
                                </th>
                                <th>
                                    成绩
                                </th>
                                <th>
                                    状态
                                </th>
                                <th>
                                    就业跟踪
                                </th>
                                <th>
                                    用户创建时间
                                </th>
                                <th>
                                    最后登录ip
                                </th>
                                <th>
                                    操作
                                </th>
                                <th>
                                    操作人
                                </th>
                                </thead>
                            </table>
                        </div>
                    </div>
                </#list>
                    <#--<div class="tab-pane fade in active" id="student">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <th>
                                    姓名
                                </th>
                                <th>
                                    班级
                                </th>
                                <th>
                                    辅导老师
                                </th>
                                <th>
                                    学习科目
                                </th>
                                <th>
                                    联系方式
                                </th>
                                <th>
                                    入学时间
                                </th>
                                <th>
                                    学分
                                </th>
                                <th>
                                    成绩
                                </th>
                                <th>
                                    状态
                                </th>
                                <th>
                                    就业跟踪
                                </th>
                                <th>
                                    用户创建时间
                                </th>
                                <th>
                                    最后登录ip
                                </th>
                                <th>
                                    操作
                                </th>
                                <th>
                                    操作人
                                </th>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="teacher">
                        <div class="table-responsive">

                            <table class="table">
                                <thead>
                                <th>
                                    姓名
                                </th>
                                <th>
                                    管理班级
                                </th>
                                <th>
                                    教学科目
                                </th>
                                <th>
                                    联系方式
                                </th>
                                <th>
                                    入职时间
                                </th>
                                <th>
                                    用户创建时间
                                </th>
                                <th>
                                    最后登录ip
                                </th>
                                <th>
                                    操作
                                </th>
                                <th>
                                    操作人
                                </th>
                                </thead>
                            </table>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="consultant">
                        <div class="table-responsive">

                            <table class="table">
                                <thead>
                                <th>
                                    姓名
                                </th>
                                <th>
                                    报名学生
                                </th>
                                <th>
                                    学生所在班级
                                </th>
                                <th>
                                    联系方式
                                </th>
                                <th>
                                    入职时间
                                </th>
                                <th>
                                    用户创建时间
                                </th>
                                <th>
                                    最后登录ip
                                </th>
                                <th>
                                    操作
                                </th>
                                <th>
                                    操作人
                                </th>
                                </thead>
                            </table>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="manager">
                        <div class="table-responsive">

                            <table class="table">
                                <thead>
                                <th>
                                    姓名
                                </th>
                                <th>
                                    联系方式
                                </th>
                                <th>
                                    用户创建时间
                                </th>
                                <th>
                                    最后登录ip
                                </th>
                                <th>
                                    操作
                                </th>
                                </thead>
                            </table>
                        </div>
                    </div>-->

                </div>
            </div>
        </div>
    </div>
</div>