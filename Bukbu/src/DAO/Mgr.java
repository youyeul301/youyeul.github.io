package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import VO.Bean;

public class Mgr {

	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/sample";
	private final String USER = "root";
	private final String PASS= "1111";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Statement stmt = null;
	
	public Mgr() {
		try{
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC DB");
			e.printStackTrace();
		}
	}
	
	public int regiInsert(Bean vo) {
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		StringBuffer sql = new StringBuffer();
		int result = 0;
		try {
			sql.append("insert into bbmember ");
			sql.append("values(?,?,?,?,?);");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getEmail()+"@"+vo.getEmailInput());
			pstmt.setString(2, vo.getUserName());
			pstmt.setString(3, vo.getuserPw());
			pstmt.setString(4, vo.getUserCellNo1()+Integer.toString(vo.getUserCellNo2())+Integer.toString(vo.getUserCellNo3()));
			pstmt.setString(5, vo.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = -1;
		} finally {
			dbclose();
		}
		System.out.println(result);
		return result;
	}
	
	public String checkLogin(String id) {
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		StringBuffer sql = new StringBuffer();
		String pw = null;
		sql.append("select pw from bbmember ");
		sql.append("where id=?");
		try{
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pw = rs.getString("pw");
			}
			System.out.println("id : " +id+ "pw : " +pw);
		} catch (Exception ex) {
			System.out.println("Exception" +ex);
		} finally {
			dbclose();
		}
		return pw;
	}
	
	public void dbclose() {
		try {
			if (rs != null) { rs.close(); }
			if (pstmt != null ) { pstmt.close(); }
			if (stmt != null) { stmt.close(); }
			if (conn != null) { conn.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
