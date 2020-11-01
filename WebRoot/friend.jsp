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
		<title>我的好友</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/tab.js">
</script>
	</head>

	<body>

		<div class="page">
			<div class="page_con">
				<jsp:include flush="true" page="/inc/top.jsp"></jsp:include>
				<!----------------内容区开始-------------------->
				<div class="sub_main">
					<div class="sub_maincon">
						<div class="sub_mainbox clearfix">
							<div class="m_title2">
								<h3>
									我的好友
									<a href="addfriend.jsp">添加</a>
								</h3>
								
									
								
							</div>
							<div class="m_content">
							    <div class="leave_mes">
									
								</div>
									<%
										DBManager dbm = new DBManager();
										Connection conn = dbm.getConnection();
										String queryName = request.getParameter("queryName");
										String sql = "select * from friend where tel='"+session.getAttribute("tel")+"' or totel='"+session.getAttribute("tel")+"'";
										
										
										System.out.println(sql);

										PreparedStatement pstmt = conn.prepareStatement(sql);
										ResultSet rs = pstmt.executeQuery();
										
										Hashtable hs=new Hashtable();

										while (rs.next()) {
											String id = rs.getString("id");
											String my=(String)session.getAttribute("tel");
											String tel="";
											if(rs.getString("tel").equals(my)){
											   tel=rs.getString("totel");
											}else{
											   tel=rs.getString("tel");
											}
											if(hs.containsKey(tel)){
											  continue;
											}
											
											hs.put(tel,"");
											
									%>
									<div class="leave_mes">
									
									<div class="mes_con">
										
										<%
										    String imgsql="select * from users where tel='"+tel+"'";
										    PreparedStatement pstmt1 = conn.prepareStatement(imgsql);
									        ResultSet rs1 = pstmt1.executeQuery();
									        while(rs1.next()){
									        
									     %>
									      <table>
									         <tr>
									           <td rowspan="4"> <img src="<%=path%><%=rs1.getString("photo") %>" width="120px" height="120px"/></td>
									           <td>昵称：&nbsp;<%=rs1.getString("name") %></td>
									         </tr>
									          <tr>
									           
									           <td>性别：&nbsp;<%=rs1.getString("sex") %></td>
									         </tr>
									          <tr>
									          
									           <td>手机：&nbsp; <%=rs1.getString("tel") %></td>
									         </tr>
									          <tr>
									           
									           <td>年龄：&nbsp; <%=rs1.getString("age") %></td>
									         </tr>
									      </table>
									      <a href="DelFriendAction?tel=<%=rs1.getString("tel") %>">删除</a>
									       
									     <%   
									        }
									        if (rs1 != null)
										rs1.close();
									       
										 %>
										 
									</div>
									</div>
									<%
										}
										if (rs != null)
											rs.close();
										if (pstmt != null)
											pstmt.close();
										if (conn != null)
											conn.close();
									%>
								</div>
							</div>
							 
						</div>
					</div>
				</div>
				<!----------------内容区结束-------------------->
				<!---------------页脚开始---------------->
				<div class="bottom">
					<p>
						<a href="http://www.panduoma.com" style="color:white" target="_blank">潘多码-智能毕设辅导平台(www.panduoma.com)</a>
					</p>
				</div>
				<!---------------页脚结束---------------->
			</div>
		</div>
	</body>
</html>
