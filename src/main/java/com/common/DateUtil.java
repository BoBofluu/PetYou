package com.common;

import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.WeakHashMap;

import org.apache.commons.lang.StringUtils;

public class DateUtil {
	
	public enum DATE_SEPARATOR{
		CHINESE, SLASHES, DASHES, POINT, EMPTY
	}
	
	private static Map<SimpleDateFormat, WeakReference<SimpleDateFormat>> simpleDateFormat = new WeakHashMap<>();

	
	public static SimpleDateFormat createSimpleDateFormat(String pattern) {
		
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		if(!simpleDateFormat.containsKey(sdf)) {
			simpleDateFormat.put(sdf, new WeakReference<SimpleDateFormat>(sdf));
		}
		return simpleDateFormat.get(sdf).get();
	}
	/**
	 * 將日期物件轉成預設格式的字串 預設格式 : yyyy/MM/dd
	 * @param date
	 * @return
	 */
	public static String getFormatCDate(Date date) {
		return getFormatCDate(date, DATE_SEPARATOR.SLASHES);
	}
	
	public static String getFormatCDate(Date date, String pattern) {
		SimpleDateFormat sdf = createSimpleDateFormat(pattern);
		return sdf.format(date);
	}
	
	public static String getFormatCDate(Date date, DATE_SEPARATOR separator) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		String year = String.valueOf(c.get(Calendar.YEAR) - 1911);
		String month = String.valueOf(c.get(Calendar.MONTH) + 1);
		String day = String.valueOf(c.get(Calendar.DATE));
		if(DATE_SEPARATOR.DASHES==separator)
			return String.format("%s-%s-%s", fillCYearZero(year), fillMonthZero(month), fillDateZero(day));
		if(DATE_SEPARATOR.CHINESE==separator)
			return String.format("%s年%s月%s日", fillCYearZero(year), fillMonthZero(month), fillDateZero(day));
		if(DATE_SEPARATOR.EMPTY==separator)
			return String.format("%s%s%s", fillCYearZero(year), fillMonthZero(month), fillDateZero(day));
		if(DATE_SEPARATOR.POINT==separator)
			return String.format("%s.%s.%s", fillCYearZero(year), fillMonthZero(month), fillDateZero(day));
		return String.format("%s/%s/%s", fillCYearZero(year), fillMonthZero(month), fillDateZero(day));
	}
	/**
	 * 傳入民國年月日 7碼日期
	 * 預設轉成格式 yyy/MM/dd字串
	 * Example: 1060720 -> 106/07/20
	 * 
	 * @param dateStr 民國年月日
	 * @return
	 */
	public static String getFormatCDate(String dateStr) {
		return getFormatCDate(dateStr, "/");
	}
	/**
	 * 傳入民國年月日 7碼日期
	 * 轉成格式  年 + 自訂分隔符號  + 月  + 自訂分隔符號 + 日
	 * Example: formatCDate("1060720", "-") -> return 106-07-20
	 * 
	 * @param dateStr 民國年月日
	 * @param separated 年月日分隔符號
	 * @return
	 */
	public static String getFormatCDate(String dateStr, String separated) {

		if(StringUtils.isBlank(dateStr)) {
			return "";
		} else if(dateStr.length() < 7) {
			return dateStr;
		}
		
		String year = dateStr.substring(0, 3);
		String month = dateStr.substring(3, 5);
		String day = dateStr.substring(5);
		return year + separated + month + separated + day;
	}
	
	public static String toYYYMMDD(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return toYYYMMDD(c);
	}
	
	public static String toYYYMMDD(Calendar calendar) {
		String year = String.valueOf(calendar.get(Calendar.YEAR) - 1911);
		String month = String.valueOf(calendar.get(Calendar.MONTH) + 1);
		String day = String.valueOf(calendar.get(Calendar.DATE));
		return fillCYearZero(year) + fillMonthZero(month) + fillDateZero(day);
	}
	
	/**
	 * 將當前日期轉換為時間格式 : 18:05:01 -> 180501
	 * @param date
	 * @return
	 */
	public static String toHHMMSS() {
		return toHHMMSS(new Date());
	}
	
	/**
	 * 將日期轉換為時間格式 : 18:05:01 -> 180501
	 * @param date
	 * @return
	 */
	public static String toHHMMSS(Date date) {
		SimpleDateFormat HHmmss = createSimpleDateFormat("HHmmss");
		return HHmmss.format(date);
	}
	
	/**
	 * 民國年不足三碼補0
	 */
	public static String fillCYearZero(String year) {
		return StringUtils.leftPad(year, 3, "0");
	}

	/**
	 * 月份不足兩碼補0
	 */
	public static String fillMonthZero(String month) {
		return StringUtils.leftPad(month, 2, "0");
	}

	/**
	 * 日期不足兩碼補0
	 */
	public static String fillDateZero(String day) {
		return StringUtils.leftPad(day, 2, "0");
	}
	
	public static String toYYYMMDDHHMMSS(Date date, boolean separator) {
		if(separator) {
			return String.format("%s %s", getFormatCDate(date), createSimpleDateFormat("HH:mm:ss").format(date));
		} else {
			return String.format("%s%s", DateUtil.toYYYMMDD(date), DateUtil.toHHMMSS(date));
		}
	}
}
