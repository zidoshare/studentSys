<script type="text/javascript">
    $('#purikura').css('background', 'url("${staticServePath}/images/logo.png") no-repeat center center');
    Animate.loadWrapper();
    var Label = {
        staticServePath: "${staticServePath}",
        servePath: "${servePath}",
        isLogin:${isLogin?c},
        loginRole: "${loginRole}",
        userId:"${user.id}",
        loginNameErrorLabel: "${loginNameErrorLabel}",
        invalidPasswordLabel: "${invalidPasswordLabel}"
    };
    $(function () {
        if ($.support.pjax) {
            $(document).pjax('a[target!="_blank"]', '#page-inner', {
                fragment: '#page-inner',
                cache: true,
                maxCacheLength:5,
                storage: false,
                replace:true
            });
        }
    });
    $(document).on('pjax:beforeSend', function () { //pjax链接点击后显示加载动画；
        $('#page-inner').html('');
        $('.pjax_loading').css("display", "block");
    });
    $(document).on('pjax:complete', function () { //pjax链接加载完成后隐藏加载动画；
        $('.pjax_loading').css('display', 'none');
        Animate.loadWrapper();
    });
    $('#main-menu').find('li').on('click', function () {
        $(this).addClass('active-menu');
        $(this).siblings('li').removeClass('active-menu');
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
            if(parseInt(s[i])>max){
                max=parseInt(s[i]);
            }
        }
        /*content = content.substring(0,content.length-1);
        content+="]}";*/
        var content = c.join("&");
        var score = s.join("&");
        $.ajax({
            type: "post",
            url: "${staticServePath}/surveys/postQuestion",
            data: {
                "questions.title": title,
                "questions.type": type,
                "questions.big_type_id": bigType,
                "questions.content": content,
                "questions.option_score": score,
                "questions.maxScore":max
            },
            success: function (data, textStatus) {
                alert(data.msg);
                if (data.state == "success") {
                    $("#q-flag").append("<p>" + title + "<p>");
                    var row = parseInt($("#maxRow").text());
                    $("#maxRow").text(row + 1);
                }
            },
            error: function () {
                alert("错误");
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
    function loadResult(dom,url) {
        /*var evt = arguments.callee.caller.arguments[0] || window.event;
        evt.preventDefault();
        evt.stopPropagation();*/
        var load = dom.find('.panel_loading').first();
        load.removeClass('sr-only');
        dom.find('.pan').first().load(url,function(){
            load.addClass('sr-only');
            Util.showTip($('#wholeTip'),'打开了','alert alert-success');
        });
    }
</script>