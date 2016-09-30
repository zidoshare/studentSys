<#macro head title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>${title}</title>
<#nested>
<meta name="copyright" content="stuManager" />
<meta http-equiv="Window-target" content="_top" />
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
</#macro>