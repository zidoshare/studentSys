<!DOCTYPE HTML>
<html lang="utf-8">
<head>
    <title>测试</title>
</head>
<body>
<#list bigTypes as type>
<p>类型：${type.name}</p>
</#list>
<label for="title">标题：</label><input type="text" id="title"/>
<br/>
<#list bigTypes as type>
<label for="type">类型：</label><input type="text" id="type" disabled value="${type.name}"/>
</#list>
    <button onclick="S.submit()">提交</button>
</body>
<script src="../static/js/lib/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    var S = {
        submit:function(){
            $.ajax({
                type: "post",
                url: "/test/postType",
                data: {
                    "questions.title":"on",
                    "questions.type":"0"
                },
                success: function (data, textStatus) {
                    alert(data.msg);
                },
                complete:function(){
                }
            });
        }
    }
</script>
</html>
