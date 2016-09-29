<script src="${staticServePath}/static/js/lib/jquery-2.1.1.min.js?${staticResourceVersion}"
        type="text/javascript"></script>
<#--<script src="${staticServePath}/assets/js/jquery-1.10.2.js?${staticResourceVersion}"></script>-->
<script src="${staticServePath}/static/js/lib/spin.min.js?${staticResourceVersion}"></script>
<script src="${staticServePath}/static/js/lib/ladda.min.js?${staticResourceVersion}" type="text/javascript"></script>
<script src="${staticServePath}/static/js/lib/jquery.transit.js?${staticResourceVersion}"
        type="text/javascript"></script>
<script src="${staticServePath}/static/js/common.js?${staticResourceVersion}" type="text/javascript"></script>
<script src="${staticServePath}/static/js/lib/bootstrap-datetimepicker.min.js?${staticResourceVersion}"></script>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- Bootstrap Js -->
<script src="${staticServePath}/static/js/lib/bootstrap.min.js?${staticResourceVersion}"></script>

<!-- Metis Menu Js -->
<script src="${staticServePath}/assets/js/jquery.metisMenu.js?${staticResourceVersion}"></script>
<!-- Morris Chart Js -->
<script src="${staticServePath}/assets/js/morris/raphael-2.1.0.min.js?${staticResourceVersion}"></script>
<#--<script src="${staticServePath}/assets/js/morris/morris.js?${staticResourceVersion}"></script>-->


<script src="${staticServePath}/assets/js/easypiechart.js?${staticResourceVersion}"></script>
<script src="${staticServePath}/assets/js/easypiechart-data.js?${staticResourceVersion}"></script>

<script src="${staticServePath}/assets/js/Lightweight-Chart/jquery.chart.js?${staticResourceVersion}"></script>

<!-- Custom Js -->
<script src="${staticServePath}/assets/js/custom-scripts.js?${staticResourceVersion}"></script>


<!-- Chart Js -->
<#--<script type="text/javascript" src="assets/js/chart.min.js?${staticResourceVersion}"></script>
<script type="text/javascript" src="assets/js/chartjs.js?${staticResourceVersion}"></script>-->
<!-- pjax -->
<script type="text/javascript" src="${staticServePath}/static/js/lib/jquery.pjax.js?${staticResourceVersion}"></script>

<script type="text/javascript">
    $('#purikura').css('background', 'url("../../images/logo.gif") no-repeat center center');
    Animate.loadWrapper();
    var Label = {
        staticServePath: "${staticServePath}",
        servePath: "${servePath}",
        isLogin:${isLogin?c},
        loginRole: "${loginRole}",
        loginNameErrorLabel: "${loginNameErrorLabel}",
        invalidPasswordLabel: "${invalidPasswordLabel}"
    };
    $(function () {
        if ($.support.pjax) {
            $(document).pjax('a[href!=#]', '#page-inner', {
                fragment: '#page-inner',
                timeout: 8000,
                cache: true,
                storage: true
            });
        }
        $('input').change(function () {
                    if ($(this).prop('checked')) {
                        var id = $(this).attr('id');
                        func.showPermissions(id, 'permission' + id);
                    }
                }
        )
        ;
    });
    $(document).on('pjax:beforeSend', function () { //pjax链接点击后显示加载动画；
        $('#page-inner').html('');
        $('.pjax_loading').css("display", "block");
    });
    $(document).on('pjax:complete', function () { //pjax链接加载完成后隐藏加载动画；
        $('.pjax_loading').css('display', 'none');
        Animate.loadWrapper();
        Animate.reDraw();
    });

    $('#main-menu').find('li').on('click', function () {
        $(this).addClass('active-menu');
        $(this).siblings('li').removeClass('active-menu');
    })
    $('tr').on('click', function () {
        /*alert("ok");
        $(this).find('.checkbox3.checkbox-round').first().click();*/
    })
/*
    $(".navToggle1").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle2").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle3").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle4").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle5").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle6").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle7").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle8").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle9").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle10").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle11").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle12").click(function () {
        $(this).toggleClass("open");
    });

    $(".navToggle13").click(function () {
        $(this).toggleClass("open");
    });*/
</script>