package com.panduoma.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * 数据库操作类
 * @author panduoma
 * @company www.panduoma.com
 *
 */
public class DBManager {
	public static final String DEFAULT_DRIVER_NAME = "net.sourceforge.jtds.jdbc.Driver";
	public static final String DEFAULT_DB_URL = "jdbc:jtds:sqlserver://localhost:1433/blog;instance=SQLEXPRESS";

	public static String DB_URL = null;

	public static Properties prop = null;

	//获取数据连接
	public Connection getConnection() {

		Connection coon = null;
		try {
			Class.forName(DEFAULT_DRIVER_NAME);
			coon = DriverManager.getConnection(DEFAULT_DB_URL, "sa", "123456");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return coon;
	}

	public static void main(String[] args) {
		DBManager manager = new DBManager();
		manager.getConnection();
	}

	public boolean login(String username, String pwd) {

		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon
					.prepareStatement("select * from admin where userName='"
							+ username + "' and userPw='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	
	public boolean loginUsers(String username, String pwd) {

		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon
					.prepareStatement("select * from users where tel='"
							+ username + "' and pwd='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}


	public static String TextToHtml(String sourcestr) {
		int strlen;
		String restring = "", destr = "";
		strlen = sourcestr.length();
		for (int i = 0; i < strlen; i++) {
			char ch = sourcestr.charAt(i);
			switch (ch) {
			case '<':
				destr = "<";
				break;
			case '>':
				destr = ">";
				break;
			case '\"':
				destr = "\"";
				break;
			case '&':
				destr = "&";
				break;
			case 13:
				destr = "<br>";
				break;
			case 32:
				destr = "&nbsp;";
				break;
			default:
				destr = "" + ch;
				break;
			}
			restring = restring + destr;
		}
		return "" + restring;
	}
}
