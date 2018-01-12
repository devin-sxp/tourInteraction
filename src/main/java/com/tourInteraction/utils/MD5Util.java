package com.tourInteraction.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/*方式1*/
//import java.util.Base64;

/**
 * JDK 1.8开始，就提供了java.util.Base64.Decoder和java.util.Base64.Encoder的JDK公共API，
 * 可代替sun.misc.BASE64Decoder和sun.misc.BASE64Encoder的JDK内部API
 *
 * JDK中的lib\tools.jar和JRE中的lib\rt.jar已从Java SE 9中删除,不能使用sun.misc.BASE64Encoder.
 */
/*方式2*/
//import sun.misc.BASE64Encoder;

/*方式3(第三方 commons-codec)*/
import org.apache.commons.codec.binary.Base64;

public class MD5Util {
	public static String md5(String str){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte b[] = md.digest(str.getBytes());
/*方式1*/
//			String s = Base64.getEncoder().encodeToString(b); //jdk1.8开始使用

/*方式2*/
//			String s = new BASE64Encoder().encode(b); //jdk 1.9开始不能使用

/*方式3*/
			byte enstr[] = Base64.encodeBase64(b);
			String s = new String(enstr);
			return s;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
}