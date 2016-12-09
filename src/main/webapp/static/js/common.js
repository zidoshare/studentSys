/**
 * Created by wuhongxu on 2016/8/30 0030.
 */

jQuery.fn.showLoading = function () {
    if ($(this).attr('data-lb') == '1')
        return;
    var width = $(this).width();
    var height = $(this).height();
    $(this).html('');
    var str = '<div style="position:relative; width:' + width + 'px;height:' + height + 'px" class="panel_loading"><div class="sk-circle"> <div class="sk-circle1 sk-child"></div> <div class="sk-circle2 sk-child"></div> <div class="sk-circle3 sk-child"></div> <div class="sk-circle4 sk-child"></div> <div class="sk-circle5 sk-child"></div> <div class="sk-circle6 sk-child"></div> <div class="sk-circle7 sk-child"></div> <div class="sk-circle8 sk-child"></div> <div class="sk-circle9 sk-child"></div> <div class="sk-circle10 sk-child"></div> <div class="sk-circle11 sk-child"></div> <div class="sk-circle12 sk-child"></div> </div></div>';
    $(this).append(str);
    $(this).attr('data-lb', '1');
    var dom = $(this);
    setTimeout(function () {
        dom.attr('data-lb', '0');
    }, 500);
};
jQuery.fn.closeLoading = function () {
    var dom = $(this);
    if (dom.attr('data-lb') == '1') {
        setTimeout(function () {
            dom.closeLoading();
        }, 100);
        return;
    }
    dom.find('.panel_loading').fadeOut(500, function () {
        $(this).remove();
    });
}

var Login = {
    login: function () {
        var evt = arguments.callee.caller.arguments[0] || window.event;
        evt.preventDefault();
        evt.stopPropagation();
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
            Util.ajax(Label.staticServePath + "/user/login", {
                data: jsonObj,
                success: function (data) {
                    $("form").fadeOut(500);
                    $(".wrapper").addClass("form-success");
                    setTimeout(function () {
                        if (Label.holdPath != null) {
                            window.location.href = Label.holdPath;
                        } else
                            window.location.href = Label.staticServePath + '/';
                    }, 1000);
                }
            });
        }
    },
    register: function () {

    },
    loginOut: function () {
        window.location.href = Label.staticServePath + "/user/loginOut";
    }
};
var Validate = {
    toValidate: function (obj) {
        var tipHTML = '';
        for (var i = 0; i < obj.data.length; i++) {
            if (!Validate.validate(obj.data[i])) {
                tipHTML += obj.data[i].msg;
                Util.showTip($('#wholeTip'), obj.data[i].msg, "alert alert-danger");
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
    },
    isNum: function (str) {
        var reg = new RegExp("^[0-9]*$");
        return reg.test(str);
    }
};

var Util = {
    ajax: function (url, options) {
        /*
         * success：options->
         *               defaults = {
         success: function () {
         },
         error: function () {
         },
         onShowSuccess: {},
         onShowError: {},
         bindModal: null,
         bindContainer: ['#table-inner'],
         bindUrl: ''
         };
         error:options->
         defaults = {
         onShowTip: {},
         msg: '服务器错误'
         };
         complete:options->
         defaults = {
         do: function (selector) {
         if (selector == null || selector == '')
         selector = "#save-btn";
         if (Exception.btn != null)
         Exception.btn.stop();
         }
         };
         beforeSend:options->
         defaults = {
         do: function (selector) {
         if (selector == null || selector == '')
         selector = "#save-btn";
         Exception.btn = Ladda.create(document.querySelector(selector));
         Exception.btn.start();
         }
         };
         *
         *
         * */
        if (!(typeof url === 'string')) {
            options = url;
        }
        var defaults = {
            url: (typeof url === 'string') ? url : '',
            data: {},
            dataType: 'json',
            type: 'post',
            beforeSend: {},
            success: {},
            error: {},
            complete: {},
            btnSelector: null,
            bindModal: null,
            bindContainer: ['#table-inner'],
            bindUrl: ''
        };
        var opts = $.extend(defaults, options);
        if (opts.btnSelector != null && opts.btnSelector != '' && opts.btnSelector != '#save-btn') {
            opts.beforeSend = {
                selector: opts.btnSelector
            };
            opts.complete = {
                selector: opts.btnSelector
            };
        }
        if (!(opts.success instanceof Function)) {
            opts.success.bindModal = opts.bindModal;
            opts.success.bindContainer = opts.bindContainer;
            opts.success.bindUrl = opts.bindUrl;
        }
        $.ajax({
            url: opts.url,
            data: opts.data,
            dataType: opts.dataType,
            type: opts.type,
            beforeSend: opts.beforeSend instanceof Function ? opts.beforeSend : Exception.beforeSend(opts.beforeSend),
            success: opts.success instanceof Function ? opts.success : Exception.success(opts.success),
            error: opts.error instanceof Function ? opts.error : Exception.error(opts.error),
            complete: opts.complete instanceof Function ? opts.complete : Exception.complete(opts.complete)
        });
    },
    input: function (dom, name, id) {
        var width = dom.width() + 80;
        var height = dom.height();
        var input = $("#template-input").clone();
        input.width(width);
        // input.height(height);
        input.attr('id', id);
        input.css('position', 'relative');
        input.attr('name', name);

        dom.addClass('sr-only');
        dom.after(input);
        return input;
    },
    jsonToString: function (str, param) {
        var reg = /{([^{}]+)}/gm;
        return str.replace(reg, function (match, name) {
            if (param[name] == null)
                return match;
            return param[name];
        });
    },
    mapping: function (originParent, targetParent) {
        //映射方法
        //参数：源dom，目标dom。
        //源属性需要的定义：data-target='target' target可以是任何符合jquery的选择器,
        //  data-method='源值获取方式(默认text,可选text、prop)',data-origin='data-label(默认,可选)'
        //目标属性需要的定：data-inject='val(默认)'暂不可选）
        originParent.find('[data-target]').each(function (index, dom) {
            var method = $(dom).attr('data-method');
            if (method == null || method == '') {
                method = 'text';
            }
            if (method == 'text') {
                targetParent.find($(dom).attr('data-target')).val(Util.reformatText($(dom).text()));
            } else if (method == 'prop') {
                if ($(dom).attr('data-origin') != null && $(dom).val('data-origin') != '') {
                    targetParent.find($(dom).attr('data-target')).val($(dom).attr($(dom).attr('data-origin')));
                } else {
                    targetParent.find($(dom).attr('data-target')).val($(dom).attr('data-label'));
                }
            }
        });
    },
    reBindPjax: function (selector) {
        if (selector == null)
            selector = '#table-inner';
        $(selector).pjax('a[data-label="#table-inner"]', '#table-inner', {
            fragment: '#table-inner',
            cache: true,
            maxCacheLength: 5,
            storage: false,
            replace: true
        });
        $(selector).on('pjax:beforeSend', function (event) { //如果是table层级发生事件，阻止冒泡
            $(this).children('table').html('');
            $(this).children('.table_pjax_loading').first().removeClass('sr-only');
            event.stopPropagation();
        });
        $(selector).on('pjax:complete', function (event) { //如果是table层级发生事件，阻止冒泡
            $(this).children('.table_pjax_loading').first().addClass('sr-only');
            event.stopPropagation();
        });
    },
    loadPageByPjax: function (url) {
        window.location.href = url;
        // Util.loadByPjax(url,{
        //     container:'#page-inner',
        //     showWholeAnimate: true,
        //     showMinAnimate: false,
        //     complete:function(){
        //         Util.loadByPjax(url,{
        //             container:'#main-menu',
        //             showWholeAnimate: false,
        //             showMinAnimate: false,
        //             complete:function(){
        //                 Util.reBindPjax();
        //             }
        //         });
        //     }
        // });
    },
    loadByPjax: function (url, options) {
        var defaults = {
            showWholeAnimate: false,
            showMinAnimate: true,
            before: function () {
            },
            complete: function () {
            },
            container: '#table-inner',
        };
        var opts = $.extend(defaults, options);
        /*$(opts.container).off('pjax:beforeSend');
         $(opts.container).off('pjax:complete');*/
        $(opts.container).one('pjax:beforeSend', function (event) {
            opts.before();
            if (opts.showWholeAnimate) {
                $('#page-inner').html('');
                $('.pjax_loading').css("display", "block");
            }
            if (opts.showMinAnimate) {
                $(this).showLoading();
            }
            event.stopPropagation();
        });
        $(opts.container).one('pjax:complete', function (event) {
            opts.complete();
            if (opts.showWholeAnimate) {
                $('.pjax_loading').css("display", "none");
                Animate.loadWrapper();
            }
            if (opts.showMinAnimate) {
                $(this).closeLoading();
            }
            event.stopPropagation();
        });
        $.pjax({
            url: url,
            container: opts.container,
            fragment: opts.container,
            cache: true,
            maxCacheLength: 5,
            timeout: 8000,
            storage: false,
            replace: true,
            push: true
        });

    },
    formatText: function (str) {
        str = str.replace(/(\r\n)/g, "<br>");

        str = str.replace(/ /g, "&nbsp;");
        /*str = str.replace(/&nbsp;/g, " ");
         str = str.replace(/&amp;/g, "&");
         str = str.replace(/&quot;/g, "\"");
         str = str.replace(/&lt;/g, "<");
         str = str.replace(/&gt;/g, ">");*/
        str = str.replace(/\n/g, "<br>");
        return str;
    },
    reformatText: function (str) {
        if (str == null || str == '')
            return str;
        str = str.replace(/ /g, '');
        /*str = str.replace(/&nbsp;/g, " ");
         str = str.replace(/&amp;/g, "&");
         str = str.replace(/&quot;/g, "\"");
         str = str.replace(/&lt;/g, "<");
         str = str.replace(/&gt;/g, ">");*/
        str = str.replace(/<br>/g, '\n');
        return str;
    },
    redrawSelects: function () {
        $('.selectpicker').selectpicker();
    },
    redrawFileInput: function (options) {
        var defaults = {
            selector: 'input[type="file"]',
            language: 'zh', //设置语言
            uploadUrl: '', //上传的地址
            allowedFileExtensions: ['jpg', 'png', 'gif'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: true,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        };
        var opts = $.extend(defaults, options);
        if (options == null) {
            $('input[type="file"]').fileinput();
        } else {
            $(opts.selector).fileinput(opts);
        }
    },
    reloadByPjax: function (container, options) {
        if (container == null)
            container = '#table-inner';
        var defaults = {
            showWholeAnimate: false,
            showMinAnimate: true,
            before: function () {
            },
            complete: function () {
            }
        };
        var opts = $.extend(defaults, options);
        $(container).one('pjax:beforeSend', function (event) {
            opts.before();
            if (opts.showWholeAnimate) {
                $('#page-inner').html('');
                $('.pjax_loading').css("display", "block");
            }
            if (opts.showMinAnimate) {
                $(this).showLoading();
            }
            event.stopPropagation();
        });
        $(container).one('pjax:complete', function (event) {
            opts.complete();
            if (opts.showWholeAnimate) {
                $('.pjax_loading').css("display", "none");
                Animate.loadWrapper();
            }
            if (opts.showMinAnimate) {
                $(this).closeLoading();
            }
            event.stopPropagation();
        });
        /*var dom = $(container);
         opts.before();
         if (opts.showWholeAnimate) {
         $('#page-inner').html('');
         $('.pjax_loading').css("display", "block");
         }
         if (opts.showMinAnimate) {
         dom.showLoading();
         }
         dom.parent().load(window.location.href+' '+container,function(resp){
         opts.complete();
         if (opts.showWholeAnimate) {
         $('.pjax_loading').css("display", "none");
         Animate.loadWrapper();
         }
         if (opts.showMinAnimate) {
         dom.closeLoading();
         }
         });*/
        $.pjax.reload(container, {
            fragment: container,
            cache: true,
            maxCacheLength: 5,
            timeout: 8000,
            storage: false,
            replace: true,
            push: true
        });

    },
    getzf: function (num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    },
    getMyDate: function (str) {
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds();//最后拼接时间
        return oYear + '/' + Util.getzf(oMonth) + '/' + Util.getzf(oDay) + ' ' + Util.getzf(oHour) + ':' + Util.getzf(oMin) + ':' + Util.getzf(oSen);
    },
    clearPanel: function (dom, options) {
        var defaults = {
            front: '', ends: ['eId', 'CreateTime', 'UpdateTime'], end: '', before: function () {
            }, after: function () {
            }
        };
        if (options != null) {
            $.each(options, function (name, val) {
                defaults[name] = options[name];
            });
        }
        if (defaults.end != null && defaults.end.length > 0) {
            dom.find('input,select').each(function (index, input) {

                if ($(input).attr('id').indexOf(defaults.front) == 0 && $(input).attr('id').lastIndexOf(defaults.end) > 0) {
                    $(input).val('');
                }
            });
        } else {
            for (var i = 0; i < defaults.ends.length; i++) {
                dom.find('input,select').each(function (index, input) {
                    if ($(input).attr('id') == null)
                        return false;
                    if ($(input).attr('id').indexOf(defaults.front) == 0 && $(input).attr('id').lastIndexOf(defaults.ends[i]) > 0) {
                        $(input).val('');
                    }
                });
            }
        }
        if (defaults.hidden) {
            dom.hide();
        }

    },
    tips: []
    ,
    showTip: function (tip, result, className, options) {
        var dom = tip.clone();
        dom.attr('id', '');
        dom.appendTo(tip.parent());
        Util.tips.push(dom);
        if (Util.tips.length > 5) {
            Util.tips[0].remove();
            Util.tips.shift();
        }
        var defaults = {
            time: 3000, before: function () {
            }, complete: function () {
            }
        };
        defaults = $.extend(defaults, options);
        defaults.before();
        dom.addClass(className);
        dom.html(result);
        dom.css("display", "block");
        dom.transition({opacity: 1, y: 10}, 500)
            .transition({opacity: 1}, defaults.time)
            .transition({opacity: 0, y: 0}, 500, function () {
                tip.css("display", "none");
                tip.attr("aria-label", "0");
                defaults.complete();
                tip.attr('class', '');
                dom.remove();
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
        var checkDom = '<div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light"> <input type="checkbox" data-label = ' + op + ' id="' + item + '"> <label for="' + item + '"> ' + item + ' </label> </div>';
        $("#add").before("<div class=\"select form-group\">" + checkDom + "<textarea class=\"form-control\" rows=\"2\" id='testQuestionOption" + op + "'></textarea>" +
            "</div>");
    },
    removeSelect: function (method) {
        var s = $("#add").prev();
        if (method == 'all') {
            while (s.hasClass("select")) {
                s.remove();
                s = $("#add").prev();
            }
        } else if (s.hasClass("select")) {
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
    },
    step: function (dom, myDom) {
        myDom = myDom.parent();
        myDom.siblings().removeClass('active');
        myDom.addClass('active');
        myDom.prevAll().addClass('active');
        dom.click();
    },
    insertArrayByOrder: function (array, value) {
        var str = '[';
        var index = $.inArray(value, array);
        /*$.each(array,function (ind,a) {
         if(a == value)
         index = ind;
         });*/
        if (index >= 0)
            return {'index': index, 'arr': array};
        index = 0;
        var flag = false;
        var isAdd = false;
        for (var i = 0; i < array.length; i++) {
            if (value == parseInt(array[i])) {
                index = i;
                flag = true;
            }
            if (!flag && value < parseInt(array[i])) {
                str += value + ',';
                index = i;
                flag = true;
                isAdd = true;
            }
            str += array[i] + ',';
        }
        if (flag == false) {
            str += value + ',';
            index = array.length;
            isAdd = true;
        }

        str = str.substr(0, str.length - 1);
        str += ']';
        var arr = JSON.parse(str);
        return {'index': index, 'arr': arr, 'isAdd': isAdd};
    },
    update: function (front, id, child) {
        var dd = id;
        if (child == null)
            child = 'td';
        $('#' + front + id).children(child).each(function (index, dom) {
            var len = $(dom).attr('id');
            if (len == null)
                return;
            len = len.lastIndexOf(dd);
            var id = $(dom).attr('id').substr(0, len);
            $('#' + id).val($(dom).attr('data-label'));
        });
    },
    mScroll: function (id, options) {
        var defaults = {
            model: $("html,body"),
            speed: 1000
        };
        var opts = $.extend(defaults, options);
        opts.model.stop(true);
        opts.model.animate({scrollTop: $("#" + id).offset().top}, opts.speed);
    },
    loadResult: function (dom, url, options) {
        /*var evt = arguments.callee.caller.arguments[0] || window.event;
         evt.preventDefault();
         evt.stopPropagation();*/
        var defaults = {
            showAnimation: true,
            before: function () {
            },
            after: function () {
            }
        };
        var opts = $.extend(defaults, options);
        opts.before();
        if (opts.showAnimation) {
            var width = dom.width();
            var height = dom.height();
            var str = '<div style="width:' + width + 'px;height:' + height + 'px" class="panel_loading"> <img src="' + Label.staticServePath + '/images/loading.gif" class="img-sm center-block"/> </div>';
            $(dom).html(str);
        }
        dom.load(url, function () {
            opts.after();
        });
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
    },
    showLoading: function (dom) {
        var width = dom.width();
        var height = dom.height();
        var str = '<div style="width:' + width + 'px;height:' + height + 'px" class="panel_loading"> <img src="' + Label.staticServePath + '/images/loading.gif" class="img-sm center-block"/> </div>';
        dom.html(str);
    }
};
var func = {
    addCertificate: function (method) {
        if (method == 'show') {
            modalUtil.show($('#addCertificateModel'));
        } else {
            var enrollTime = new Date($('#enrollTime_temp').val().replace(/-/g, '/')).getTime();
            var endTime = new Date($('#endTime_temp').val().replace(/-/g, '/')).getTime();
            var addTime = new Date($('#addTime_temp').val().replace(/-/g, '/')).getTime();
            $('#addTime').val(addTime);
            $('#endTime').val(endTime);
            $('#enrollTime').val(enrollTime);
            var json = {};
            $('#certificate').find('input,select').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax(Label.staticServePath + '/certificateManager/postCertificate', {
                data: json,
                success: function (data, status) {
                    Util.showTip($('#wholeTip'), data.msg, 'alert alert-success');
                    modalUtil.hideClear($('#addCertificateModel'), {
                        after: function () {
                            Util.reloadByPjax('#table-inner');
                        }
                    });

                }
            });
        }
    },
    updateCertificate: function (method, id) {
        modalUtil.show($('#addCertificateModel'));
        $('#studentId').selectpicker('val', $('#name' + id).attr('data-label'));
        $('#addTime_temp').val($('#addTime' + id).text());
        $('#enrollTime_temp').val($('#enrollTime' + id).text());
        $('#endTime_temp').val($('#endTime' + id).text());
        $('#certificateId').val(id);
        $('#code').val($('#code' + id).text());

    },
    deleteCertificate: function (method, id) {
        if (confirm("确认删除？")) {
            Util.ajax(Label.staticServePath + "/certificateManager/deleteCertificate/" + id);
        }
    },
    addRepayment: function (method) {
        if (method == 'show') {
            modalUtil.show($('#addRepaymentModel'));
        } else {
            var time = new Date($('#enrollTime_temp').val().replace(/-/g, '/')).getTime();
            $('#enrollTime').val(time);
            var json = {};
            $('#repayment').find('input,select').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax(Label.staticServePath + '/repaymentManager/postRepayment', {
                data: json,
                success: {
                    bindModal: $('#addRepaymentModel')
                }
            });
        }
    },
    updateRepayment: function (method, id) {
        modalUtil.show($('#addRepaymentModel'));
        $('#repaymentId').val(id);

    },
    deleteRepayment: function (method, id) {
        if (confirm("确认删除？")) {
            Util.ajax(Label.staticServePath + "/repaymentManager/deleteRepayment/" + id);
        }
    },
    addAttendance: function (method, id) {
        if (method == 'table') {
            $('tr#core_form').show(1000);
            $('#core_studentId').val(id);
            Util.mScroll('core_form', {model: $('#modal')});
            //noinspection JSDuplicatedDeclaration
            var defaultTime = new Date();
            $('#core_time_temp').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-' + Util.getzf(defaultTime.getDate()));
        } else if (method == 'table-save') {
            $('#core_createTime').val(new Date().getTime());
            $('#core_time').val(new Date($('#core_time_temp').val().replace(/-/g, '/')).getTime());
            var json = {};
            $('#core_form').find('input,select').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax(Label.staticServePath + '/attendanceManager/postAttendance', {
                success: {
                    bindModal: $('#modal')
                }
            });
        } else if (method == 'show') {
            modalUtil.show($('#addAttendanceModal'));
            $('#studentId').val(id);
            var name = $('#' + id).find('td').first().text().replace(/ /g, '');
            $('#studentName').val(name);
            var defaultTime = new Date();
            $('#time_temp').val(defaultTime.getFullYear() + '-' + Util.getzf(defaultTime.getMonth() + 1) + '-' + Util.getzf(defaultTime.getDate()));
        } else {
            $('#createTime').val(new Date().getTime());
            $('#time').val(new Date($('#time_temp').val().replace(/-/g, '/')).getTime());
            var json = {};
            $('#attendance').find('input,select').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax(Label.staticServePath + '/attendanceManager/postAttendance', {
                data: json,
                bindModal: $('#addAttendanceModal')
            });
        }
    },
    updateAttendance: function (method, id, sid) {
        if (method == 'table') {
            $('tr#core_form').show(1000);
            $('#core_studentId').val(sid);
            $('#core_attendanceId').val(id);
            $('#core_message').val($('#core_message' + id).text().replace(/ /g, ''));
            $('#core_time_temp').val($('#core_time' + id).text().replace(/ /g, ''));
            return;
        }
        modalUtil.show($('#modal'));
        var start_list = new Date($("#all_start_time_list").val().replace(/-/g, "/"));
        var end_list = new Date($('#all_end_time_list').val().replace(/-/g, '/'));
        end_list.setDate(end_list.getDate() + 1);
        loadResult($('#load_pre'),
            Label.staticServePath + '/attendanceManager/previewAttendanceList?student=' +
            id + '&start_time_list=' + start_list.getTime() + '&end_time_list=' + end_list.getTime(), {
                after: Util.redrawSelects
            });
    },
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
            var d = "";
            for (var i = 0; i < data.length; i++) {
                d += data[i] + ":";
            }
            if (d.length > 0)
                d = d.substr(0, d.length - 1);
            $('#treeData').val(d);
            $('#createTime').val(new Date().getTime());
            var json = {};
            $('#role').find('input').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax(Label.staticServePath + '/userManager/addRole', {
                data: json,
                btnSelector: '#saveRole-btn'
            });
        }
    },
    addUser: function (method) {
        if (method == 'show') {
            modalUtil.toggleClear($('#addUserModel'));
            /*func.showPermissions(0, '', 'permissions');*/
        } else {
            var json = {};
            $('#createTime').val(new Date().getTime());
            $('#user').find('.form-control').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax({
                url: Label.staticServePath + '/userManager/addUser',
                btnSelector: '#saveUser-btn',
                data: json,
                bindModal: $('#addUserModel'),
                bindContainer: ['#page-inner']
            })
        }
    },
    addStudent: function (method) {
        if (method == 'show') {
            modalUtil.toggleClear($('#addStudentModel'));
        } else {
            $('#createTime').val(new Date().getTime());
            var json = {};
            $('#student').find('.form-control').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax({
                url: Label.staticServePath + '/studentManager/addStudent',
                data: json,
            });
        }
    },
    addTestQuestion: function (method) {
        if (method == 'show') {
            modalUtil.show($('#addTestQuestion'));
            Util.changeModel($('#testQuestionTypeId'));
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
            while ($('#testQuestionOption' + i).is('textarea')) {
                var a = String.fromCharCode(first.charCodeAt() + i);
                if ($('#' + a).prop('checked')) {
                    answers.push($('#' + a).attr('data-label'));
                }
                selects[i] = $('#testQuestionOption' + (i++)).val();
            }
            $('#testQuestionContent').val(JSON.stringify(selects));
            $('#testQuestionShortAnswer').val(JSON.stringify(answers));
            if ((answers == '[[],[]]' || answers == null || answers == '') && ($('#testQuestionLongAnswer').val() == null || $('#testQuestionLongAnswer').val() == '')) {
                Util.showTip($('#wholeTip'), '答案不能为空', 'alert alert-danger');
                return;
            }
            //---------------填充选项及答案结束------------
            var json = {};
            $('#testQuestion').find('.form-control').each(function () {
                if ($(this).attr('name') != null)
                    json[$(this).attr('name')] = Util.formatText($(this).val());
            });
            Util.ajax({
                url: Label.staticServePath + "/test/addTestQuestion",
                data: json,
                bindModal: $('#addTestQuestion')
            });
        }
    },
    addTestQuestionnaire: function (method) {
        if (method == 'show') {
            // $('#inputQuestionnairePanel').show();
            var modelNav = $('#model-nav');
            var modelPane = $('#model-content');
            var nav = $('#add-nav');
            var content = $('#addTestQuestionnaire');
            $('#distribute-nav').removeClass('active');
            $('#distribute').removeClass('active');
            nav.addClass('active');
            content.addClass('active');
            modelNav.removeClass('hidden');
            modelNav.append(nav);
            modelPane.append(content);
        }
        else {
            var json = {};
            var id = $('#testQuestionnaireId').val();
            if (id == null || id == '')
                $('#testQuestionnaireCreateTime').val(new Date().getTime());
            $('#testQuestionnaireUpdateTime').val(new Date().getTime());
            $('#testQuestionnaireOperaterId').val(Label.userId);
            var qqs = [];
            var sum = 0;
            $('.subject_list').find('.que').each(function (index, dom) {
                var qj = {};
                var qId = $(dom).attr('id');
                var qVal = $(dom).val();
                qj['testQuestionId'] = '' + qId;
                qj['testQuestionScore'] = '' + qVal;
                sum += parseInt($(dom).val());
                qqs.push(qj);
            });
            json["questionnaireQuestions"] = JSON.stringify(qqs);
            $('#testQuestionnaireScore').val(sum);
            $('#testQuestionnaire').find('.form-control').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax({
                url: Label.staticServePath + "/test/addTestQuestionnaire",
                data: json,
                success: function (data, state) {
                    Util.showTip($('#wholeTip'), data.msg, 'alert alert-success', {
                        time: 1000, complete: function () {
                            Util.reloadByPjax('#table-inner');
                            closePanel('#add-nav', '#addTestQuestionnaire');
                            Util.clearPanel($('#inputQuestionnairePanel'), {hidden: false});
                        }
                    });
                }
            })
        }
    },
    updateApproval: function () {

    },

    seeApproval: function (method, classId) {
        modalUtil.show($('#seeApprovalModel'));
        var className = $('#title-' + classId).val();
        loadResult($('#approval-modal'), Label.staticServePath + "/approvalManager/showStudentDetails?classId=" + classId + "&className=" + className);
    },
    submitApply: function () {
        var data = [];

        var jsonData = [];
        $("tr[name='submit-tr']").each(function (index, dom) {
            var list = $(dom).find('input[name]');
            if (list.length <= 0)
                return true;
            var json = {};
            list.each(function (ind, d) {
                json[$(d).attr('name')] = $(d).val();
            });
            jsonData.push(json);
            // data.push(json);
        });
        var modal = $('#submitApplyModel');
        //备注
        var remarks = modal.find('textarea:first').val();
        //审批人id
        var id = $("#classSelect_list").val();
        data.push(remarks);
        data.push(id);
        data.push(jsonData);
        Util.ajax(Label.staticServePath + "/subsidyManager/confirmSubmit", {
            data: {
                'list': JSON.stringify(data)
            },
            btnSelector: '#save-submit-btn',
            bindModal: modal
        });


        // Util.loadPageByPjax(Label.staticServePath + '/approvalManager');

    },
    deleteApply: function (method, classId) {
        if (method == 'show') {
            if (confirm('确认删除？')) {
                Util.ajax({
                    url: Label.staticServePath + "/subsidyManager/deleteSubsidyClassInfo",
                    data: {
                        'classId': classId
                    }
                });
            }
        }
    },
    addDetails: function () {
        var data = [];
        var modal = $("#seeApplyModel");
        modal.find('tr').each(function (index, dom) {
            if (!$(dom).find('input[type="checkbox"]').prop('checked'))
                return true;
            var list = $(dom).find('input[name]');
            if (list.length <= 0)
                return true;
            var json = {};

            list.each(function (idx, d) {
                json[$(d).attr('name')] = $(d).val();
            });
            data.push(json);
        });
        Util.ajax(Label.staticServePath + "/subsidyManager/updateSubsidyClassInfo", {
            data: {
                'list': data,
                "length": data.length,
            },
            btnSelector: '#sa-btn',
            success: {
                bindModal: modal,
            }
        })
    },
    seeApply: function (method, id) {
        modalUtil.show($('#seeApplyModel'));
        Util.ajax(Label.staticServePath + "/subsidyManager/getSubsidyClassInfo", {
            data: {
                'classId': id
            },
            success: function (data, status) {
                if (data.state == 'success') {
                    var json = JSON.parse(data.msg);
                    json.map(function (elem, num) {
                        var str = '<tr id="tr{id}">' +
                            '<td></td>' +
                            '<td class="hidden"><input name="applicationDate" value="{applicationDate}"/><input name="id" value="{id}"/><input name="studentId" value="{studentId}"/><input name="classId" value="{classId}"/></td>' +
                            '<td>{studentName}</td>' +
                            '<td class=" z-money-cny">{subsidyAmount}</td>' +
                            '<td>{residualFrequency}</td>' +
                            '<td><input value="{bonus}" class="form-control"  id="input-text{id}" name="bonus"></td>' +
                            '<td>{status}</td>' +
                            '</tr>';
                        str = Util.jsonToString(str, elem);
                        $('#seeApplyModel').find('tbody:first').append(str);
                        var ckeckBoox = $("#index-look").parent().clone();
                        var input = ckeckBoox.find('input:first');
                        var label = ckeckBoox.find('label:first');
                        input.attr('tag', 'input');
                        input.val(elem['id']);
                        if (elem['checked'] == 11) {
                            console.log(elem['checked']);
                            input.attr('checked', '');
                        }
                        input.attr('id', 'index-look' + elem['id']);
                        label.attr('for', "index-look" + elem['id']);
                        $('tr#tr' + elem['id']).find('td:first').append(ckeckBoox);
                    });
                    $('#seeApplyModel').one('hidden.bs.modal', function () {
                        $(this).find('tbody:first').html('');
                    });
                }
            }
        });
    },
    submitApplyClass: function (method) {
        var modal = $('#addApplyModel');
        if (method == 'up') {
            var json = [];
            var x = 0;
            modal.find("input[tag='input']").each(function (index, dom) {
                if ($(this).prop('checked')) {
                    json[x++] = $(this).attr('name');
                }
            });
            Util.ajax(Label.staticServePath + '/subsidyManager/addRegionSubsidyClass', {
                type: 'post',
                data: {
                    'classId': JSON.stringify(json)
                },
                bindModal: modal
            });
        }
    },
    addApplyClass: function (method) {
        var model = $('#addApplyModel');
        if (method == "show") {
            modalUtil.toggleClear(model);
            Util.ajax(Label.staticServePath + "/subsidyManager/showRegion", {
                dataType: 'json',
                success: function (data, status) {
                    var json = JSON.parse(data.msg);
                    json.map(function (elems, index) {
                        var head = '<li role="presentation" {headClassName}><a href="#role{id}" role="tab" data-toggle="tab" {tag} data-label="{id}">{regionName}</a></li>';
                        var body = '<div role="tabpanel" {bodyClassName} id="role{id}" ></div>';
                        if (index == 0) {
                            head = Util.jsonToString(head, {'tag': 'tag="tag1"'});
                            head = Util.jsonToString(head, {'headClassName': 'class="active"'});
                            body = Util.jsonToString(body, {'bodyClassName': 'class="tab-pane active"'});
                        } else {
                            head = Util.jsonToString(head, {'tag': 'tag="tag"'});
                            head = Util.jsonToString(head, {'headClassName': ''});
                            body = Util.jsonToString(body, {'bodyClassName': 'class="tab-pane"'})
                        }
                        head = Util.jsonToString(head, elems);
                        body = Util.jsonToString(body, elems);

                        model.find('ul:first').append(head);
                        model.find('#classBody').append(body);

                        var regionDiv = region($(this));
                        var input = regionDiv.find('input:first');
                        input.attr('id', 'parent-input' + elems['id']);
                        input.val(elems['id']);
                        regionDiv.find('label:first').attr('for', 'parent-input' + elems['id']);
                        $('div#' + 'role' + elems['id']).append(regionDiv);
                    });
                    if (json.length > 0) {
                        showTemplate(json[0]['id']);
                    }

                    $('a[tag="tag"]').one('shown.bs.tab', function () {
                        showTemplate($(this).attr('data-label'));
                    });
                    model.one('hidden.bs.modal', function () {
                        $(this).find('#class-add-ul').html('');
                        $(this).find('#classBody').html('');
                        $('div.tab-pane').off('shown.bs.tab');
                    });
                }
            });
        } else {
            var modelSub = $('#submitApplyModel');
            modalUtil.show(modelSub);
            var classNumber = 0;
            var number = 0;
            var totalSubsidy = 0;
            var totalBonus = 0;
            var aggregateAmount = 0;
            $("tr[name='submit-tr']").each(function () {
                classNumber++;
                number += parseInt($(this).find("td[name='number']").text());
                totalSubsidy += parseInt($(this).find("td[name='totalSubsidy']").text());
                totalBonus += parseInt($(this).find("td[name='totalBonus']").text());
                aggregateAmount += parseInt($(this).find("td[name='aggregateAmount']").text());
            });
            modelSub.find("span#submit-class").text(classNumber);
            modelSub.find("span#submit-student").text(number);
            modelSub.find("span#submit-subsidy").text(totalSubsidy);
            modelSub.find("span#submit-bonus").text(totalBonus);
            modelSub.find("span#submit-total").text(aggregateAmount);
        }
    },
    seeStudent: function (method, studentId) {
        modalUtil.show($("#studentInformationModel"));
        loadResult($('#showInfo'), Label.staticServePath + "/studentManager/showStudentInfo?studentId=" + studentId);
        // $('#showInfo').load(Label.staticServePath+"/studentManager/shouInfo")
    },
    getRepairClass: function (studentId, grade) {
        var modal = $("#updateInformationModel");
        var classInfoDiv = modal.find("#classInfo-div");
        var classSelectDiv = modal.find("#classSelect-div");
        if (grade == 3) {
            Util.ajax(Label.staticServePath + "/studentManager/getRepairClassByStudentId", {
                data: {
                    'studentId': studentId,
                },
                success: function (data) {
                    var select = classSelectDiv.find('select:first');
                    var json = JSON.parse(data.msg);
                    json.map(function (elem) {
                        var option =
                            // '<input class="hide" name="classId" value="{id}">'+
                            '<input id="input{id}" class="hide"  value="{className}">' +
                            '<option  value="{id}">{className}</option>';
                        option = Util.jsonToString(option, elem);
                        select.append(option);
                    })
                    console.log(select.val());
                    classInfoDiv.addClass('hide');
                    classSelectDiv.removeClass('hide');
                },
            })
        } else {
            classSelectDiv.addClass('hide');
            classInfoDiv.removeClass('hide');
            classSelectDiv.find("select:first").html('');
        }
    },
    updateStudent: function (method, studentId) {
        if (method == 'show') {
            modalUtil.show($("#updateInformationModel"));
            loadResult($('#updateInfo'), Label.staticServePath + "/studentManager/showUpdateStudentInfo?studentId=" + studentId);
        } else {
            var modal = $("#updateInformationModel");
            var birthdayInput = modal.find('input#birthday-input');
            var graduationTimeInput = modal.find('input#graduationTime-input');
            var birthday = new Date(birthdayInput.val().replace(/-|年|月|日/g, "/"));
            var graduationTime = new Date(graduationTimeInput.val().replace(/-|年|月|日/g, "/"));
            console.log("birthday=" + birthday);
            console.log("graduationTime=" + graduationTime);
            if (!(birthday == "Invalid Date" || graduationTime == "Invalid Date")) {
                birthdayInput.val(birthday.getTime());
                graduationTimeInput.val(graduationTime.getTime());
            }
            var list = modal.find('input[name]');
            if (list.length <= 0)
                return true;
            var json = {};
            list.each(function (index, dom) {
                json[$(dom).attr('name')] = $(dom).val();
            })

            Util.ajax(Label.staticServePath + "/studentManager/updateStudentInfo", {
                data: {
                    'list': json,
                },
                btnSelector: '#update-student-btn',
                bindModal: modal,
            })

        }
    },

    seeUnEmploy: function (method, id) {
        if (method == 'up') {

        } else {
            modalUtil.show($('#seeUnEmployModel'));
            loadResult($('#detailInfo'), Label.staticServePath + "/studentManager/showStudentInfo?studentId=" + id);
        }
    },

    employmentTrack: function (method, id) {
        if (method == 'up') {
            var modal = $('#trackModel');
            var json = {};
            $('#track').find('.form-control').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax({
                url: Label.staticServePath + '/studentEmploymentManager/addTrackInfo',
                data: json,
                bindModal: modal
            });
        } else {
            Util.update('student', id);
            modalUtil.show($('#trackModel'));
            $('#studentId').val(id);
            Util.ajax(Label.staticServePath + "/studentEmploymentManager/getTrackInfo", {
                data: {
                    'stuId': id
                },
                success: function (data) {
                    if (data.state == 'success') {
                        var json = JSON.parse(data.msg);
                        json.map(function (elem, num) {
                            var str = '<tr id="tr{id}">' +
                                '<td class="hidden"><input name="id" value="{id}"/><input name="targetId" value="{targetId}"/><input name="operaterId" value="{operaterId}"/>' +
                                '<td>' + Util.getMyDate(elem['trackTime']) + '</td>' +
                                '<td>{targetName}</td>' +
                                '<td>{situation}</td>' +
                                '<td>{operater}</td>' +
                                '</tr>';
                            str = Util.jsonToString(str, elem);
                            $('#trackModel').find('tbody:first').append(str);
                        });
                        $('#trackModel').one('hidden.bs.modal', function () {
                            $(this).find('tbody:first').html('');
                        });
                    }
                }
            });
        }
    },

    employmentApproval: function (method, id) {
        if (method == 'up') {
            var json = {};
            var id = $('#selectApproverId').val();
            var text = $("#selectApproverId").find("option:selected").text();
            json['studentEmployment.approverId'] = id;
            json['studentEmployment.approver'] = text;
            $('#seApproveList').find('.form-control').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax({
                url: Label.staticServePath + "/studentEmploymentManager/addEmploymentApply",
                data: json,
                success: function (data) {
                    if (data.state == 'success') {
                        $('#employmentApprovalModel').one('hidden.bs.modal', function () {
                            $(this).find('tbody:first').html('');
                        });
                        Util.reloadByPjax('#table-inner', {fragment: '#table-inner'});
                    }
                }

            });
        } else {
            Util.update('student', id);
            $('#studentId').val(id);
            modalUtil.show($('#employmentApprovalModel'));
            Util.redrawSelects();
        }

    },

    seeEmpApp: function (method, id) {

    },

    agreeEmpApp: function (method, id) {
        Util.ajax(Label.staticServePath + "/studentEmploymentManager/dealEmploymentApply",
            {
                type: "POST",
                data: {
                    seId: id,
                    as: 8
                },
                success: function (data) {
                    Util.reloadByPjax('#table-inner', {fragment: '#table-inner'});
                }
            });
    },

    disagreeEmpApp: function (method, id) {
        Util.ajax(Label.staticServePath + "/studentEmploymentManager/dealEmploymentApply",
            {
                type: "POST",
                data: {
                    seId: id,
                    as: 13
                },
                success: function (data) {
                    Util.reloadByPjax('#table-inner', {fragment: '#table-inner'});
                }
            });
    },

    deleteStudent: function () {

    },
    seeClassStudent: function (method, classId) {
        Util.loadByPjax(Label.staticServePath + "/studentManager/pageJump?classId=" + classId, {
            container: '#class-details'
        });
    },
    addClass: function (method) {
        if (method == 'up') {
            var json = {};
            var id = $('#classId').val();
            if (id == null || id == '')
                $('#classCreateTime').val(new Date().getTime());
            $('#classUpdateTime').val(new Date().getTime());
            $('#classOperaterId').val(Label.userId);
            $('#class').find('.form-control').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax({
                url: Label.staticServePath + "/classManager/addClass",
                data: json,
                bindModal: $('#addClassModel')
            })
        }
        else {
            modalUtil.show($('#addClassModel'));
            $('#studentCnt').val(0);
        }
    },
    addDomain: function (method) {
        if (method == 'show') {
            $('#addDomainModel').modal(method);
            loadResult($('#panel-container'), Label.staticServePath + "/test/panelTags");
        } else {
            var json = {};
            $('#domainCreateTime').val(new Date().getTime());
            $('#domainUpdateTime').val(new Date().getTime());
            $('#domainOperaterId').val(Label.userId);
            $('#domain').find('.form-control').each(function () {
                json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax({
                url: Label.staticServePath + "/test/addDomain",
                data: json,
                success: {
                    bindModal: $('#addDomainModel')
                }
            })
        }
    },
    updateDomain: function (method, id) {
        Util.update('domain', id);
        $('#domainId').val(id);
        $('#addDomainModel').modal('show');
        loadResult($('#panel-container'), Label.staticServePath + "/test/panelTags/" + id);
    },
    deleteAttendance: function (id) {
        if (confirm("确认删除？")) {
            Util.ajax(Label.staticServePath + "/attendanceManager/deleteAttendance/" + id);
        }
    },
    deleteDomain: function (method, id) {
        if (confirm("确认删除？")) {
            Util.ajax(Label.staticServePath + "/test/deleteDomain/" + id);
        }
    },
    distributeTestQuestionnaire: function (method) {
        if (method == 'show') {
            var modelNav = $('#model-nav');
            var modelPane = $('#model-content');
            var nav = $('#distribute-nav');
            var content = $('#distribute');
            $('#add-nav').removeClass('active');
            $('#addTestQuestionnaire').removeClass('active');
            nav.addClass('active');
            content.addClass('active');
            modelNav.removeClass('hidden');
            modelNav.append(nav);
            modelPane.append(content);
            $('#testQuestionnaireStartTime').val(Util.getMyDate(new Date().getTime()));
            $('#testQuestionnaireEndTime').val(Util.getMyDate(new Date().getTime()));
        } else {
            var st = $('#testQuestionnaireStartTime');
            var end = $('#testQuestionnaireEndTime');
            var json = {};
            st.val(new Date(st.val()).getTime());
            end.val(new Date(end.val()).getTime());
            $('#testQuestionnaireClass').find('.form-control').each(function () {
                if ($(this).attr('name') != null)
                    json[$(this).attr('name')] = $(this).val();
            });
            Util.ajax({
                url: Label.staticServePath + "/test/addQuestionnaireClass",
                data: json,
                success: function (data, state) {
                    Util.showTip($('#wholeTip'), data.msg, 'alert alert-success');
                    Util.reloadByPjax('#chart-inner', {fragment: '#chart-inner'});
                    closePanel('#distribute-nav', '#distribute');
                    Util.mScroll('page-inner');
                }
            })
        }
    },
    updateClass: function (method, id) {
        Util.update('class', id);
        $('#classId').val(id);
        modalUtil.show($('#addClassModel'));
        Util.mapping($('tr#class' + id), $('#form'));
    },
    updateTestQuestionnaire: function (method, id) {
        Util.update('testQuestionnaire', id);
        $('#testQuestionnaireId').val(id);
        // $('#inputQuestionnairePanel').show();
        var modelNav = $('#model-nav');
        var modelPane = $('#model-content');
        var nav = $('#add-nav');
        var content = $('#addTestQuestionnaire');
        $('#distribute-nav').removeClass('active');
        $('#distribute').removeClass('active');
        nav.addClass('active');
        content.addClass('active');
        modelNav.removeClass('hidden');
        modelNav.append(nav);
        modelPane.append(content);
    },
    updateTestQuestion: function (method, id) {
        modalUtil.show($('#addTestQuestion'));
        $('div#shortModel').find('div').each(function (index, dom) {
            $(dom).remove();
        });
        $('#id').val(id);

        Util.mapping($('tr#tr' + id), $('form#testQuestion'));
        Util.mapping($('tr#show-tr' + id), $('form#testQuestion'));
        Util.changeModel($('#testQuestionTypeId'));
        //$('#testQuestionTitle').val($('#testQuestionTitle' + id).text());
        //$('#testQuestionTypeId').val($('#type' + id).attr('data-label'));
        /*var tags = [];
         $('#tagsLabel' + id).find('span').each(function (index, dom) {
         tags.push($(this).text());
         $('#tagCheckbox' + $(this).attr("data-label")).prop('checked', true);
         });*/
        //var tagVal = tags.join(',');
        //$('input#tags').val(tagVal);
        //$('#testQuestionLongAnswer').val($('#item' + id + '>pre.long-answer:tnd(1)').find('').first().text());
        //填充选项
        var op = $('#testQuestionSelect' + id).children();
        var len = op.length;
        var optionValues = [];
        var optionAnswer = [];
        op.each(function (index, dom) {
            optionValues.push($(dom).find('.optionValue').first().text());
        });

        var item = 'A';
        for (var i = 0; i < len; i++) {
            $('#add').click();
            item = String.fromCharCode(item.charCodeAt() + i);
            $('#testQuestionOption' + i).val(optionValues[i]);
        }
        $('#show-tr' + id + ' .short-answer').each(function (index, dom) {
            $('#' + $(this).text()).prop('checked', true);
        })
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
    deleteQuestionnaire: function (method, id) {
        if (confirm("确认删除？")) {
            Util.ajax(Label.staticServePath + "/test/deleteQuestionnaire/" + id);
        }
    },
    deleteTestQuestion: function (method, id) {
        if (confirm("确认删除？")) {
            Util.ajax(Label.staticServePath + "/test/deleteTestQuestion/" + id);
        }
    },
    deleteClass: function (method, id) {
        if (confirm("确认删除？")) {
            Util.ajax(Label.staticServePath + "/classManager/deleteClass/" + id);
        }
    },
    showPermissions: function (left, mappingId, divId, method) {
        if (method == 'all') {
            Util.ajax({
                url: Label.staticServePath + '/userManager/showAllPermissons/' + mappingId,
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
        Util.ajax({
            url: Label.staticServePath + '/userManager/showPermissions/' + mappingId,
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
    },
    delayTest: function (id) {
        Util.ajax(Label.staticServePath + '/test/delayTest/' + id);
    },
    closeTest: function (id) {
        Util.ajax(Label.staticServePath + '/test/closeTest/' + id);
    }
};
var modalUtil = {
    show: function (modal) {
        modal.one('hide.bs.modal', function () {
            modal.find('input[name],textarea[name]').val('');
            modal.find('select[name] option:first').prop('selected', 'selected');
        });
        modal.modal('show');
    },
    toggleClear: function (modal) {
        modal.modal('toggle');
    },
    hideClear: function (model, options) {
        var defaults = {
            front: '', ends: ['eId', 'CreateTime', 'UpdateTime'], end: '', before: function () {
            }, after: function () {
            }
        };
        if (options != null) {
            $.each(options, function (name, val) {
                defaults[name] = options[name];
            });
        }
        if (defaults.end != null && defaults.end.length > 0) {
            model.find('input,select').each(function (index, input) {

                if ($(input).attr('id').indexOf(defaults.front) == 0 && $(input).attr('id').lastIndexOf(defaults.end) > 0) {
                    $(input).val('');
                }
            });
        } else {
            for (var i = 0; i < defaults.ends.length; i++) {
                model.find('input,select').each(function (index, input) {
                    if ($(input).attr('id') == null)
                        return false;
                    if ($(input).attr('id').indexOf(defaults.front) == 0 && $(input).attr('id').lastIndexOf(defaults.ends[i]) > 0) {
                        $(input).val('');
                    }
                });
            }
        }
        model.modal('hide');
        model.one('hidden.bs.modal', function (e) {
            defaults.after();
        })

    }
};
var Test = {
    testPjaxReload: function () {
        $.pjax.reload('#page-inner', {
            fragment: '#page-inner',
            type: 'get',
            replace: false,
            push: true,
            timeout: 5000
        });
    }
};


var Exception = {
    btn: null,
    success: function (options) {
        /** 参数接受
         *   success:
         *      类型：方法->当接收到RenderKit.renderSuccess时的处理方法
         *   error:
         *      类型：方法->当接收到RenderKit.renderError时的处理方法
         *   onShowSuccess:
         *      类型：json对象->当展示tip时的处理设置
         **/
        return function (data) {
            var defaults = {
                success: function () {
                },
                error: function () {
                },
                onShowSuccess: {},
                onShowError: {},
                bindModal: null,
                bindContainer: ['#table-inner'],
                bindUrl: ''
            };
            if (typeof options.bindContainer === 'string') {
                options.bindContainer = [options.bindContainer];
            }
            var opts = $.extend(defaults, options);
            var bind = function () {
                if (opts.bindContainer.length > 0) {
                    opts.bindContainer.map(function (obj, index) {
                        Util.reloadByPjax(obj);
                    });
                }
                if (opts.bindUrl != null && opts.bindUrl != '') {
                    Util.loadByPjax(opts.bindUrl);
                }
            }
            if (data.state == 'success') {
                if (data.msg == null || data.msg == '')
                    data.msg = '操作成功';
                Util.showTip($('#wholeTip'), data.msg, "alert alert-success", opts.onShowSuccess);
                if (opts.bindModal != null) {
                    modalUtil.hideClear(opts.bindModal, {
                        after: bind
                    });
                } else {
                    bind();
                }
                opts.success();
            }
            else if (data.state == 'error') {
                if (data.msg == null || data.msg == '')
                    data.msg = '操作失败';
                Util.showTip($('#wholeTip'), data.msg, "alert alert-danger", opts.onShowError);
                opts.error();
            }
        }
    },
    error: function (options) {
        return function (XMLHttpRequest, textStatus, errorThrown) {
            var defaults = {
                onShowTip: {},
                msg: '服务器错误'
            };
            var opts = $.extend(defaults, options);
            //Util.showTip($('#wholeTip'), opts.msg, "alert alert-danger", opts.onShowTip);
            Util.showTip($('#wholeTip'), XMLHttpRequest.responseJSON.msg, "alert alert-danger", opts.onShowTip);
        }
    },
    complete: function (options) {
        return function (XMLHttpRequest, textStatus) {
            var defaults = {
                do: function (selector) {
                    if (selector == null || selector == '')
                        selector = "#save-btn";
                    if (Exception.btn != null)
                        Exception.btn.stop();
                }
            };
            var opts = $.extend(defaults, options);
            opts.do(opts.selector);
        }
    },
    beforeSend: function (options) {
        return function (XMLHttpRequest) {
            var defaults = {
                do: function (selector) {
                    if (selector == null || selector == '')
                        selector = "#save-btn";
                    if (document.querySelector(selector) != null) {
                        Exception.btn = Ladda.create(document.querySelector(selector));
                        Exception.btn.start();
                    }
                }
            };

            var opts = $.extend(defaults, options);
            opts.do(opts.selector);
        }
    }
};