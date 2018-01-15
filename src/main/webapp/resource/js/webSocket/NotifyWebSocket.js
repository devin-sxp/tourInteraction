var websocket = null;
//判断当前浏览器是否支持WebSocket
if ('WebSocket' in window) {
    websocket = new WebSocket("ws://localhost:8080//notifyWebSocket/"+$("#userId").val());
} else {
    alert('当前浏览器 Not support websocket')
}

//连接发生错误的回调方法
websocket.onerror = function () {
    console.log("WebSocket连接发生错误");
};

//连接成功建立的回调方法
websocket.onopen = function () {
    console.log("WebSocket连接成功");
}

//接收到消息的回调方法
websocket.onmessage = function (event) {
    setMessageInnerHTML(event.data);
}

//连接关闭的回调方法
websocket.onclose = function () {
    console.log("WebSocket连接关闭");
};

//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
window.onbeforeunload = function () {
    closeWebSocket();
}

//将消息显示
function setMessageInnerHTML(innerHTML) {
    console.log(innerHTML);

    // 显示通知数变化
    if($("#a_noti_icon div")[0] !=null && $("#a_noti_icon div")[0] !=undefined){
        var count = parseInt($("#a_noti_icon div").text().trim())+1;
        $("#a_noti_msg div").text(count);
        $("#a_noti_icon div").text(count);
    }else{
        $("#a_noti_msg").append("<div class=\"nav-noti-counter-2 nav-noti-counter-red\">1</div>");
        $("#a_noti_icon").append("<div class=\"nav-noti-counter-1 nav-noti-counter-red\">1</div>");
    }

    //通知消息
    var data = {
      title:"通知",
      content:"你有一条新的消息！",
      icon:getRootPath()+"/resource/images/notify/notify01.jpg"
    };
    notify(data)
}

//关闭WebSocket连接
function closeWebSocket() {
    websocket.close();
}

//发送消息
function webSocketSendMsg(message) {
    websocket.send(message);
}



function notify(data) {

    if(!data.title && !data.content){
        data.title = "桌面提醒";
        data.content = "您看到此条信息桌面提醒设置成功";
    }

    if("Notification" in window){

        var notification = null;
        // 判断是否有权限
        if (Notification.permission === "granted") {
            notification = new Notification(data.title, {
                "icon": data.icon,
                "body": data.content
            });
        }
        //如果没权限，则请求权限
        else if (Notification.permission !== 'denied') {
            Notification.requestPermission(function(permission) {
                // Whatever the user answers, we make sure we store the
                // information
                if (!('permission' in Notification)) {
                    Notification.permission = permission;
                }
                //如果接受请求
                if (permission === "granted") {
                    notification = new Notification(data.title, {
                        "icon": data.icon,
                        "body": data.content
                    });
                }
            });
        }
        //onshow函数在消息框显示时会被调用
        //可以做一些数据记录及定时操作等
        notification.onshow = function() {
            console.log('notification shows up');
            //5秒后关闭消息框
            setTimeout(function() {
                notification.close();
            }, 5000);
        };

        //消息框被点击时被调用
        //可以打开相关的视图，同时关闭该消息框等操作
        notification.onclick = function() {
            window.open(getRootPath()+"/page/newsCenter")
            notification.close();
        };

        //当有错误发生时会onerror函数会被调用
        //如果没有granted授权，创建Notification对象实例时，也会执行onerror函数
        notification.onerror = function() {
            console.log('notification encounters an error');
            //do something useful
        };

        //一个消息框关闭时onclose函数会被调用
        notification.onclose = function() {
            console.log('notification is closed');
            //do something useful
        };
    }else {
        console.log('the current browser does not support Notification API');
    }
}