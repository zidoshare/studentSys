<div class="pjax_loading" style="display: none;">
    <div id="contain">
        <div class="wrap" id="wrap1">
            <div class="part" id="part1"></div>
        </div>

        <div class="wrap" id="wrap2">
            <div class="part" id="part2"></div>
        </div>

        <div class="wrap" id="wrap3">
            <div class="part" id="part3"></div>
        </div>

        <div class="wrap" id="wrap4">
            <div class="part" id="part4"></div>
        </div>
    </div>
</div>
<script src="${staticServePath}/static/js/lib/jquery-2.1.1.min.js?${staticResourceVersion}"
        type="text/javascript"></script>
<#--<script src="${staticServePath}/assets/js/jquery-1.10.2.js?${staticResourceVersion}"></script>-->
<script src="${staticServePath}/static/js/lib/spin.min.js?${staticResourceVersion}"></script>
<script src="${staticServePath}/static/js/lib/ladda.min.js?${staticResourceVersion}" type="text/javascript"></script>
<script src="${staticServePath}/static/js/lib/jquery.transit.js?${staticResourceVersion}" type="text/javascript"></script>
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
    $('#purikura').css('background','url("../../images/logo.gif") no-repeat center center');
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
        if($.support.pjax){
            $(document).pjax('a[href!=#]', '#page-inner', {
                fragment: '#page-inner',
                timeout: 8000,
                cache: true,
                storage:true
            });
        }
    });
    $(document).on('pjax:beforeSend', function() { //pjax链接点击后显示加载动画；
        $('#page-inner').html('');
        $('.pjax_loading').css("display", "block");
    });
    $(document).on('pjax:complete', function() { //pjax链接加载完成后隐藏加载动画；
        $('.pjax_loading').css('display', 'none');
        Animate.loadWrapper();
        Animate.reDraw();
    });

    $('#main-menu').find('li').on('click',function(){
        $(this).addClass('active-menu');
        $(this).siblings('li').removeClass('active-menu');
    })
    $('tr').on('click',function(){
        /*alert("ok");
        $(this).find('.checkbox3.checkbox-round').first().click();*/
    })
</script>