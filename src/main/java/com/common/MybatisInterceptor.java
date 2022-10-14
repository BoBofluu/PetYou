package com.common;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.cache.CacheKey;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@Intercepts({
		@Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,
				RowBounds.class, ResultHandler.class }),
		@Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,
				RowBounds.class, ResultHandler.class, CacheKey.class, BoundSql.class }),
		@Signature(type = Executor.class, method = "update", args = { MappedStatement.class, Object.class }) })
public class MybatisInterceptor implements Interceptor {

	private static Logger logger = LogManager.getLogger();
	private static int MAPPED_STATEMENT_INDEX = 0;
	private static int PARAMETER_INDEX = 1;
	private final static String PARAMETER_COMMENT = "BoBoCMD";

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		final Object[] queryArgs = invocation.getArgs();
		final MappedStatement mappedStatement = (MappedStatement) queryArgs[MAPPED_STATEMENT_INDEX];
		final Object parameter = queryArgs[PARAMETER_INDEX];
		final BoundSql boundSql = mappedStatement.getBoundSql(parameter);
		try {
			if (!(parameter instanceof Map) || !((Map<?, ?>) parameter).containsKey(PARAMETER_COMMENT)) {
				logger.info(parameter);
				return invocation.proceed();
			}
			String comment = MapUtils.getString((Map<?, ?>) parameter, PARAMETER_COMMENT);
			if (StringUtils.isBlank(comment))
				return invocation.proceed();
			String sql = boundSql.getSql();
			sql = String.format("%s %s", comment, sql);
			Map<?, ?> paramMap = (Map<?, ?>) boundSql.getParameterObject();
			paramMap.remove(PARAMETER_COMMENT);
			List<ParameterMapping> parameterMappingList = boundSql.getParameterMappings();
			sql = handleMapParameter(sql, paramMap, parameterMappingList);
			logger.info(sql);
			return invocation.proceed();
		} catch (Exception e) {
			e.printStackTrace();
			return invocation.proceed();
		}
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties arg0) {

	}

	public static class BoundSqlSqlSource implements SqlSource {
		private BoundSql boundSql;

		public BoundSqlSqlSource(BoundSql boundSql) {
			this.boundSql = boundSql;
		}

		public BoundSql getBoundSql(Object parameterObject) {
			return boundSql;
		}
	}

	private String handleMapParameter(String sql, Map<?, ?> paramMap, List<ParameterMapping> parameterMappingList) {
		for (ParameterMapping parameterMapping : parameterMappingList) {
			Object propertyName = parameterMapping.getProperty();
			Object propertyValue = paramMap.get(propertyName);
			if (propertyValue != null) {
				sql = sql.replaceFirst("\\?", propertyValue.toString());
			} else {
				sql = sql.replaceFirst("\\?", "null");
			}
		}
		return sql;
	}
}