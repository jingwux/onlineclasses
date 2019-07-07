package com.myyl.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 工具类
 * 1. 初始化C3P0连接池
 * 2. 创建DbUtils核心工具类对象
 * @Date
 * @author
 *
 */
public final class JDBCUtil {

	/**
	 *  1. 初始化C3P0连接池
	 */
	private static  DataSource dataSource;
	static {
		dataSource = new ComboPooledDataSource();
	}
	
	/**
	 * 2.获取连接对象
	 */
	public static Connection getConnection(){
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 3. 创建DbUtils核心工具类对象
	 */
	public static QueryRunner getQueryRunner(){
		// 创建QueryRunner对象，传入连接池对象
		// 在创建QueryRunner对象的时候，如果传入了数据源对象；
		// 那么在使用QueryRunner对象方法的时候，就不需要传入连接对象；
		// 会自动从数据源中获取连接(不用关闭连接)
		return new QueryRunner(dataSource);
	}
	
	/**
	 * 4.关闭连接资源
	 */
	public static void close(Connection conn,PreparedStatement ps,ResultSet rs){
		try {
			if(rs != null){
				rs.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(ps !=null){
					ps.close();
				}
				
			} catch (SQLException e1) {
				e1.printStackTrace();
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







