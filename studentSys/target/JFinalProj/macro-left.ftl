<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse tip-container top-container">
        <div class="purikura center-block"></div>
        <div class="text-center">
            <span class="bottom-border tip-container">
                <a class="h3" href="">admin</a>
                <i class="fa fa-edit text-success"></i>
            </span>
            <p style="padding-top:0;">
                <a><small>基本信息</small></a>
                &nbsp;
                <a><small>退出</small></a>
            </p>

        </div>
    </div>
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">

            <#list sides as side>
                <li>
                        <a href="${side.url}"><i class="${side.icon}"></i>${side.title}</a>
                </li>
            </#list>

            <#--<li>
                <a class="active-menu" href="index.html"><i class="fa fa-dashboard"></i> Dashboard</a>
            </li>
            <li>
                <a href="ui-elements.html"><i class="fa fa-desktop"></i> UI Elements</a>
            </li>

            <li>
                <a href="#"><i class="fa fa-sitemap"></i> Charts<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li>
                        <a href="chart.html">Charts JS</a>
                    </li>
                    <li>
                        <a href="morris-chart.html">Morris Chart</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="tab-panel.html"><i class="fa fa-qrcode"></i> Tabs &amp; Panels</a>
            </li>

            <li>
                <a href="table.html"><i class="fa fa-table"></i> Responsive Tables</a>
            </li>
            <li>
                <a href="form.html"><i class="fa fa-edit"></i> Forms </a>
            </li>


            <li>
                <a href="#"><i class="fa fa-sitemap"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li>
                        <a href="#">Second Level Link</a>
                    </li>
                    <li>
                        <a href="#">Second Level Link</a>
                    </li>
                    <li>
                        <a href="#">Second Level Link<span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level collapse">
                            <li>
                                <a href="#">Third Level Link</a>
                            </li>
                            <li>
                                <a href="#">Third Level Link</a>
                            </li>
                            <li>
                                <a href="#">Third Level Link</a>
                            </li>

                        </ul>

                    </li>
                </ul>
            </li>
            <li>
                <a href="empty.html"><i class="fa fa-fw fa-file"></i> Empty Page</a>
            </li>-->
        </ul>

    </div>

</nav>