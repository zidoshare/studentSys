/**
 * Created by wuhongxu on 2016/12/2 0002.
 */
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
    }
}
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
            var opts = $.extend(defaults, options);
            var bind = function () {
                if (opts.bindContainer.length > 0) {
                    for (var obj in opts.bindContainer) {
                        if ($(opts.bindContainer[obj]).length == 0)
                            continue;
                        Util.reloadByPjax(opts.bindContainer[obj]);
                    }
                }
                if (opts.bindUrl != null && opts.bindUrl != '') {
                    Util.loadByPjax(opts.bindUrl);
                }
            }
            if (data.state == 'success') {
                if (data.msg == null || data.msg == '')
                    data.msg = '操作成功';
                Util.showTip($('#wholeTip'), data.msg, "alert alert-success", opts.onShowSuccess);
                console.log(opts.bindModal);
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