package com.common;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MybatisUtil {
	@Autowired
	private SqlSession sqlSession;

	private final static String PARAMETER_COMMENT = "BoBoCMD";

	/**
	 * 直接下 SQL 指令
	 **/
	public int directUpdate(String sql) {
		sql = String.format("%s %s", getComment(), sql);
		return sqlSession.update("UTIL.execute", sql);
	}

	public int directInsert(String sql) {
		sql = String.format("%s %s", getComment(), sql);
		return sqlSession.update("UTIL.execute", sql);
	}

	public int directDelete(String sql) {
		sql = String.format("%s %s", getComment(), sql);
		return sqlSession.update("UTIL.execute", sql);
	}

	public <E> List<E> directSelect(String sql) {
		sql = String.format("%s %s", getComment(), sql);
		return sqlSession.selectList("UTIL.executeSelectSQL", sql);
	}

	public String directSelectOne(String sql) {
		sql = String.format("%s %s", getComment(), sql);
		return sqlSession.selectOne("UTIL.executeSelectOne", sql);
	}

	/**
	 * statement = namespace的名稱 + id的名稱<br>
	 * parameter = xml裡面需要的變數<br>
	 * ${}為串接的變數，#{}為單獨一個的變數
	 **/
	public int update(String statement, Object parameter) {
		setCommentIntoParam(parameter);
		return sqlSession.update(statement, parameter);
	}

	public int insert(String statement, Object parameter) {
		setCommentIntoParam(parameter);
		return sqlSession.insert(statement, parameter);
	}

	public int delete(String statement, Object parameter) {
		setCommentIntoParam(parameter);
		return sqlSession.delete(statement, parameter);
	}

	public <E> List<E> selectList(String statement, Object parameter) {
		setCommentIntoParam(parameter);
		return sqlSession.selectList(statement, parameter);
	}

	/** 單純搜尋，就得宣告一個空的map讓他存取使用者及ip等資訊 **/
	public <E> List<E> selectList(String statement) {
		HashMap<String, String> parameter = new HashMap<>();
		setCommentIntoParam(parameter);
		return sqlSession.selectList(statement, parameter);
	}

	public <E> E selectOne(String statement, Object parameter) {
		setCommentIntoParam(parameter);
		return sqlSession.selectOne(statement, parameter);
	}

	/** 只傳值的話就要多這個function **/
	@SuppressWarnings("unchecked")
	private void setCommentIntoParam(Object parameter) {
		if (parameter instanceof Map) {
			String comment = getComment();
			((Map<String, String>) parameter).put(PARAMETER_COMMENT, comment);
		}
	}

	private String getComment() {
		try {
//			Object usrObj = request.getSession().getAttribute(CommonConstant.USER_CONTEXT);
			String usrid = "啵啵", usrip = "127.0.0.1";
//			if(usrObj!=null && (usrObj instanceof UserDetailInterface)){
//				UserDetailInterface user = (UserDetailInterface)usrObj;
//				usrid = user.getUsrid();
//				usrip = user.getLogip();
//			}
			String date = DateUtil.toYYYMMDDHHMMSS(new Date(), true);
			StackTraceElement element = Thread.currentThread().getStackTrace()[4];
			String className = element.getClassName();

			return String.format("/** %s.%s %s %s %s **/", className.substring(className.lastIndexOf(".") + 1),
					element.getMethodName(), usrid, date, usrip);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
