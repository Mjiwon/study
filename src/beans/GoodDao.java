package beans;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GoodDao {
	SqlSessionFactory factory;
	
	public GoodDao()  throws IOException{
		SqlSessionFactoryBuilder bd = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		factory = bd.build(is);
	}
	
	public int addGoodLog(Map p) {
		SqlSession sql = factory.openSession();
		try {
			int r = sql.insert("good.addGoodLog",p);
			if(r==1) {
				sql.commit();
			}
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public boolean goodByNo(int a) {
		SqlSession sql = factory.openSession();
		try {
			int r = sql.update("good.incGoodByNo",a);
			if(r>0) {
				sql.commit();
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
