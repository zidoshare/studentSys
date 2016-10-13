<div id="load_questions">
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label for="testQuestionTypeId" class="control-label">题目类型：</label>
                <select class="form-control" name="testQuestion.testQuestionTypeId" id="testQuestionTypeId"
                 onclick="getQuestions()">
                <#list types as type>
                    <option id="option${type.id}" value="${type.id}">${type.typeName}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="domainSelect" class="control-label">标签分类：</label>

                <select id="domainSelect" class="selectpicker show-tick form-control" data-live-search="true">
                <#--<option>cow</option>
                <option data-subtext="option subtext">bull</option>
                <option class="get-class" disabled>ox</option>
                <optgroup label="test" data-subtext="optgroup subtext">
                    <option>ASD</option>
                    <option selected>Bla</option>
                    <option>Ble</option>
                </optgroup>-->
                <#list domains as domain>
                    <option value="${domain.id}">${domain.domainTitle}</option>
                </#list>

                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="tagSelect" class="control-label">标签：</label>
                <select id="tagSelect" class="selectpicker show-tick form-control" data-live-search="true">

                <#list tags as tag>
                    <option value="${tag.id}">${tag.tagName}</option>
                </#list>
                </select>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <div id="questions_loading" class="panel_loading">
                <img src="${staticServePath}/images/loading.gif" class="img-sm center-block"/>
            </div>
            <div id="questions">
            </div>
        </div>
    </div>

</div>
<script type="text/javascript" src="${staticServePath}/static/js/lib/bootstrap-select.min.js"></script>
<script>
    //从源码中找到的重绘selectpicker代码
    var ds = $('#domainSelect');
    var ts = $('#tagSelect');
    var tps = $('#testQuestionTypeId');
    $(function () {
        redrawSelects();
        getTags(ds.val());
        ds.on('change', function () {
            getTags(ds.val());
        });
        tps.on('change',function(){
        })
    });
    function redrawSelects() {
        $(".selectpicker").each(function () {
            var b = $(this);
            $.fn.selectpicker.call(b, b.data())
        });
    }
    function getQuestions() {
        var json = {};
        json['type'] = tps.val();
        json['tag'] = ts.val();
        $.ajax({
            url: '${staticServePath}/test/getQuestions',
            type: 'post',
            data: json,
            success: function (data, state) {
                $('#questions_loading').addClass('sr-only');
                var array = data.msg;
                var q = $('#questions');
                q.html('');
                var str = '<ul>';
                $.each(array, function (index, obj) {
                    str+='<li id = "'+obj.id+'"><div class="checkbox3 checkbox-round"> <input type="checkbox" id="question'+obj.id+'"> <label for="question'+obj.id+'">'+obj.title+' </label> </div></li>';
                });
                q.html(str);
            }
        });
    }
    function getTags(domain) {
        var json = {'domain': domain};
        $.ajax({
            url: '${staticServePath}/test/getTags',
            type: 'post',
            data: json,
            success: function (data, state) {
                if (data.state == 'error') {
                    Util.showTip($('#wholeTip'), data.msg, 'alert alert-danger');
                    return;
                }
                var array = data;

                var str = '<select id="tagSelect" class="selectpicker show-tick form-control" data-live-search="true">';
                var parent = ts.parent();
                ts.next().remove();
                ts.remove();
                $.each(array, function (index, obj) {
                    str += '<option value="' + obj.id + '">' + obj.tagName + '</option>';
                });
                str += '</div>';
                parent.append(str);
                redrawSelects();
                ts = $('#tagSelect');
                ts.on('change', function () {
                    getQuestions();
                });
                $('#questions_loading').addClass('sr-only');
                getQuestions();
            }
        });
    }
</script>