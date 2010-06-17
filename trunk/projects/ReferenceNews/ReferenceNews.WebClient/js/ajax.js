var ajaxPool = [];
function ajax(delegate, uri, data, method, encoding, errors) {
    if (!uri) { alert('错误：未指知异步请求URI，操作失败。'); return; }
    if (!data) data = '';
    if (!method) method = 'get';
    if (!encoding) encoding = 'utf-8';

    var http = ajaxPool.pop();
    if (typeof http == 'undefined' || http == null) {
        var flag = 0;

        if (window.XMLHttpRequest) {
            http = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            var progIDs = ['Msxml2.XMLHTTP', 'Microsoft.XMLHTTP'];

            for (var i = 0; i < progIDs.length; i++) {
                try {
                    http = new ActiveXObject(progIDs[i]);
                    break;
                } catch (ex) { }
            }
        } else {
            flag = 1;
        }

        if (flag) {
            var div = document.createElement('div');
            var rnd = hexRnd('FFFFFF', 16);
            div.innerHTML = '<iframe id="nic_ajax_' + rnd + '" style="width:0px;height:0px;"></iframe>';
            document.body.appendChild(div);
            http = document.getElementById('nic_ajax_' + rnd);
            http.onreadystatechange = function() {
                this.status = this.contentWindow.document.body.innerHTML == '' ? 0 : 200;
                this.responseText = this.contentWindow.document.body.innerHTML;
                statechange();
            }
        }
    }

    if (http.tagName && http.tagName.toLowerCase() == 'iframe')
        http.src = uri;
    else {
        try {
            http.abort();
            http.open(method, uri, true);
            if (method == 'post')
                http.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
            http.setRequestHeader('content-type', 'text/html;charset=' + encoding);
            http.setRequestHeader('user-agent', 'MSIE 6.0');
            http.onreadystatechange = statechange;
            http.send(data);
        } catch (e) {
            alert('错误：（在准备申请“' + uri + '”资源时）\r\n' + e.message);
            ajaxPool.push(http);
        }
    }

    function hexRnd(hex) {
        return parseInt(Math.random() * parseInt(hex, 16)).toString(16);
    }

    function statechange() {
        if (http.readyState == 4) {
            switch (http.status) {
                case 200:
                    if (delegate) delegate(http.responseText, http);
                    ajaxPool.push(http);
                    break;
                default:
                    ajaxPool.push(http);
                    if (!errors) errors = 0;
                    if (++errors < 100)
                        setTimeout(function() {
                            ajax(delegate, uri, data, method, encoding);
                        }, 1000);
                    window.defaultStatus = '错误：（在申请“' + uri + '”资源时）\r\n网络断线或超时(' + errors + '次。';
                    break;
            }
        }
    }
}