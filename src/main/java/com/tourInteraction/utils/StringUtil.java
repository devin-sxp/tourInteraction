package com.tourInteraction.utils;

public class StringUtil {

    private static final String  ENGLISH_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    /**
     * 获取首字母或汉字来，用来进行绘制头像
     * @param nick
     * @return
     */
    public static String getCharString(String nick){

        if(nick==null){
          return  String.valueOf(ENGLISH_CHARS.charAt((int)(Math.random() * 26)));
        }

        char[] chars = nick.toCharArray();
        if(chars.length>0){
            char c=chars[0];
            if(Character.isLetter(c)){
                //是字母
                if(Character.isLowerCase(c)){
                    //是否是小写字母
                    c=Character.toUpperCase(c);
                    return String.valueOf(c);
                }else {
                    return String.valueOf(c);
                }
            }else{
                //不是字母返回
                return String.valueOf(c);
            }
        }
        return String.valueOf(ENGLISH_CHARS.charAt((int)(Math.random() * 26)));
    }

}