package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

public class LoginLogDAO {
	AccountDAO dao = new AccountDAO();
	String dburl = "jdbc:oracle:thin:@54.180.26.126:1521:xe";
	String dbuser = "dev";
	String dbpassword = "oracle";
	

	public int loglist(String id) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into loginlog values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setDate(2,new Date(System.currentTimeMillis()));
			int n = ps.executeUpdate();
			return n;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public Map pastlog(String id) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "select * from loginlog where actor=? order by time desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			Map ret;
			if(rs.next()) {
				ret = new LinkedHashMap<>();
				ret.put("actor", rs.getString("actor"));
				ret.put("time", rs.getDate("time"));
				return ret;
			}else {
				
				return null;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

}
