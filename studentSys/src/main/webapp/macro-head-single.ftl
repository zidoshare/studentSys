<#macro head title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>${title}</title>
    <#nested>
<meta name="copyright" content="stuManager" />
<meta http-equiv="Window-target" content="_top" />
<link rel="stylesheet" type="text/css"
      href="${staticServePath}/static/css/lib/bootstrap.min.css?${staticResourceVersion}">
<link rel="stylesheet" type="text/css"
      href="${staticServePath}/static/css/login/styles.css?${staticResourceVersion}">
<link rel="stylesheet" type="text/css"
      href="${staticServePath}/static/css/lib/ladda-themeless.min.css?${staticResourceVersion}">
<script src="${staticServePath}/static/js/lib/jquery-2.1.1.min.js?${staticResourceVersion}"
        type="text/javascript"></script>
<#--<script src="${staticServePath}/assets/js/jquery-1.10.2.js?${staticResourceVersion}"></script>-->
<script src="${staticServePath}/static/js/lib/spin.min.js?${staticResourceVersion}"></script>
<script src="${staticServePath}/static/js/lib/ladda.min.js?${staticResourceVersion}" type="text/javascript"></script>
<script src="${staticServePath}/static/js/lib/jquery.transit.js?${staticResourceVersion}"
        type="text/javascript"></script>
<script src="${staticServePath}/static/js/common.js?${staticResourceVersion}" type="text/javascript"></script>

</#macro>