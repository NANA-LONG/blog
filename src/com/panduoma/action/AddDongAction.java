package com.panduoma.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.panduoma.db.DBManager;

/**
 * 添加博客文章
 * @author panduoma
 * @company www.panduoma.com
 *
 */
public class AddDongAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddDongAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		DBManager dbm = new DBManager();
		
		

		
		 
		
		String date = new Date().toLocaleString();
		Object tel = request.getSession().getAttribute("tel");
		
		String title = request.getParameter("title");
		String info=request.getParameter("info");
		String tag=request.getParameter("tag");
		

		String teluser = "";
		if (tel != null && tel.toString() != null) {
			teluser = (String) tel;
		}
		Object name = request.getSession().getAttribute("name");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String key=formatter.format(new Date())+teluser;
		
		Statement stat = null;
		Connection conn = null;
		try {
			conn = dbm.getConnection();
			stat = conn.createStatement();
				
		
		String insertdong="insert into dong values('"+key+"','"+teluser+"','"+title+"','"+info+"','"+date+"','"+tag+"','"+name+"')";
		System.out.println(insertdong);
		stat.execute(insertdong);

	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (stat != null)
					stat.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		 
 
		out.println("<script>alert('发布成功！');window.location.href='mydong.jsp'</script>");
		 
		
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
