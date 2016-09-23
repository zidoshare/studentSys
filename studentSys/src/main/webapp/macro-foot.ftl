<script src="${staticServePath}/static/js/lib/jquery-3.1.0.min.js?${staticResourceVersion}"
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


<script type="text/javascript">
    $('#purikura').css('background','url("../../images/logo.gif") no-repeat center center');
    var t = 100;
    $(document).find('.animate').each(function (index, doc) {
        var d = $(this);
        setTimeout(function () {
            d.addClass('div-move-in-top');
            d.css("opacity", "1");
        }, t);
        t += 100;
    });
    var Label = {
        staticServePath: "${staticServePath}",
        servePath: "${servePath}",
        isLogin:${isLogin?c},
        loginRole: "${loginRole}",
        loginNameErrorLabel: "${loginNameErrorLabel}",
        invalidPasswordLabel: "${invalidPasswordLabel}"
    };
</script>