package DAO;

import java.sql.*;
import java.util.*;

import UTIL.ConnectionUtil;
import VO.QnA_Bean;

public class QnA_Mgr {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private int curPage;
	private int totPage;
	
	
	public QnA_Mgr() throws SQLException{
		conn = ConnectionUtil.getConnection();
	}


	public int getCurPage() {
		return curPage;
	}


	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}


	public int getTotPage() {
		return totPage;
	}


	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	
	public int insertReply(QnA_Bean vo){
		StringBuffer sql = new StringBuffer();
		int result = 0;
		try {
			sql.append("INSERT INTO QnA ");
			sql.append("VALUES(null,?,?,?,?,now(),?,0,? )");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getContents());
			pstmt.setString(5, vo.getPass());
			pstmt.setInt(6, vo.getNum());
			
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			result =-1;
			System.out.println(result);
		}finally {
			dbclose();
		}
		return result;
	}
	
	public int insertMessage(QnA_Bean vo){
		StringBuffer sql = new StringBuffer();
		int result = 0;
		try{
			sql.append("INSERT INTO QnA ");
			sql.append("VALUES(null,?,?,?,?,now(),?,0,?) ");	//
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getContents());
			pstmt.setString(5, vo.getPass());
			pstmt.setInt(6, vo.getRef());	
			result = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			result =-1;
		}finally {
			dbclose();
		}
		return result;
	}
	
	public ArrayList<QnA_Bean> getBoardList() {
		String sql = null;
		ArrayList<QnA_Bean> glist = new ArrayList<QnA_Bean>();
		try {
			sql="SELECT * FROM QnA WHERE ref<1 ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnA_Bean bean = new QnA_Bean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setDate(rs.getString("date"));
				bean.setCount(rs.getInt("count"));
				bean.setRef(rs.getInt("ref"));
				glist.add(bean);
			}
			sql = "SELECT * FROM QnA WHERE ref >0 ORDER BY num DESC";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref=0;
			int i=0;
			while (rs.next()) {
				QnA_Bean bean = new QnA_Bean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setDate(rs.getString("date"));
				bean.setCount(rs.getInt("count"));
				ref=rs.getInt("ref");
				bean.setRef(ref);
				for(i=0; i<glist.size();i++){
					if(glist.get(i).getNum()==ref) break;
				}
				System.out.println("getBoardList Mgr-i:"+i);
				if(i!=glist.size()){
						while(glist.size() <i){
							glist.add(glist.size(), null);
						}
						glist.add(i+1,bean);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			dbclose();
		}
		return glist;
	}
	
	public QnA_Bean getReplyMessage(int id){
		
		String sql="select * from QnA where num=?";
		rs = null;
		QnA_Bean vo=new QnA_Bean();
		System.out.println(id);
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
				vo.setEmail(rs.getString("email"));
				vo.setContents(rs.getString("contents"));
				System.out.println("getReplyMessage contents: " + vo.getContents());
				vo.setPass(rs.getString("pass"));
				vo.setCount(rs.getInt("count"));
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {		dbclose();}
		return vo;
	}
	
	public QnA_Bean getMessage(int id){
		System.out.println(id);
		String sql="select * from QnA where num=? ";
		rs = null;
		QnA_Bean vo=new QnA_Bean();
		System.out.println(id);
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
				vo.setEmail(rs.getString("email"));
				vo.setContents(rs.getString("contents"));
				System.out.println(" getMessage contents: "+vo.getContents());
				vo.setPass(rs.getString("pass"));
				vo.setCount(rs.getInt("count"));
				vo.setRef(rs.getInt("ref"));
			}
			setcount( vo.getCount(), vo.getNum());
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {		dbclose();}
		return vo;
	}
	
	private void setcount(int count, int num) {
		
		String sql="update QnA set count=? where num=?";
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, count+1);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		
	}
	
	public String checkPassword(int num) {
		System.out.println("message_num" + num);
		StringBuffer sql = new StringBuffer();
		String pass = null;
		sql.append("SELECT PASS FROM QnA ");
		sql.append("WHERE num=?");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				pass = rs.getString("pass");
			}
			System.out.println("num : " + num + "pass :" + pass);
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		if(pass==null||pass.equals(null)){
			pass="";
		}
		return pass;
	}
	
	public int updateMessage(QnA_Bean vo){
		StringBuffer sql = new StringBuffer();
		int result=0;
		System.out.println("result ============="+result);
		
	//		try{
	//			sql.append("UPDATE QnA ");
	//			if(vo.getOriginalFilename()==null){
	//				sql.append("SET subject=?, content=?,regdate=now() WHERE num=? ");
	//				pstmt.setString(1, vo.getSubject());
	//				pstmt.setString(2, vo.getContents());
	//				pstmt.setInt(3, vo.getNum());
	//			} else {
			System.out.println(vo.getName()+vo.getEmail()+vo.getPass());
			sql.append("UPDATE QnA SET name=?,subject=?,email=?,contents=?,date=now() where num=? ");
			try {
				pstmt=conn.prepareStatement(sql.toString());
				pstmt.setString(1, vo.getName());
				pstmt.setString(2, vo.getSubject());
				pstmt.setString(3, vo.getEmail());
				pstmt.setString(4, vo.getContents());
				pstmt.setInt(5, vo.getNum());
				result=pstmt.executeUpdate();
				if(checkPassword(vo.getNum()).equals(vo.getPass())) {
					sql.append("UPDATE message10 ");
				}
				else {
					//비밀번호 오류
					result = 0;
				}
			}		
			 catch (SQLException e) {
				e.printStackTrace();
				result=-1;
			}finally{
				dbclose();
			}
			return result;
		}
		
			
	public int delete(int num) {
		
		StringBuffer sql = new StringBuffer();
		int result = 0;
		try {
			sql.append("DELETE FROM QnA ");
			sql.append("WHERE num=? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			result = -1;
		}finally {
			dbclose();
		}
		return result;
	}
	
	public ArrayList<QnA_Bean> getList() {
		String sql = null;
		ArrayList<QnA_Bean> glist = new ArrayList<QnA_Bean>();
		try{
			sql="SELECT * FROM QnA WHERE ref<1 ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnA_Bean bean = new QnA_Bean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setDate(rs.getString("date"));
				bean.setCount(rs.getInt("count"));
				bean.setRef(rs.getInt("ref"));
				glist.add(bean);
			}
			sql = "SELECT * FROM QnA WHERE ref >0 ORDER BY num DESC"; 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref=0;
			int i=0;
			while (rs.next()) {
				QnA_Bean bean = new QnA_Bean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setDate(rs.getString("date"));
				bean.setCount(rs.getInt("count"));
				ref=rs.getInt("ref");
				bean.setRef(ref);
				for(i=0; i<glist.size(); i++ ){
					if(glist.get(i).getNum()==ref) break;
				}
				System.out.println("getBoardList Mgr-i:" +i);
				if(i!=glist.size()){
					while(glist.size() < i){
						glist.add(glist.size(), null);
					}
				glist.add(i+1,bean);
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return glist;
	}
	
public ArrayList<QnA_Bean> getBoardSearchList(String searchType, String word){
		
		StringBuffer sql = new StringBuffer();
		String sq=null;
		ArrayList<QnA_Bean> glist = new ArrayList<QnA_Bean>();
		try{
			sql.append("SELECT * FROM QnA ");
			if(word !="" && word != null){
				if("all".equals(searchType)){
					sql.append( "WHERE subject LIKE '%"+word+"%'"
							+ " OR name LIKE '%"+word+"%'"
							+ " OR contents LIKE '%" + word + "%'");
				} else if ("subject".equals(searchType)){
					sql.append( "WHERE subject LIKE '%" + word + "%'");
				} else if ("name".equals(searchType)){
					sql.append( "WHERE name LIKE '%" + word + "%'");
				} else if ("contents".equals(searchType)){
					sql.append("WHERE contents LIKE '%" + word + "%'");
				}
				sql.append(" AND ref<1 ORDER BY num DESC");
				System.out.println("word:" +word + "\t" + "searchType : "+searchType + "\n");
				System.out.println("sql =="+sql);
			}
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnA_Bean bean = new QnA_Bean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setDate(rs.getString("date"));
				bean.setCount(rs.getInt("count"));
				glist.add(bean);
			}
			sq = "SELECT * FROM QnA WHERE ref >0 ORDER BY num DESC";
			pstmt = conn.prepareStatement(sq);
			rs = pstmt.executeQuery();
			int ref=0;
			int i=0;
			while (rs.next()) {
				QnA_Bean bean = new QnA_Bean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setDate(rs.getString("deat"));
				bean.setCount(rs.getInt("count"));
				ref=rs.getInt("ref");
				bean.setRef(ref);
				
				for(i=0; i<glist.size();i++){
					if(glist.get(i).getNum()==ref) break;
				}
				System.out.println("getBoardSearchList Mgr listsize():"+glist.size()+ "\t i:"+i);
				if(i!=glist.size()){
					while(glist.size()<i) {
						glist.add(glist.size(),null);
					}
					glist.add(i+1,bean);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
			return glist;
	}
			
	public void dbclose(){
		try{
			if(rs != null){ rs.close(); }
			if(pstmt != null){ pstmt.cancel(); }
			if(conn != null){ conn.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
