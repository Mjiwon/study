package beans;


import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class BoardDao {
	
	SqlSessionFactory factory;
	
	public BoardDao()  throws IOException{
		SqlSessionFactoryBuilder bd = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		factory = bd.build(is);
	}
	
	public int addPosts(Map param) {
		SqlSession sql = factory.openSession();
		
		try {
			int r = sql.insert("exer02_board.addNewContent", param);
			if(r==1) {
				sql.commit();
			}
			return r;
		}catch(Exception e ) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<Map> getAllPostList(){
		SqlSession sql = factory.openSession();
		
		try {
			List<Map> li = sql.selectList("exer02_board.getAllContent");
			
			return li;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
}
