<nav class="navbar-default navbar-side sidebar-collapse" role="navigation" style="height: 1200px;">
    <div class="nav-btn navToggle6 bg-black">
        <div class="icon">
        </div>
    </div>

    <div class="tip-container top-container">
        <div class="purikura center-block" id="purikura"></div>
        <div class="text-center">
            <span class="bottom-border tip-container">
                <a class="h3" href="${staticServePath}">${user.userNickname}</a>
                <i class="fa fa-edit text-success"></i>
            </span>
            <p style="padding-top:0;">
                <a style="color:white;">
                    <small>基本信息</small>
                </a>
                &nbsp;
                <a style="color:white;" class="func" onclick="Login.loginOut()">
                    <small>退出</small>
                </a>
            </p>

        </div>
    </div>
    <div class="tip-container">
        <ul class="nav" id="main-menu">
        <#assign tag = 0>
        <#assign start = 0>
        <#assign index = 0>
        <#list sides as side>
            <li <#if side.id == now.id || now.parentId == side.id>class="active-menu active"</#if>>
                <a href="${staticServePath}${side.url}" data-label="#page-inner"><i class="${side.icon}"></i>${side.title}<#if menuSize[tag] gt 0><span
                        class="fa arrow"></span></#if></a>
                <#if menuSize[tag] gt 0>
                    <#assign index += menuSize[tag]>
                    <#list start..index-1 as x >
                        <ul class="nav nav-third-level collapse">
                            <li <#if childSides[x].id == now.id>class="active-menu active"</#if>>
                                <a href="${staticServePath}${childSides[x].url}" data-label="#page-inner"><i
                                        class="${childSides[x].icon}"></i>${childSides[x].title}</a>
                            </li>
                        </ul>
                    </#list>
                    <#assign start = index>
                </#if>
            </li>

            <#assign tag = tag + 1>
        </#list>
            <script type="text/javascript">
                $(function(){
                    $('#main-menu').find('li').on('click', function () {
                        $('#main-menu').find('li').removeClass('active-menu');
                        $(this).addClass('active-menu');
                    });
                })
            </script>
        </ul>
    </div>


</nav>
<div class="whole-container">
    <div class="tip" id="wholeTip" aria-label="0">
    </div>
</div>