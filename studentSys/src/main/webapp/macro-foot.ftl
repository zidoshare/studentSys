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
            $(document).pjax('a[href!=#]', '#page-inner', {
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
        )
        ;
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
                if(data.state == "success") {
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
    $('tr[data-label="open-check"]').on("click", function () {
        loadResult($(this).attr('id'));
    });
    $('tr[data-label="open-count"]').on('click', function () {
        window.open("/surveys/result/" + $(this).attr('id'));
    });
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