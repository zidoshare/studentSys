<#macro paginate page url selector="pageTest" container="#table-inner" pageAfter="p" method="href">
<div class="${selector}"></div>
    <#if page.totalPage gt 1>



    <script type="text/javascript">
        $('.${selector}').page({
            leng: ${page.totalPage},//分页总数
            activeClass: 'activP',  //active 类样式定义
            url: '${url}',
            method: '${method}',
            container: '${container}',
            currentPage:${page.pageNumber},
            pageAfter: '${pageAfter}'
        });
            <#if method == "load">
            $('.${selector} a').on('click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                Util.loadResult($('${container}'), $(this).attr('href') + ' ${container}');
            });
            </#if>
    </script>

        <#if page.pageNumber gt page.totalPage && page.totalPage gt 0>
        <script type="text/javascript">
            $(function () {
                Util.showTip($('#wholeTip'), '当前页数大于总页数，已自动回滚末页', 'alert alert-warning', {
                    before: function () {
                        Util.loadByPjax('${url+pageAfter+'='+page.totalPage}', {
                            container: '${container}'
                        });
                    }
                });
            })
        </script>
        </#if>
    </#if>
</#macro>