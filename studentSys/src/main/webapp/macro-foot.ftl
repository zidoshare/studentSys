<script type="text/javascript">
    $('#purikura').css('background', 'url("../../images/logo.gif") no-repeat center center');
    Animate.loadWrapper();
    var Label = {
        staticServePath: "${staticServePath}",
        servePath: "${servePath}",
        isLogin:${isLogin?c},
        loginRole: "${loginRole}",
        loginNameErrorLabel: "${loginNameErrorLabel}",
        invalidPasswordLabel: "${invalidPasswordLabel}"
    };
    $(function () {
        if ($.support.pjax) {
            $(document).pjax('a[target!="_blank"]', '#page-inner', {
                fragment: '#page-inner',
                timeout: 8000,
                cache: true,
                storage: true
            });
        }
        $('input[data-arialabel="1"]').change(function () {
                    if ($(this).prop('checked')) {
                        var id = $(this).attr('id');
                        func.showPermissions(id, 'permission' + id);
                    }
                }
        );
    });
    $(document).on('pjax:beforeSend', function () { //pjax链接点击后显示加载动画；
        $('#page-inner').html('');
        $('.pjax_loading').css("display", "block");
    });
    $(document).on('pjax:complete', function () { //pjax链接加载完成后隐藏加载动画；
        $('.pjax_loading').css('display', 'none');
        Animate.loadWrapper();
        Animate.reDraw();
    });
    $('#main-menu').find('li').on('click', function () {
        $(this).addClass('active-menu');
        $(this).siblings('li').removeClass('active-menu');
    });
    var sid = 0;
    var word = "a";
    function submit() {
        var title = $("#title").val();
        var bigType = jQuery("#bigType").find("option:selected").val();
        var type = jQuery("#type").find("option:selected").val();
        var c = [];
        var s = [];
        /*var content = "{[\"";*/
        for (var i = 0; i < sid; i++) {
            /*content += i+"\":\"";
            content += $("#select"+i).val()+"\",";*/
            c[i] = $("#select" + i).val();
            s[i] = $("#score" + i).val();
        }
        /*content = content.substring(0,content.length-1);
        content+="]}";*/
        var content = c.join("&");
        var score = s.join("&");
        $.ajax({
            type: "post",
            url: "/surveys/postQuestion",
            data: {
                "questions.title": title,
                "questions.type": type,
                "questions.big_type_id": bigType,
                "questions.content": content,
                "questions.option_score": score
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
    function loadResult(id) {
        var evt = arguments.callee.caller.arguments[0] || window.event;
        evt.preventDefault();
        evt.stopPropagation();
        $('#check').load("/surveys/getTable/" + id);
        $('#myModal').modal('toggle');
    }
    /*
        $(".navToggle1").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle2").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle3").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle4").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle5").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle6").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle7").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle8").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle9").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle10").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle11").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle12").click(function () {
            $(this).toggleClass("open");
        });

        $(".navToggle13").click(function () {
            $(this).toggleClass("open");
        });*/
</script>