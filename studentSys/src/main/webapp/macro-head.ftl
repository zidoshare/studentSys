<#macro head title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>${title}</title>
<#nested>
<meta name="copyright" content="stuManager" />
<meta http-equiv="Window-target" content="_top" />
<link rel="Shortcut Icon" href="${staticServePath}/images/favicon.ico" />
<link rel="stylesheet" href="${staticServePath}/static/css/lib/bs-is-fun.css">
<!-- Bootstrap Styles-->
<link rel="stylesheet" type="text/css"
      href="${staticServePath}/assets/css/bootstrap.css?${staticResourceVersion}">
<link rel="stylesheet" type="text/css"
      href="${staticServePath}/static/css/lib/ladda-themeless.min.css?${staticResourceVersion}">
<!-- FontAwesome Styles-->
<link href="${staticServePath}/assets/css/font-awesome.min.css?${staticResourceVersion}" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="${staticServePath}/assets/js/morris/morris-0.4.3.min.css?${staticResourceVersion}" rel="stylesheet" />
<!-- Custom Styles-->
<link href="${staticServePath}/assets/css/custom-styles.css?${staticResourceVersion}" rel="stylesheet" />
<!-- Google Fonts-->
<#--<link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />-->
<link rel="stylesheet" href="${staticServePath}/assets/js/Lightweight-Chart/cssCharts.css?${staticResourceVersion}">
<link rel="stylesheet" href="${staticServePath}/assets/css/checkbox3.min.css?${staticResourceVersion}"/>
<link rel="stylesheet" href="${staticServePath}/static/css/base.css?${staticResourceVersion}"/>
<link rel="stylesheet" href="${staticServePath}/static/css/lib/bootstrap-datetimepicker.min.css?${staticResourceVersion}"/>

<link rel="stylesheet" href="${staticServePath}/static/css/style.css?${staticResourceVersion}"/>

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
<script type="text/javascript" src="${staticServePath}/static/js/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="${staticServePath}/static/js/lib/bootstrap-select.min.js"></script>
</#macro>