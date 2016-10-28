<#macro paginate page url selector="pageTest" container="#table-inner" pageAfter="p">
    <div class="${selector}"></div>
    <script type="text/javascript">
        $('.${selector}').page({
            leng: ${page.totalPage},//分页总数
            activeClass: 'activP',  //active 类样式定义
            url:'${url}',
            currentPage:${page.pageNumber},
            pageAfter:'${pageAfter}'
        })
    </script>
</#macro>