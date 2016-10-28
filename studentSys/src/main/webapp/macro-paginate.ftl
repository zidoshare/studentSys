<#macro paginate page url container="#table-inner" pageAfter="p">
    <div class="pageTest"></div>
    <script type="text/javascript">
        $('.pageTest').page({
            leng: ${page.totalPage},//分页总数
            activeClass: 'activP',  //active 类样式定义
            url:'${url}',
            currentPage:${page.pageNumber},
            pageAfter:'${pageAfter}'
        })
    </script>
</#macro>