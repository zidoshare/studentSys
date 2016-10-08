<#include "../macro-title.ftl">
<@title title="考勤记录列表"></@title>
<div class="row animate">
    <div class="col-md-12">
        <div class="panel panel-default item">
            <div class="panel-heading">
                <form class="clearfix">
                    <div class="input-group hdwx-input-sm pull-left">
                        <div class="btn-group input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false">
                                选择班级 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                        <label for="all-search" class="sr-only">search</label>
                        <input type="text" class="form-control" id="all-search" placeholder="学生...">
                <span class="input-group-btn">
                    <button type="button" class="btn btn-success">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>

                </span>
                    </div>
                    <button class="btn btn-success pull-right">添加考勤记录</button>
                </form>
            </div>


            <div class="panel-body">
                <div class="table-responsive">
                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer"
                               id="dataTables-example" aria-describedby="dataTables-example_info">
                            <thead>
                            <tr>
                                <th>班级</th>
                                <th>姓名</th>
                                <th>日期</th>
                                <th>联系方式</th>
                                <th>入学时间</th>
                                <th>迟到/请假/旷课时间</th>
                                <th>辅导老师</th>
                                <th>出勤</th>
                                <th>操作</th>
                                <th>操作人</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>nini</td>
                                <td>nini</td>
                                <td>nini</td>
                                <td>nini</td>
                                <td>nini</td>
                                <td>nini</td>
                                <td>nini</td>
                                <td>nini</td>
                                <td>查看</td>
                                <td>nini</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>