package com.tourInteraction.websocket;

import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint("/notifyWebSocket/{userId}")
public class NotifyWebSocket {
    private static final Logger logger = LoggerFactory.getLogger(NotifyWebSocket.class);

    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static Map<String,Object> webSocketMap = new HashMap<String, Object>();

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(@PathParam("userId") String userId, Session session){
        this.session = session;
        webSocketMap.put(userId,session);
        addOnlineCount();           //在线数加1
        System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(){
        webSocketMap.remove(this);
        subOnlineCount();           //在线数减1
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
        JSONObject jb = JSONObject.fromObject(message);
        if (jb.get("userId") != null){
            sendUser(message,jb.get("userId").toString());
        }
    }

    /**
     * 发生错误时调用
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        error.printStackTrace();
    }

    /**
     * 消息发送方法
     * 向所有用户发送
     * @param msg
     */
    public static void sendAll(String msg){
        for (String key : webSocketMap.keySet()) {
            NotifyWebSocket client = null ;
            try {
                client = (NotifyWebSocket) webSocketMap.get(key);
                synchronized (client) {
                    client.session.getBasicRemote().sendText(msg);
                }
            } catch (IOException e) {
                logger.debug("Chat Error: Failed to send message to client", e);
                webSocketMap.remove(client);
                try {
                    client.session.close();
                } catch (IOException e1) {
                    // Ignore
                }
                String message = String.format("* %s %s",
                        key, "has been disconnected.");

            }
        }
    }

    /**
     * 向指定用户发送消息
     * @param msg
     */
    public static void sendUser(String msg,String userId){
        Session session = (Session) webSocketMap.get(userId);

        try {
            if (session != null){
                session.getBasicRemote().sendText(msg);
            }
        } catch (Exception e) {
            logger.debug("Chat Error: Failed to send message to client", e);
            webSocketMap.remove(userId);
            try {
                session.close();
            } catch (IOException e1) {
            }
            String message = String.format("* %s %s",
                    userId, "has been disconnected.");
        }
    }


    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        NotifyWebSocket.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        NotifyWebSocket.onlineCount--;
    }
}
