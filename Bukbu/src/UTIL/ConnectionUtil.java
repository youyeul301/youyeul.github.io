package UTIL;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionUtil {
		private static DataSource ds=null;
		private ConnectionUtil(){}
		
		static{
			try{
				Context initContext = new InitialContext();
				Context envContext=(Context)initContext.lookup("java:/comp/env");
				ds=(DataSource)envContext.lookup("jdbc/sample");
				
			}catch(NamingException e){
				e.printStackTrace();
				System.out.println("util 환경설정 에러");
			}
		}
		public static Connection getConnection() throws SQLException {
			return ds.getConnection();
		}
}
