package watertest.Dao;


import java.util.HashMap;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.BoboMap;
import com.common.MybatisUtil;

@Repository
public class testdao{
	@Autowired
	private MybatisUtil sqlSession;
	
	private static Logger logger = LogManager.getLogger();

	private final String TESTSELECT = "testSelect.";

	public void getUser() {
		selectSQL();
		selectSQLByXml();
	}
	public void insertSQL() {
		logger.info("---INSERT SQL---");
		String sql = "insert into bo1 values('4','vivian','09456')";
		sqlSession.directInsert(sql);	
	}
	public void selectSQL() {
		logger.info("---SELECT SQL---");
		String sql = "select * from bo1";
		List<BoboMap> list = sqlSession.directSelect(sql);
		logger.info("selectSQL:{}",list);
	}
	public void updateSQL() {
		logger.info("---UPDATE SQL---");
		String sql = "update bo1 set phone = '0955' where rowid = '1'";
		sqlSession.directUpdate(sql);
	}
	public void selectSQLOne() {
		logger.info("---SELECT SQL One---");
		String sql = "select phone from bo1 where rowid = '1'";
		String result = sqlSession.directSelectOne(sql);
		logger.info("selectSQLOne:{}",result);
	}
	public void delectSQL() {
		logger.info("---DELETE SQL---");
		String sql = "delete bo1 where rowid = '4'";
		sqlSession.directDelete(sql);
	}
	public void selectSQLAfterDelete() {
		logger.info("---SELECT SQL One---");
		String sql = "select phone from bo1 where rowid = '4'";
		List<BoboMap> list = sqlSession.directSelect(sql);
		logger.info("selectSQLAfterDelete:{}",list);
	}
	public void selectSQLByXml() {
		logger.info("---SELECT SQL BY XML---");
		HashMap<String, Object> form = new HashMap<String, Object>();
		form.put("rowid", "1");
		List<BoboMap> list = sqlSession.selectList(TESTSELECT + "SELECT_bo1", form);
		logger.info("selectSQLByXml:{}",list);
	}
	public void insertSQLByXml() {
		logger.info("---INSERT SQL BY XML---");
		HashMap<String, Object> form = new HashMap<String, Object>();
		String gordon = null;
		form.put("rowid", gordon);
		form.put("name", "gordon");
		form.put("phone", "09123");
		sqlSession.insert(TESTSELECT + "INSERT_bo1", form);
	}
	public void updateSQLByXml() {
		logger.info("---UPDATE SQL BY XML---");
		HashMap<String, Object> form = new HashMap<String, Object>();
		String gordon = null;
		form.put("phone", gordon);
		sqlSession.update(TESTSELECT + "UPDATE_bo1", form);
	}

}
