<%@ page language="java" import="java.util.*,java.sql.*,com.panduoma.db.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>照片</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		 
	
	</head>

	<body>
<table width="70%" border="0" align="center" cellspacing="1"
				bordercolor="#000000" bgcolor="#0000CC">
				
				<tr>
					
					<td bgcolor="#FFFFFF">
					<input type="hidden" name="id" value="<%=request.getParameter("id") %>"/>
						
									<%
										DBManager dbm = new DBManager();
										Connection conn = dbm.getConnection();
										String ids=request.getParameter("id");
										
										String sql = "select * from dong d where d.id='"+ids+"'";

										PreparedStatement pstmt = conn.prepareStatement(sql);
										ResultSet rs = pstmt.executeQuery();

										if (rs.next()) {
											String id = rs.getString("id");
											out.println(rs.getString("info"));
								 
										}
										if (rs != null)
											rs.close();
										if (pstmt != null)
											pstmt.close();
										if (conn != null)
											conn.close();
									%>
					</td>
				</tr>
				 
				
				 
				<tr>
					<td bgcolor="#FFFFFF">
						<label>
							<div align="center">
								 
								<input type="button" onclick="window.history.back()" name="Submit2" value="返回">
							</div>
						</label>
					</td>
				</tr>
			</table>
		 
	</body>
</html>
