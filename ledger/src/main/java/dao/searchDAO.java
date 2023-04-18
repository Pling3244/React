package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.DBConnection;

public class searchDAO {
		
		Connection conn;	
		PreparedStatement pstmt = null;
		ResultSet rs = null;

	public String findId(String name, String phone) {
	String mid = null;
	
	String sql = "select id from member2 where name=? and phone=? ";
	
	try {
		conn = DBConnection.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		
		rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			mid = rs.getString("id");
		}
			
	} catch (Exception e) {
		e.printStackTrace();
	}
	  finally {
		  if(conn!= null)
			try {
				conn.close();
			} catch (SQLException e) {
			}
	  }
	return mid;
}
	
	public String findpw(String id, String name, String phone) {
		String mpw = null;
		
		String sql = "select password from member2 where id=? and name=? and phone=? ";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				mpw = rs.getString("password");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		  finally {
			  if(conn!= null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		  }
		return mpw;
	}
	
}