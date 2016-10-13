<div id="load_questions">
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label for="testQuestionTypeId" class="control-label">题目类型：</label>
                <select class="form-control" name="testQuestion.testQuestionTypeId" id="testQuestionTypeId"
                        onchange="Util.changeModel($('#testQuestionTypeId'))">
                    <option id="option1" value="1" data-label="[&quot;shortModel&quot;]">单选题</option>
                    <option id="option2" value="2" data-label="[&quot;shortModel&quot;]">多选题</option>
                    <option id="option3" value="3" data-label="[&quot;longModel&quot;]">问答题</option>
                    <option id="option4" value="4" data-label="[&quot;longModel&quot;]">编程题</option>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="basic" class="control-label">标签分类：</label>

                <select id="basic" class="selectpicker show-tick form-control" data-live-search="true">
                    <option>cow</option>
                    <option data-subtext="option subtext">bull</option>
                    <option class="get-class" disabled>ox</option>
                    <optgroup label="test" data-subtext="optgroup subtext">
                        <option>ASD</option>
                        <option selected>Bla</option>
                        <option>Ble</option>
                    </optgroup>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="basic" class="control-label">标签：</label>

                <select id="basic" class="selectpicker show-tick form-control" data-live-search="true">
                    <option selected>cow</option>
                    <option data-subtext="option subtext">bull</option>
                    <option class="get-class" disabled>ox</option>
                    <optgroup label="test" data-subtext="optgroup subtext">
                        <option>ASD</option>
                        <option>Bla</option>
                        <option>Ble</option>
                    </optgroup>
                </select>
            </div>
        </div>
    </div>
    <div id="questions">
        <a class="res" onclick="getQuestions('1','1')">取数据</a>
    </div>
</div>
<script type="text/javascript" src="${staticServePath}/static/js/lib/bootstrap-select.min.js"></script>
<script>
    //从源码中找到的重绘selectpicker代码
    $(function () {
        $(".selectpicker").each(function () {
            var b = $(this);
            $.fn.selectpicker.call(b, b.data())
        });
    });
    function getQuestions(type,tag) {
        var json = {};
        json['type'] = type;
        json['tag'] = tag;
        $.ajax({
            url:'${staticServePath}/test/getQuestions',
            type:'post',
            data:json,
            success:function(data,state){
                var array = data.msg;
                $.each(array,function(index,obj){
                    $('#questions').append(obj.id);
                });
            }
        });
    }
</script>