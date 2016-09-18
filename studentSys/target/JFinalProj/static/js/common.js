/**
 * Created by wuhongxu on 2016/8/30 0030.
 */

var closeTiptimeOut;

var Login = {
    login: function () {
        event.preventDefault();
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
                        Util.showTip($("#loginTip"),data.msg,'alert alert-success');
                        setTimeout(function () {
                            location.href = "/";
                        }, 1000);
                    } else {
                        Util.showTip($("#loginTip"), "账号或密码错误!", 'alert alert-danger');
                    }
                    setTimeout(function () {
                        btn.stop();
                    },3500);
                },
                error: function () {
                    Util.showTip($("#loginTip"), "服务器错误!", 'alert alert-danger');
                    setTimeout(function () {
                        btn.stop();
                    },3500);
                }
            })

        }else{
            setTimeout(function () {
                btn.stop();
            },3500);
        }
    },
    register: function () {

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
    showTip: function (tip, result, className) {
        var x = tip.attr("aria-label");
        if (x == "0") {
            tip.addClass(className);
            tip.html(result);
            tip.css("display", "block");
            tip.transition({opacity: 1, y: 10}, 500);
            tip.attr("aria-label", "1");
            closeTiptimeOut = setTimeout(function () {
                tip.transition({opacity: 0, y: 0}, 500, function () {
                    tip.css("display", "none");
                    tip.attr("aria-label", "0");
                });
            }, 3000);
        } else {
            clearTimeout(closeTiptimeOut);
            //初始化tip状态
            tip.css({"display": "none", "opacity": "0"});
            tip.transition({opacity: 0, y: 0}, 0);
            tip.attr("aria-label", "0");
            //重新显示tip
            Util.showTip(tip, result, className);
        }
    }
};