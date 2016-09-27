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
                <a style="color:white;">
                    <small>基本信息</small>
                </a>
                &nbsp;
                <a style="color:white;">
                    <small>退出</small>
                </a>
            </p>

        </div>
    </div>
    <div class="tip-container">
        <ul class="nav" id="main-menu">
        <#assign tag = 0>
        <#assign start = 0>
        <#list sides as side>
            <li <#if side.title == now.title>class="active-menu"</#if>>
                <a href="${side.url}"><i class="${side.icon}"></i>${side.title}<#if menuSize[tag] gt 0><span
                        class="fa arrow"></span></#if></a>
                <#if menuSize[tag] gt 0>
                    <#assign index = menuSize[tag]>
                    <#list start..index-1 as x >
                        <ul class="nav nav-third-level collapse">
                            <li>
                                <a href="${childSides[x].url}"><i
                                        class="${childSides[x].icon}"></i>${childSides[x].title}</a>
                            </li>
                        </ul>
                    </#list>
                    <#assign start = index + 1>
                </#if>
            </li>

            <#assign tag++>
        </#list>
        </ul>
    </div>


</nav>