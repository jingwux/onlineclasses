package com.myyl.util;

import java.sql.*;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public class JDBCUtils {
	
	private static String url = "jdbc:mysql://localhost:3306/hl_curriculum";
	private static String user = "root";
	private static String password = "123456";
	private static Connection conn = null;
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection(){
		try {
			conn = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn,PreparedStatement pst,ResultSet rs){
		try {
			if(rs != null){
				rs.close();			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pst != null){
					pst.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					if(conn != null){
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
}
