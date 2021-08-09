package DAO;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import UTIL.ConnectionUtil;
import VO.uploadBean;

public class uploadMgr { 
	Connection conn = null;
	PreparedStatement pstmt = null; 
	ResultSet rs = null;  	
	private int curPage; 
 	private int totPage;
 	
 	public uploadMgr() throws SQLException{
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
	
	public uploadBean uploadfile(HttpServletRequest request) throws IOException
	{		
		MultipartRequest multi = null;  
		uploadBean bBean= new uploadBean();
		 multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCTYPE, 
		              new DefaultFileRenamePolicy());// �ߺ����ϻ����� �����ϴ� class
		 Enumeration files = multi.getFileNames();				 
		 while(files.hasMoreElements()){			  
			  String name = (String) files.nextElement();
			  bBean.setFilename( multi.getFilesystemName(name));//������ �����̸�
			  bBean.setOrigfname( multi.getOriginalFileName(name));	//�����ҽ��������̸�		  
			  File f=multi.getFile(name);//�Ķ�����̸�		
			  if(f!=null){
				  bBean.setFilesize((int) f.length());
				  String type = multi.getContentType(name);
				  System.out.println("type : "+type);
			  }
			  bBean.setWriter(multi.getParameter("writer"));
			  bBean.setSubject(multi.getParameter("subject"));
			  bBean.setPw(multi.getParameter("pw"));
			  bBean.setContents(multi.getParameter("contents"));			  
			  /*if(multi.getParameter("message_num")!=null){
				  bBean.setNum(Integer.parseInt((multi.getParameter("message_num"))));
			  }*/
			  
		  } 
		 return bBean;
	}
	/* file upload ���� code */
    String SAVEFOLDER="D:/주간/민석/workspace/BUKEDU/WebContent/fileUpload";
	int MAXSIZE=1024*1024*5; //5MB
	String ENCTYPE="UTF-8";
	
	//public int insertMessage(uploadBean vo){
	public int insertMessage(HttpServletRequest request) {
		int rs = 0;
		String sql = null;
		uploadBean bBean= new uploadBean();		
		try {			
			File file = new File(SAVEFOLDER);
			if (!file.exists())
				file.mkdirs();
			
			bBean=uploadfile(request);		 
			
			sql="INSERT INTO upboard VALUES (null,?,?,?,now(),?,0 ,?,?,? ,0 )";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, bBean.getWriter());	
			pstmt.setString(2, bBean.getSubject());					
			pstmt.setString(3, bBean.getContents());
			pstmt.setString(4, bBean.getPw());
			pstmt.setString(5, bBean.getFilename());					
			pstmt.setString(6, bBean.getOrigfname());
			pstmt.setInt(7, bBean.getFilesize());
			
			rs=pstmt.executeUpdate();
						
		} catch (Exception e) {
			System.out.println("1");
			e.printStackTrace();
			rs= -1;
		} finally {
			dbclose();		
		}
		return rs;
	}
	
	public  ArrayList<uploadBean> getBoardList() {
		 String sql = null;
		 ArrayList<uploadBean> glist = new ArrayList<uploadBean>();
		 
		 try { 
		//sql = "SELECT * FROM upboard ORDER BY NUM DESC";
		sql = "SELECT * FROM upboard";//����: all �˻� ����
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		uploadBean bean = new uploadBean();
		bean.setNum(rs.getInt("num"));
		bean.setWriter(rs.getString("writer"));
		bean.setSubject(rs.getString("subject"));
		bean.setDate(rs.getString("date"));
		bean.setHit(rs.getInt("hit"));
		
		glist.add(bean);
		 }
		 } catch (Exception e) {
			 System.out.println("2");
		 e.printStackTrace();
		 } finally {
			 dbclose();
		 }
		 return glist;
		 }
	
	
	public ArrayList<uploadBean> getBoardSearchList(String searchType, String searchValue){
	
		StringBuffer sql =  new StringBuffer();
		 ArrayList<uploadBean> list = new ArrayList<uploadBean>();
		try { 
			sql.append("SELECT * FROM upboard ");			
			if(searchValue !="" && searchValue != null){
				if("all".equals(searchType)){
					sql.append( "WHERE subject LIKE '%"+ searchValue +"%'"
							+ " OR writer LIKE '%"+ searchValue +"%'"//�˻�����: �ۼ��� column name�� name�� �ƴ� writer��.
							+ " OR contents LIKE '%" + searchValue + "%'");
			   } else if ("subject".equals(searchType)){
				   sql.append( "WHERE subject LIKE '%" + searchValue + "%'");
			   } else if ("writer".equals(searchType)){//�˻�����: �ۼ��� column name�� name�� �ƴ� writer��.
				   sql.append ( "WHERE writer LIKE '%" + searchValue + "%'");
			   } else if ("contents".equals(searchType)){
				   sql.append ("WHERE contents LIKE '%" + searchValue + "%'");
			   }

				
		   }			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				uploadBean bean = new uploadBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setSubject(rs.getString("subject"));
				bean.setDate(rs.getString("date"));
				bean.setHit(rs.getInt("hit"));
				list.add(bean);
			}
		 } catch (Exception e) {
			 System.out.println("3");
			 e.printStackTrace();
		 } finally {
			 dbclose();
		 }
		 return list;
	}
	
	public uploadBean getMessage(int num){
		
		 String sql="select * from upboard where num=?";
		 rs = null;
		 uploadBean vo=new uploadBean();
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setSubject(rs.getString("subject"));
				vo.setContents(rs.getString("contents"));
				vo.setPw(rs.getString("pw"));
				vo.setHit(rs.getInt("hit"));
				vo.setFilename(rs.getString("filename"));
				vo.setOrigfname(rs.getString("origfname"));
				vo.setFilesize(rs.getInt("filesize"));
				vo.setDowncount(rs.getInt("downcount"));
			}
			
			setcount( vo.getHit(), vo.getNum());
		} catch (Exception ex) {
			System.out.println("Exception setcount : " + ex);
		} finally {     
			dbclose();
		}
		return vo;
		}

		public String checkPassword(int num){ 
			System.out.println("MGR checkPassword(): message_num ="+ num);
			StringBuffer sql = new StringBuffer();
			String pass= null;
			sql.append("SELECT PW FROM upboard ");
			sql.append("WHERE num=?");
			try{
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					pass = rs.getString("pw");
				}
				System.out.println("MGR: num : " +num +"pw : " + pass );
			} catch (Exception ex) {
				System.out.println("Exception checkpass : " + ex);
			}
			System.out.println("MGR: num : " +num +"pw : " + pass );
			return pass;
		}
			
		 
		//public int updatetMessage(uploadBean vo){
		public int  updateMessage(HttpServletRequest request) throws IOException{
			StringBuffer sql = new StringBuffer();
			uploadBean bBean= new uploadBean();
			int result = -1;
			try{					
				bBean=uploadfile(request);	
				if(checkPassword(bBean.getNum()).equals(bBean.getPw())){
					sql.append("UPDATE upboard ");
					System.out.println("getOriginalFilename" + bBean.getOrigfname());
					if(bBean.getOrigfname()==null){
						sql.append("SET subject=?,contents=?,date=now() WHERE num=? ");					
						pstmt = conn.prepareStatement(sql.toString());
						pstmt.setString(1, bBean.getSubject());
						pstmt.setString(2, bBean.getContents());					
						pstmt.setInt(3,bBean.getNum());	
					}else{
						sql.append("SET subject=?,contents=?,date=now(),filename=?,origfname=?,filesize=? WHERE num=? ");					
						pstmt = conn.prepareStatement(sql.toString());
						pstmt.setString(1, bBean.getSubject());
						pstmt.setString(2, bBean.getContents());
						pstmt.setString(3, bBean.getFilename());					
						pstmt.setString(4, bBean.getOrigfname());
						pstmt.setInt(5, bBean.getFilesize());
						pstmt.setInt(6,bBean.getNum());	
					}					
					result = pstmt.executeUpdate();				
				}else{
					//��й�ȣ ����
					result=0;
				}
			}catch(SQLException e){
				e.printStackTrace();
				result =-1;
			}finally{
				 dbclose();
			}
			return result;
		}
		
		
		public int updateMessage2(uploadBean bBean){
			StringBuffer sql = new StringBuffer();
			int result = 0;
			try{	
				sql.append("UPDATE upboard ");
				if(bBean.getOrigfname()==null){
					sql.append("SET subject=?,contents=?,date=now() WHERE num=? ");//����0913:contents�� ���縵 s����	
					pstmt = conn.prepareStatement(sql.toString());
					pstmt.setString(1, bBean.getSubject());
					pstmt.setString(2, bBean.getContents());					
					pstmt.setInt(3,bBean.getNum());	
				}else{
					sql.append("SET subject=?,contents=?,date=now(),filename=?,origfname=?,filesize=? WHERE num=? ");//����0913:contents�� ���縵 s����						
					pstmt = conn.prepareStatement(sql.toString());
					pstmt.setString(1, bBean.getSubject());
					pstmt.setString(2, bBean.getContents());
					pstmt.setString(3, bBean.getFilename());					
					pstmt.setString(4, bBean.getOrigfname());
					pstmt.setInt(5, bBean.getFilesize());
					pstmt.setInt(6,bBean.getNum());	
				}
				
				result = pstmt.executeUpdate();
			}catch(SQLException e){
				e.printStackTrace();
				result =-1;
			}finally{
			 dbclose();
			}
			return result;
		}
		
		
		public int delete(int num) {
				
			StringBuffer sql = new StringBuffer();
			int result = 0;
			try{	
				sql.append("DELETE FROM upboard ");
				sql.append("WHERE num=? ");
				
				pstmt = conn.prepareStatement(sql.toString()); 
				pstmt.setInt(1, num);	
				result = pstmt.executeUpdate();
			}catch(SQLException e){
				e.printStackTrace();
				result =-1;
			}finally{
				dbclose();
			}
			return result;		
		}
		
		//��ȸ������ 
		public void setcount(int hit , int num){//��ȸ������ ������ : ��ȸ������ column name = hit			
			String sql="update upboard set hit=? where num=?";		
			try{
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, hit+1);//��ȸ������ ������ : ��ȸ������ column name = hit		
				pstmt.setInt(2, num);
				pstmt.executeUpdate();
			} catch (Exception ex) {
				System.out.println("Exception set count : " + ex);
			}
		}
		public void setDownloadcount( int num){
						
			String sql="update upboard set downcount=downcount+1 where num=?";		
			try{
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (Exception ex) {
				System.out.println("Exception set download : " + ex);
			} 
		}
		
		public static String conv(String s) {
			String str = null;
			try {
				str = new String(s.getBytes("8859_1"), "ksc5601");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return str;
		}
		
		//File Upload 
		public void downLoad(HttpServletRequest request, HttpServletResponse response,
				JspWriter out, PageContext pageContext)throws IOException {				
			try { 				
								
				String filename=null;
				String originalfilename=request.getParameter("origfname");
				filename = URLEncoder.encode(originalfilename, "utf-8").replaceAll("\\+", "%20");

				System.out.println("download- originalfilename : "+ originalfilename);
				System.out.println("download- filename : "+ filename);
				
				
				File file = new File((SAVEFOLDER + File.separator+ originalfilename));				
				System.out.println("download- filename1 : "+ file.getName());
				
				
				byte b[] = new byte[(int) file.length()]; 
				
				response.setHeader("Accept-Ranges", "bytes");
				response.setHeader("Content-Transfer-Encoding", "binary");
				
				
				String strClient = request.getHeader("User-Agent");
				
				if (strClient.indexOf("MSIE") != -1) {					
					response.setContentType("application/smnet;charset=euc-kr");
					response.setHeader("Content-Disposition", "filename=" + filename + ";");
					System.out.println("download- response.setHeader : "+ "Content-Disposition"+ "filename=" + filename + ";");
				} else {					
					
					response.setContentType("application/octer-stream");
					response.setHeader("Content-Disposition", "attachment;filename="+ filename + ";");
					System.out.println("download- response.setHeader : "+ "Content-Disposition"+ "attachment;filename="+ filename + ";");
				}				
				
				if (file.isFile()) {
					BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
					BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
					int read = 0;
					while ((read = fin.read(b)) != -1) {
						outs.write(b, 0, read);
					}
					outs.close();fin.close();
					String num=request.getParameter("num");
					setDownloadcount(Integer.parseInt(num));
					dbclose();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}	
	
	public void dbclose(){ 
		System.out.println("dbclose");
		try {
			if(rs != null){	rs.close(); }
			if(pstmt != null){ pstmt.close(); }
			if(conn != null){ conn.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}