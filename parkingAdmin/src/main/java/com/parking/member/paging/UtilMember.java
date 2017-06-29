package com.parking.member.paging;

public class UtilMember {
	public static int nvl(String text) {
		return nvl(text, 0);
	}

	// nvl()메서드는 문자열을 숫자로 변환하는 메서드
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
