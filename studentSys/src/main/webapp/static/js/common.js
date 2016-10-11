/**
 * Created by wuhongxu on 2016/8/30 0030.
 */

var closeTiptimeOut;

var Login = {
    login: function () {
        var evt = arguments.callee.caller.arguments[0] || window.event;
        evt.preventDefault();
        evt.stopPropagation();
        var btn = Ladda.create(document.querySelector("#login-btn"));
        btn.start();
        var data = {
            target: $("#loginTip"),
            data: [{
                "target": $("#account"),
                "type": "string",
                "max": 20,
                "msg": Label.loginNameErrorLabel
            }, {
                "target": $("#password"),
                "type": "password",
                "msg": Label.invalidPasswordLabel
            }]
        };
        if (Validate.toValidate(data)) {
            var jsonObj = {
                account: $("#account").val().replace(/(^\s*)|(\s*$)/g, ""),
                password: $("#password").val()
            };
            $.ajax({
                type: "post",
                url: "/user/login",
                dataType: "json",
                data: jsonObj,
                success: function (data) {
                    if (data.state == "success") {
                        $("form").fadeOut(500);
                        $(".wrapper").addClass("form-success");
                        //Util.showTip($("#loginTip"), data.msg, 'alert alert-success');
                        setTimeout(function () {
                            location.href = "/";
                        }, 1000);
                    } else {
                        Util.showTip($("#loginTip"), "账号或密码错误!", 'alert alert-danger');
                    }
                    setTimeout(function () {
                        btn.stop();
                    }, 3500);
                },
                error: function () {
                    Util.showTip($("#loginTip"), "服务器错误!", 'alert alert-danger');
                    setTimeout(function () {
                        btn.stop();
                    }, 3500);
                }
            })

        } else {
            setTimeout(function () {
                btn.stop();
            }, 3500);
        }
    },
    register: function () {

    },
    loginOut: function () {
        window.location.href = "/user/loginOut";
    }
};
var Validate = {
    toValidate: function (obj) {
        var tipHTML = '';
        for (var i = 0; i < obj.data.length; i++) {
            if (!Validate.validate(obj.data[i])) {
                tipHTML += obj.data[i].msg;
                Util.showTip(obj.target, obj.data[i].msg, "alert alert-danger");
                return false;
            }
        }
        return true;
    },
    validate: function (data) {
        var isValidate = true,
            val = '';
        if (data.type === 'imgSrc') {
            val = data.target.attr('src');
        } else if (data.type === 'imgStyle') {
            val = data.target.data('imageurl');
        } else if (data.type === 'num') {
            val = data.target.text().replace(/(^\s*)|(\s*$)/g, "");
        } else {
            val = data.target.val().toString().replace(/(^\s*)|(\s*$)/g, "");
        }
        switch (data.type) {
            case "email":
                if (!/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(data.target.val())) {
                    isValidate = false;
                }
                break;
            case "password":
                if (data.target.val().length === 0 || data.target.val().length > 16) {
                    isValidate = false;
                }
                break;
            case "confirmPassword":
                if (data.target.val() !== data.original.val()) {
                    isValidate = false;
                }
                break;
            case "tags":
                var tagList = val.split(",");
                if (val === "" || tagList.length > 7) {
                    isValidate = false;
                }

                for (var i = 0; i < tagList.length; i++) {
                    if (tagList[i].replace(/(^\s*)|(\s*$)/g, "") === ""
                        || tagList[i].replace(/(^\s*)|(\s*$)/g, "").length > 50) {
                        isValidate = false;
                        break;
                    }
                }
                break;
            case "num":
                if (val === '' || val === ' ' || val.length < 1) {
                    isValidate = false;
                    break;
                }
                isValidate = true;
                break;
            case "url":
            case "imgSrc":
            case "imgStyle":
                if (val === '' || (val !== "" && (!/^\w+:\/\//.test(val) || val.length > 100))) {
                    isValidate = false;
                }
                break;
            default:
                if (val.length <= data.max && val.length >= (data.min ? data.min : 0)) {
                    isValidate = true;
                } else {
                    isValidate = false;
                }
                break;
        }
        return isValidate;
    }
};

var Util = {
    showTip: function (tip, result, className, options) {
        var defaults = {
            time: 3000, before: function () {
            }, complete: function () {
            }
        };
        if (options != null)
            $.each(options, function (name, value) {
                if (value != null)
                    defaults[name] = value;
            });
        defaults.before();
        if (tip.is(':animated')) {
            //将动画停止
            tip.stop(true, true);
            //初始化tip状态
            tip.css({"display": "none", "opacity": "0", "y": "0px"});
            /*tip.transition({opacity: 0, y: 0}, 0);*/
        }
        tip.addClass(className);
        tip.html(result);
        tip.css("display", "block");
        tip.transition({opacity: 1, y: 10}, 500)
            .transition({opacity: 1}, defaults.time)
            .transition({opacity: 0, y: 0}, 500, function () {
                tip.css("display", "none");
                tip.attr("aria-label", "0");
                defaults.complete();
                tip.attr('class','');
            });

    },
    addSelect: function () {
        var item = 'A';
        var op = 0;
        var s = $("#add").prev();
        while (s.hasClass("select")) {
            op++;
            s = s.prev();
        }
        item = String.fromCharCode(item.charCodeAt() + op);
        var checkDom = '<div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light"> <input type="checkbox" id="' + item + '"> <label for="' + item + '"> ' + item + ' </label> </div>';
        $("#add").before("<div class=\"select form-group\">" + checkDom + "<textarea class=\"form-control\" rows=\"2\" id='item" + op + "'></textarea>" +
            "</div>");
    },
    removeSelect: function () {
        var s = $("#add").prev();
        if (s.hasClass("select")) {
            s.remove();
        }
    },
    changeTag: function (str, dom) {
        var isChecked = dom.prop('checked');
        var targetStr = $('input#tags').val();
        var array = targetStr.split(',');

        var end = '';
        for (var i = 0; i < array.length; i++) {
            if (array[i] != str && array[i].length > 0)
                end += array[i] + ',';
        }
        if (isChecked)
            end += str + ',';
        end = end.substr(0, end.length - 1);
        $('input#tags').val(end);
    },
    changeModel: function (select) {
        $('#shortModel').addClass('sr-only');
        $('#longModel').addClass('sr-only');
        var val = select.val();
        var limit = $('#option' + val).attr('data-label');
        var limits = JSON.parse(limit);
        for (var i = 0; i < limits.length; i++) {
            $('#' + limits[i]).removeClass('sr-only');
        }
    }
};
var Animate = {
    loadWrapper: function () {
        var t = 100;
        $(document).find('.animate').each(function (index, doc) {
            var d = $(this);
            setTimeout(function () {
                d.addClass('div-move-in-top');
                d.css("opacity", "1");
            }, t);
            t += 100;
        });
    },
    clearWrapper: function () {
        var t = 100;
        $(document).find('.animate').each(function (index, doc) {
            var d = $(this);
            setTimeout(function () {
                d.addClass('div-move-in-top');
                d.css("opacity", "1");
            }, t);
            t += 100;
        });
        return t;
    },
    reDraw: function () {
        $('#easypiechart-teal').easyPieChart({
            scaleColor: false,
            barColor: '#1ebfae'
        });

        $('#easypiechart-orange').easyPieChart({
            scaleColor: false,
            barColor: '#ffb53e'
        });

        $('#easypiechart-red').easyPieChart({
            scaleColor: false,
            barColor: '#f9243f'
        });

        $('#easypiechart-blue').easyPieChart({
            scaleColor: false,
            barColor: '#30a5ff'
        });
    }
};
var func = {
    addRole: function (method) {
        if (method == 'show') {
            modalUtil.toggleClear($('#myModal'));
            func.showPermissions(0, '', 'permissions');
        } else {
            var data = [];
            var x = 0;
            $('#myModal').find("input[type='checkbox']").each(function (index, dom) {
                if ($(this).prop('checked'))
                    data[x++] = $(this).attr('name');
            });
            data = data.sort(function (a, b) {
                return a - b;
            });
            console.log(data);
            var d = "";
            for (var i = 0; i < data.length; i++) {
                d += data[i] + ":";
            }
            if (d.length > 0)
                d = d.substr(0, d.length - 1);
            $('#treeData').val(d);
            $('#createTime').val(new Date().getTime());
            var btn = Ladda.create(document.querySelector("#saveRole-btn"));
            btn.start();
            var json = {};
            $('#role').find('input').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            $.ajax({
                url: '/userManager/addRole',
                type: 'post',
                data: json,
                dataType: "json",
                success: function (data) {
                    if (data.state == 'success') {
                        Util.showTip($('#saveRoleTip'), '添加成功', 'alert alert-success');
                    } else
                        Util.showTip($('#saveRoleTip'), '添加失败', 'alert alert-warning');
                },
                error: function () {
                    Util.showTip($('#saveRoleTip'), '服务器错误', 'alert alert-danger');
                },
                complete: function () {
                    btn.stop();
                }
            });
        }
    },
    addUser: function (method) {
        if (method == 'show') {
            modalUtil.toggleClear($('#addUserModel'));
            /*func.showPermissions(0, '', 'permissions');*/
        } else {
            var btn = Ladda.create(document.querySelector("#saveUser-btn"));
            btn.start();
            var json = {};
            $('#user').find('.form-control').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            $('#createTime').val(new Date().getTime());
            $.ajax({
                url: '/userManager/addUser',
                type: 'post',
                data: json,
                dataType: "json",
                success: function (data) {
                    if (data.state == 'success') {
                        Util.showTip($('#saveUserTip'), '添加成功', 'alert alert-success');
                    } else
                        Util.showTip($('#saveUserTip'), '添加失败', 'alert alert-warning');
                },
                error: function () {
                    Util.showTip($('#saveUserTip'), '服务器错误', 'alert alert-danger');
                },
                complete: function () {
                    btn.stop();
                }
            });
        }
    },
    addStudent: function (method) {
        if (method == 'show') {
            modalUtil.toggleClear($('#addStudentModel'));
        } else {
            var btn = Ladda.create(document.querySelector("#save-btn"));
            btn.start();
            $('#createTime').val(new Date().getTime());
            var json = {};
            $('#student').find('.form-control').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            $.ajax({
                url: '/studentManager/addStudent',
                type: 'post',
                data: json,
                dataType: "json",
                success: function (data) {
                    if (data.state == 'success') {
                        Util.showTip($('#saveTip'), '添加成功', 'alert alert-success');
                    } else
                        Util.showTip($('#saveTip'), '添加失败', 'alert alert-warning');
                },
                error: function () {
                    Util.showTip($('#saveTip'), '服务器错误', 'alert alert-danger');
                },
                complete: function () {
                    btn.stop();
                }
            });
        }
    },
    addTestQuestion: function (method) {
        if (method == 'show') {
            modalUtil.toggleClear($('#addTestQuestion'));
        } else {
            var btn = Ladda.create(document.querySelector("#saveTestQuestion-btn"));
            btn.start();
            //填充创建时间
            $('#testQuestionCreateTime').val(new Date().getTime());
            //---------------填充选择题选项------------
            var selects = [];
            //---------------填充选择题答案------------
            var answers = [];
            var i = 0;
            var first = 'A';
            while ($('#item' + i).is('textarea')) {
                var a = String.fromCharCode(first.charCodeAt() + i);
                if ($('#' + a).prop('checked')) {
                    answers.push(a);
                }
                selects[i] = $('#item' + (i++)).val();
            }
            $('#testQuestionContent').val(JSON.stringify(selects));
            $('#testQuestionShortAnswer').val(JSON.stringify(answers));
            //---------------填充选项及答案结束------------

            var json = {};
            $('#testQuestion').find('.form-control').each(function () {
                if ($(this).attr('name') != null)
                    json[$(this).attr('name')] = $(this).val();
            });
            $.ajax({
                url: "/test/addTestQuestion",
                dataType: 'json',
                type: 'post',
                data: json,
                success: function (data, status) {
                    if (data.state == 'success')
                        Util.showTip($('#saveTestQuestionTip'), data.msg, "alert alert-success", {
                            time: 5000,
                            complete: function () {
                                modalUtil.toggleClear($('#addTestQuestion'));
                                //TODO 这里是已经进行了pjax的方法了的,但是会请求两次，第二次是没有pjax请求的，暂时不清楚怎么回事
                                $.pjax.reload("#page-inner");
                            }
                        });
                    else {
                        Util.showTip($('#saveTestQuestionTip'), data.msg, "alert alert-warning");
                        btn.stop();
                    }

                },
                error: function () {
                    Util.showTip($('#saveTestQuestionTip'), "服务器错误", "alert alert-danger");
                    btn.stop();
                }
            });
        }
    },
    updateTestQuestion: function (method,id) {
        modalUtil.toggleClear($('#addTestQuestion'));
        $('#id').val(id);
        
    },
    updateUser: function (method) {
        if (method == 'show') {

        }
    },
    updateRole: function (method, id) {
        if (arguments.length < 1)
            return;
        var modal = $('#myModal');
        if (method == 'show') {
            modalUtil.toggleClear(modal);
            func.showPermissions(0, id, 'permissions', 'all');
            var name = $('#' + id).find('td').first().text();
            modal.find('input').first().val(name);
            $('#id').val(id);
        }
    },
    showPermissions: function (left, mappingId, divId, method) {
        if (method == 'all') {
            $.ajax({
                url: '/userManager/showAllPermissons/' + mappingId,
                type: 'get',
                success: function (data) {
                    if (data.state == 'success') {
                        var str = '';
                        var list = $.parseJSON(data.msg);
                        var start = 0;
                        for (var i = 0; i < list.length; i++) {
                            var json = list[i];
                            var id = json['id'];
                            var icon = json['icon'];
                            var title = json['title'];
                            var url = json['url'];
                            var childCnt = parseInt(json['childCount']);
                            var isChecked = json['isChecked'];

                            str += '<div class="checkbox3 checkbox-round"> ' + /* onchange="func.showPermissions(' + (left) + ',\'' + id + '\',\'permission' + id + '\')"*/
                                '<input type="checkbox" data-arialabel="1" name="' + id + '" id="' + id + '"';
                            if (isChecked == true)
                                str += 'checked';
                            str += '> ' +
                                '<label for="' + id + '">' + title + '</label>' +
                                ' </div><div id="permission' + id + '" style="margin-left: ' + (left) + 'px;/*height:' + (childCnt * 40) + 'px;*//*overflow-y:auto;overflow-x:hidden;*/ "></div>';
                        }
                        $('#' + divId).html(str);
                    }
                }/*,
                 complete:$('#'+divId).slideDown()*/
            });
            return;
        }
        $.ajax({
            url: '/userManager/showPermissions/' + mappingId,
            type: 'get',
            success: function (data) {
                if (data.state == 'success') {
                    var str = '';
                    var list = $.parseJSON(data.msg);
                    for (var i = 0; i < list.length; i++) {
                        var json = list[i];
                        var id = json['id'];
                        var icon = json['icon'];
                        var title = json['title'];
                        var url = json['url'];
                        var childCnt = json['childCount'];
                        str += '<div class="checkbox3 checkbox-round" onchange="func.showPermissions(' + (left + 20) + ',\'' + id + '\',\'permission' + id + '\')"> ' +
                            '<input type="checkbox" data-arialabel="1" name="' + id + '" id="' + id + '"> ' +
                            '<label for="' + id + '">' + title + '</label>' +
                            ' </div><div id="permission' + id + '" style="margin-left: ' + (left + 20) + 'px;/*height:' + (childCnt * 40) + 'px;*//*overflow-y:auto;overflow-x:hidden;*/ "></div>';
                    }
                    $('#' + divId).html(str);
                }
            }
        });
    }
};
var modalUtil = {
    toggleClear: function (modal) {
        modal.find('input[id!="operater"]').val('');
        modal.find('textarea[id!="operater"]').val('');
        modal.modal('toggle');
    }
};
var Test = {
    testPjaxReload: function () {
        $.pjax.reload({container: '#page-inner'});
    }
};

