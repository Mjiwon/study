package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


public class MessageDAO {
	String url = "jdbc:oracle:thin:@54.180.26.126:1521:xe";
	String user = "dev";
	String password = "oracle";
	
	public int sendMessage(String sid, String rid, String message, Date send) {
		try {
			UUID uuid = UUID.randomUUID();
			String code = uuid.toString();
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql = "insert into message values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, sid);
			ps.setString(3, rid);
			ps.setString(4, message);
			ps.setDate(5, send);
			ps.setDate(6, null);
			
			int n = ps.executeUpdate();
			conn.close();
			return n;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List getReceiveId(String id){
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql = "select * from message where receiver = ? order by senddate desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			List reciveIds;
			if(rs.next()) {
				reciveIds = new ArrayList<>();
				String ids = "";
				do {
					ids = rs.getString("sender");
					if(!reciveIds.contains(ids)) {
						reciveIds.add(ids);						
					}
					conn.close();
					return reciveIds;
				}while(rs.next());
			}
			return null;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateReadTime(String code) {
		
		String sql = "update message set receivedate = sysdate where code = ?";
		try {
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, code);
			ps.executeUpdate();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Date getDate(String code) {
		
		String sql = "select receivedate from message where code = ?";
		try {
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, code);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getDate("receivedate");
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public List<Map> getMessage(String id, String user) {
		try {
			Connection conn = DriverManager.getConnection(url, this.user, password);
			String sql = "select * from message where receiver = ? and sender = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, user);
			ResultSet rs = ps.executeQuery();
			List<Map> message = null;
			if(rs.next()) {
				message = new ArrayList<>() ;
				do {
					String code = rs.getString("code");
					Map ret = new LinkedHashMap<>();
					ret.put("code", code);
					ret.put("sender", rs.getString("sender"));
					ret.put("receiver", rs.getString("receiver"));
					ret.put("content", rs.getString("content"));
					ret.put("senddate", rs.getDate("senddate"));					
					Date receivedate = rs.getDate("receivedate");
					if(receivedate== null) {
						this.updateReadTime(code);
						receivedate = this.getDate(code);
					}
					
					System.out.println("receivedate = " + receivedate);
					ret.put("receivedate",receivedate);
					message.add(ret);

				}while(rs.next());
			
			}	conn.close();
			System.out.println(message);
				return message;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List messageList(String id, String user) {
		String sql = "select recivedate for message where receiver =? and sender =? order by senddate desc";
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, user);
			ResultSet rs = ps.executeQuery();
			List mlist = new ArrayList<>();
			if(rs.next()) {
				do {
					mlist.add(rs.getString("content"));
				}while(rs.next()) ;
			}else {
				return null;
			}
			conn.close();
			return mlist;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
