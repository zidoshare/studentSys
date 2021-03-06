<script type="text/javascript">
    $('#purikura').css('background', 'url("${staticServePath}/images/logo.png") no-repeat center center');
    Animate.loadWrapper();
    var Label = {
        staticServePath: "${staticServePath}",
        servePath: "${servePath}",
        isLogin:${isLogin?c},
        loginRole: "${loginRole}",
        userId: "${user.id}",
        loginNameErrorLabel: "${loginNameErrorLabel}",
        invalidPasswordLabel: "${invalidPasswordLabel}"
    };
    $(function () {
        if ($.support.pjax) {
            $('#table-inner').pjax('a[data-label="#table-inner"]', '#table-inner', {
                fragment: '#table-inner',
                cache: true,
                maxCacheLength: 5,
                storage: false,
                replace: true,
                timeout: 8000
            });
            $(document).pjax('a[data-label="#page-inner"]', '#page-inner', {
                fragment: '#page-inner',
                cache: true,
                maxCacheLength: 5,
                storage: false,
                replace: true,
                timeout: 8000
            });
            $('#page-inner').on('pjax:beforeSend', function () { //pjax链接点击后显示加载动画；
                $('#page-inner').html('');
                $('.pjax_loading').css("display", "block");
            });
            $('#page-inner').on('pjax:complete', function () { //pjax链接加载完成后隐藏加载动画；
                $('.pjax_loading').css('display', 'none');
                Animate.loadWrapper();
                //当pjax链接启用后，重新绑定
                Util.reBindPjax();
            });
            Util.reBindPjax();
        }
    });
    var sid = 0;
    var word = "a";
    function submitQuestion() {
        var title = $("#title").val();
        var bigType = jQuery("#bigType").find("option:selected").val();
        var type = jQuery("#type").find("option:selected").val();
        var c = [];
        var s = [];
        /*var content = "{[\"";*/
        var max = 0;
        for (var i = 0; i < sid; i++) {
            /*content += i+"\":\"";
            content += $("#select"+i).val()+"\",";*/
            c[i] = $("#select" + i).val();
            s[i] = $("#score" + i).val();
            if (parseInt(s[i]) > max) {
                max = parseInt(s[i]);
            }
        }
        /*content = content.substring(0,content.length-1);
        content+="]}";*/
        var content = c.join("&");
        var score = s.join("&");
        Util.ajax("${staticServePath}/surveys/postQuestion",{
            data: {
                "questions.title": title,
                "questions.type": type,
                "questions.big_type_id": bigType,
                "questions.content": content,
                "questions.option_score": score,
                "questions.maxScore": max
            },
            success: {
                after:function() {
                    $("#q-flag").append("<p>" + title + "<p>");
                    var row = parseInt($("#maxRow").text());
                    $("#maxRow").text(row + 1);
                }
            }
        });
    }
    function addSelect() {
        $("#add").before("<div class=\"item clearfix\"><textarea class=\"form-control\" rows=\"2\" placeholder=\"" + String.fromCharCode(word.charCodeAt() + sid) + "\"  id=select" + (sid) + "></textarea>" +
                "<input type=\"text\" class=\"form-control\" value=\"1\" id=\"score" + sid++ + "\"/>" +
                "</div>");
    }
    function removeSelect() {
        var s = $("#add").prev();
        if (s.hasClass("item")) {
            s.remove();
            sid--;
        }
    }
    function loadResult(dom, url, options) {
        /*var evt = arguments.callee.caller.arguments[0] || window.event;
        evt.preventDefault();
        evt.stopPropagation();*/
        var defaults = {
            before: function () {
            },
            after: function () {
            }
        };
        var opts = $.extend(defaults,options);
        var load = dom.find('.panel_loading').first();
        load.removeClass('sr-only');
        opts.before();
        dom.find('.pan').first().load(url, function(response,status,xhr) {
            if(xhr.status == 403){
                Util.showTip($('#wholeTip'),'请刷新以重新登录','alert alert-danger');
            }
            /*var json = response;

            if(json.state=='error'){

                $(this).html('');
                return false;
            }
*/
            load.addClass('sr-only');
            opts.after();
        });
    }
</script>