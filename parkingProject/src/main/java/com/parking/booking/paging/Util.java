package com.parking.booking.paging;

public class Util {

	// 공통으로 사용될 작업에 대해 메소드로 정의하여 사용
	// 문자열->숫자
	public static int nvl(String text) {
		return nvl(text, 0);
	}

	public static int nvl(String text, int def) {
		int ret = def;
		try {
			ret = Integer.parseInt(text);
		} catch (Exception e) {
			ret = def;
		}
		return ret;
	}

	public static String nvl(Object text, String def) {
		if (text == null || "".equals(text.toString().trim())) {
			return def;
		} else {
			return text.toString();
		}
	}
}
