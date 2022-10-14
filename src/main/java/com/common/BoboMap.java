package com.common;

import org.springframework.util.LinkedCaseInsensitiveMap;
/**
 * Map的key可以不用管大小寫的存入及讀取<br>
 * 例如：map.put("AAAbb","1");<br>
 * 可以用：map.get("aaabb");<br>
 * 跟：map.get("AAABB");<br>
 * 獲得
 * **/
public class BoboMap extends LinkedCaseInsensitiveMap<Object> {
	private static final long serialVersionUID = 1L;

	@Override
	public Object put(String key, Object value) {
		return super.put(key.toLowerCase(), value==null ? "" :value);
	}

}
