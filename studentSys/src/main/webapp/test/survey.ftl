<!DOCTYPE html>
<html lang="zh_cn">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width" name="viewport">
    <title>问卷调查</title>
    <link href="../static/css/css.css" rel="stylesheet">
    <script src="../static/js/lib/jquery-3.1.0.min.js"></script>
    <script src="../static/js/lib/icheck.min.js"></script>
</head>
<body>
<div class="wrapper">
    <div id="survey_progress" class="progress">
        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 10%;">
            10%
        </div>
    </div>

    <div class="container">
        <div class="survey_title">
            <h1>学员调查问卷</h1>
            <h4 class="survey_summary">
                <span style="color: red">提示:</span>
                "本问卷是一份用于了解在线学习情况的问卷，调查结果只会用于学术研究，我们保证不会对您的生活与学习带来任何的负面影响。希望您能抽出一点您宝贵的时间，帮我们填答一份问卷。我们非常感谢您的支持！
                "
            </h4>
        </div>

        <form method="get">
            <h1 class="survey_to_title">讲师满意度调查</h1>
            <ul class="subject_list">
                <li class="subject_big">
                    <h3>一,老师专业知识</h3>
                </li>
                <li class="subject">
                    <h4 class="subject_title">1. 教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？</h4>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。
                    </label>

                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        B 联系实际的举例，帮助我对问题的理解
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        D 只讲授课程本身的内容，不举实际的例子。
                    </label>
                </li>

                <li class="subject">
                    <h4 class="subject_title">1. 教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？</h4>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。
                    </label>

                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        B 联系实际的举例，帮助我对问题的理解
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        D 只讲授课程本身的内容，不举实际的例子。
                    </label>
                </li>

                <li class="subject">
                    <h4 class="subject_title">1. 教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？</h4>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。
                    </label>

                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        B 联系实际的举例，帮助我对问题的理解
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        D 只讲授课程本身的内容，不举实际的例子。
                    </label>
                </li>

                <li class="subject_big">
                    <h3>二,老师专业知识</h3>
                </li>
                <li class="subject">
                    <h4 class="subject_title">1. 教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？</h4>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。
                    </label>

                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        B 联系实际的举例，帮助我对问题的理解
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        D 只讲授课程本身的内容，不举实际的例子。
                    </label>
                </li>
            </ul>
            <textarea class="comment" name="comment" id="comment" rows="10" tabindex="4" placeholder="输入评论内容..."></textarea>
        </form>

        <form method="get">
            <h1 class="survey_to_title">辅导满意度调查</h1>
            <ul class="subject_list">
                <li class="subject_big">
                    <h3>一,老师专业知识</h3>
                </li>
                <li class="subject">
                    <h4 class="subject_title">1. 教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？</h4>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。
                    </label>

                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        B 联系实际的举例，帮助我对问题的理解
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        D 只讲授课程本身的内容，不举实际的例子。
                    </label>
                </li>

                <li class="subject">
                    <h4 class="subject_title">1. 教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？</h4>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。
                    </label>

                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        B 联系实际的举例，帮助我对问题的理解
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        D 只讲授课程本身的内容，不举实际的例子。
                    </label>
                </li>

                <li class="subject">
                    <h4 class="subject_title">1. 教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？</h4>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。
                    </label>

                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        B 联系实际的举例，帮助我对问题的理解
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        D 只讲授课程本身的内容，不举实际的例子。
                    </label>
                </li>

                <li class="subject_big">
                    <h3>二,老师专业知识</h3>
                </li>
                <li class="subject">
                    <h4 class="subject_title">1. 教师授课时，能够列举工作中的一些相关案例来帮助学员感受实际工作环境？</h4>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        A 合理恰当的列举，让我觉得受益匪浅，仿佛置身于实际工作环境中。
                    </label>

                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        B 联系实际的举例，帮助我对问题的理解
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        C 列举一些意义不大的例子，对学习有帮助，但有点浪费时间。
                    </label>
                    <label class="subject_option">
                        <input type="radio" name="iCheck" checked value="1">
                        D 只讲授课程本身的内容，不举实际的例子。
                    </label>
                </li>
                <textarea class="comment" name="comment" id="comment" rows="10" tabindex="4" placeholder="输入评论内容..."></textarea>
            </ul>
        </form>
        <div style="text-align: right">
            <button class="submit" type="submit">提交</button>
        </div>
    </div>

</div>

<script>
    $(document).ready(function(){
        $('input').iCheck({
            checkboxClass: 'iradio_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>

</body>
</html>