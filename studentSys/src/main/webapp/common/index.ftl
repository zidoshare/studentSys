<#include "../macro-head.ftl">
<!DOCTYPE HTML>
<html>
<head>
<@head title="首页">
    </@head>
</head>
<body>
<div class="wrapper">
<#include "../macro-left.ftl">
</div>
<div id="page-wrapper">

    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <form class="hdwx-input-lg center-block">
                            <label for="all-search" class="sr-only">search</label>
                            <div class="input-group">
                                <input type="text" class="form-control input-lg" id="all-search" placeholder="用户管理">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-success btn-lg">
                                        <i class="glyphicon glyphicon-search"></i>
                                        搜索
                                    </button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        快捷操作
                    </div>

                    <div class="panel-body">
                        <div class="row clearfix">
                            <div class="col-md-3 col-sm-6 col-xs-6 quick-container">
                                <a class="quick-btn bg-green" href="#">
                                    用户管理
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 quick-container">
                                <a class="quick-btn bg-green" href="#">
                                    用户管理
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 quick-container">
                                <a class="quick-btn bg-green" href="#">
                                    用户管理
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 quick-container">
                                <a class="quick-btn bg-green" href="#">
                                    用户管理
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        最新报名
                    </div>

                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                       id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example"
                                            rowspan="1" colspan="1" aria-sort="ascending"
                                            aria-label="Rendering engine: activate to sort column ascending"
                                            style="width: 168px;">姓名
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Browser: activate to sort column ascending"
                                            style="width: 260px;">性别
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 236px;">班级
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 142px;">课程
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="CSS grade: activate to sort column ascending"
                                            style="width: 100px;">报名时间
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="CSS grade: activate to sort column ascending"
                                            style="width: 100px;">咨询顾问
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="gradeA odd">
                                        <td class="sorting_1">Gecko</td>
                                        <td class=" ">Firefox 1.0</td>
                                        <td class=" ">Win 98+ / OSX.2+</td>
                                        <td class="center ">1.7</td>
                                        <td class="center ">A</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        统计
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="panel panel-default">
                                            <div class="panel-body easypiechart-panel">
                                                <h4>Profit</h4>
                                                <div class="easypiechart" id="easypiechart-blue" data-percent="82"><span
                                                        class="percent">82%</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="panel panel-default">
                                            <div class="panel-body easypiechart-panel">
                                                <h4>Sales</h4>
                                                <div class="easypiechart" id="easypiechart-orange" data-percent="55">
                                                    <span class="percent">55%</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="panel panel-default">
                                            <div class="panel-body easypiechart-panel">
                                                <h4>Customers</h4>
                                                <div class="easypiechart" id="easypiechart-teal" data-percent="84"><span
                                                        class="percent">84%</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="panel panel-default">
                                            <div class="panel-body easypiechart-panel">
                                                <h4>No. of Visits</h4>
                                                <div class="easypiechart" id="easypiechart-red" data-percent="46"><span
                                                        class="percent">46%</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <p>全勤</p>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40% Complete (success)</span>
                                    </div>
                                </div>
                                <p>请假</p>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        <span class="sr-only">20% Complete</span>
                                    </div>
                                </div>
                                <p>旷工</p>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                                <p>迟到</p>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>
</body>
</html>


<#include "../macro-foot.ftl">
