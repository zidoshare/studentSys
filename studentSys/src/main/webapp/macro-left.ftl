<nav class="navbar-default navbar-side sidebar-collapse" role="navigation">
    <div class="nav-btn">
        <i class="fa fa-bars"></i>
    </div>
    <div class="tip-container top-container">
        <div class="purikura center-block" id="purikura"></div>
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
    <div class="tip-container">
        <ul class="nav" id="main-menu">

            <#list sides as side>
                <li>
                        <a href="${side.url}"><i class="${side.icon}"></i>${side.title}</a>
                </li>
            </#list>
        </ul>
    </div>


</nav>