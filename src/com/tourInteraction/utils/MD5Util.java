package com.tourInteraction.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5Util {
	public static String md5(String str){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte b[] = md.digest(str.getBytes());
			String s = new BASE64Encoder().encode(b);
			return s;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
}