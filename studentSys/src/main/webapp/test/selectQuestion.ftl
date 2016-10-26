<div id="load_questions">
    <div class="row">

        <div class="col-md-4">
            <div class="form-group">
                <label for="testQuestionTypeId" class="control-label">题目类型：</label>
                <select class="form-control" name="testQuestion.testQuestionTypeId" id="testQuestionTypeId"
                        onclick="">
                    <option value="0">不限</option>
                <#list types as type>
                    <option id="option${type.id}" data-label="${type.typeLimit?html}"  value="${type.id}">${type.typeName}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="domainSelect" class="control-label">标签分类：</label>

                <select id="domainSelect" class="selectpicker show-tick form-control" data-live-search="true">
                    <option value="0">不限</option>
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
                    <option value="0">不限</option>
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
<#--<script type="text/javascript" src="${staticServePath}/static/js/lib/bootstrap-select.min.js"></script>-->
<script>
    var ds = $('#domainSelect');
    var ts = $('#tagSelect');
    var tps = $('#testQuestionTypeId');
    $(function () {
        //Util.redrawSelects();
        getTags(ds.val());
        ds.on('change', function () {
            getTags(ds.val());
        });
        tps.on('change', function () {
            getQuestions();
        });
        ts.on('change',function(){
            getQuestions();
        })
    });

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
                var checked = '';
                var s = $('#testQuestionnaireTypeList');
                var selects = s.val();
                var selectsVal = [];
                if (selects.length > 0)
                    selectsVal = JSON.parse(selects);
                $.each(array, function (index, obj) {
                    var index = $.inArray(obj.type, selectsVal[0]);
                    if ($.inArray(obj.id, selectsVal[1][index]) >= 0)
                        checked = 'checked';
                    str += '<li id = "' + obj.id + '"><div class="checkbox3 checkbox-round"> <input type="checkbox" id="question' + obj.id + '" onchange="changeSelected(\'' + obj.id + '\',\'' + obj.type + '\',this)"' + checked + '> <label for="question' + obj.id + '">' + obj.title + ' </label> </div></li>';
                    checked = '';
                });
                q.html(str);
            }
        });
    }
    function changeSelected(idstr, typeId, dom) {
        var tp = parseInt(typeId);
        var id = parseInt(idstr);
        var s = $('#testQuestionnaireTypeList');
        var str = s.val();
        var array = JSON.parse(s.val());
        var typeArray = array[0];
        var questionArray = array[1];
        console.log(array);
        isChanged = true;
        if ($(dom).prop('checked')) {
            //默认按照id大小进行排序
            var result = Util.insertArrayByOrder(typeArray, tp);
            typeArray = result.arr;
            if (questionArray.length >= result.index && result.isAdd){
                questionArray.splice(result.index,0,[]);
            }
            questionArray[result.index].push(id);
        }
        else {
            var temp = [];
            var index = $.inArray(tp, typeArray);
            console.log('index = ',index);
            if (index >= 0) {
                $.each(questionArray[index], function (ind, obj) {
                    if (obj != id)
                        temp.push(obj);
                });
                questionArray[index] = temp;
                if (temp.length == 0) {

                    for (var x = index; x < questionArray.length; x++) {
                        questionArray[x] = questionArray[x + 1];
                        typeArray[x] = typeArray[x + 1];
                    }
                    questionArray.splice(questionArray.length - 1);
                    typeArray.splice(typeArray.length - 1)
                }
            }
        }
        array[0] = typeArray;
        array[1] = questionArray;
        s.val(JSON.stringify(array));
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

                var str = '<select id="tagSelect" class="selectpicker show-tick form-control" data-live-search="true">' +
                        '<option value="0">不限</option>';
                var parent = ts.parent();
                ts.next().remove();
                ts.remove();
                $.each(array, function (index, obj) {
                    str += '<option value="' + obj.id + '">' + obj.tagName + '</option>';
                });
                str += '</select>';
                parent.append(str);
                Util.redrawSelects();
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