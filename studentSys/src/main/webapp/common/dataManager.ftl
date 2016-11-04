<#include "../macro-item.ftl">
<@item>
<div class="panel-heading title">
${view.title}
</div>
<div class="panel-body">
    <button data-style="slide-up" id="init-map-btn" class="btn btn-primary ladda-button"
            onclick="adminData('initWebMap','#init-map-btn')">
        <span class="ladda-label">从xml文件中初始化网站地图</span>
    </button>
    <button data-style="slide-up" id="init-user-btn" class="btn btn-primary ladda-button"
            onclick="adminData('initWebRole','#init-user-btn')">
        <span class="ladda-label">初始化用户、角色</span>
    </button>
</div>
</@item>
<script type="text/javascript">
    function adminData(data,selector){
        if(confirm("你确定要进行数据更新吗？")){
            var btn = Ladda.create(document.querySelector(selector));
            btn.start();
            $.ajax({
                url:"${staticServePath}/admin",
                data:{'data':data},
                success:function(data,state){
                    if(data.state == 'success'){
                        Util.showTip($('#wholeTip'),data.msg,'alert alert-success');
                    }else{
                        Util.showTip($('#wholeTip'),data.msg,'alert alert-danger');
                    }
                },
                error:function(){
                    Util.showTip($('#wholeTip'),'服务器错误','alert alert-danger');
                },
                complete:function(){
                    btn.stop();
                }
            })
        }
    }
</script>