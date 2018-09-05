package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

public class AccountDAO {
	String url = "jdbc:oracle:thin:@54.180.26.126:1521:xe";
	String user = "dev";
	String password = "oracle";
	
	public int addData(String id, String pass, String name, String gender) {
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			
			String sql = "insert into account values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			ps.setString(3, name);
			ps.setString(4, gender);
			
			int n = ps.executeUpdate();
			conn.close();
			return n;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public Map getDataById(String id) {
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql = "select * from account where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			Map ret;
			if(rs.next()) {
				ret = new LinkedHashMap<>();
				ret.put("id", rs.getString("id") );
				ret.put("pass", rs.getString("pass") );
				ret.put("name", rs.getString("name") );
				ret.put("gender", rs.getString("gender") );
			}else {
				ret = null;
			}
			conn.close();
			return ret;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int setPassword(String id, String pass) {
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql = "update account set pass = ? where id =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pass);
			ps.setString(2, id);
			
			int n = ps.executeUpdate();
			
			conn.close();
			return n;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

}
