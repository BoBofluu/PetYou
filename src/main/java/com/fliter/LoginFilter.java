package com.fliter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.filter.RequestContextFilter;

@WebFilter(urlPatterns = "/*")
public class LoginFilter extends RequestContextFilter {

	private static Logger logger = LogManager.getLogger();

	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		try {
//			logger.info("目前網址："+uri);
//			logger.info("目前session："+session.getId());
			String userid = (String) session.getAttribute("USERID");
			if (!uri.equals("/PetYou/LOGIN")) {
				if (userid == null) {
					throw new Exception();
				}
			}
			filterChain.doFilter(request, response);
		} catch (Exception e) {
			logger.error("未知的使用者");
			response.sendRedirect("LOGIN");
		}
	}
}
