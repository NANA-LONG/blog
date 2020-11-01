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
		<title>我的动态</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/tab.js">
</script>
		<script type="text/javascript" src="<%=path%>/js/popup.js">
		</script>
		<link href="css/picture_preview.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-1.4.2.js" type="text/javascript">
</script>
		<script src="js/picture_preview.js" type="text/javascript">
</script>
		<script>
$(document).ready(function() {
	$("img[id^='preImg']").fancyZoom( {
		scaleImg : true,
		closeOnClick : true
	});
});
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
							<%
								DBManager dbm = new DBManager();
								Connection conn = dbm.getConnection();
								String id = request.getParameter("id");
								String sql = "select * from dong where id ='" + id + "'";

								PreparedStatement pstmt = conn.prepareStatement(sql);
								ResultSet rs = pstmt.executeQuery();

								if (rs.next()) {
							%>
							<div class="m_title2">
								<h3 align="center">
									<%=rs.getString("title")%>

								</h3>

							</div>
							<div class="article_listbox">
								<div align="right">
									作者:
									<b><%=rs.getString("name")%></b>&nbsp;&nbsp;发布日期:
									<b><%=rs.getString("date")%></b>&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
								<br />
								<%=rs.getString("info")%>


							</div>
							<div class="m_title2">
								<h3 align="center">
									评论

								</h3>

							</div>
							<div class="leave_mes">
							
								<%
									String imgsql = "select * from pinglun pl,users us where pl.tel=us.tel and pl.did='"+id+"' ";
										PreparedStatement pstmt1 = conn.prepareStatement(imgsql);
										ResultSet rs1 = pstmt1.executeQuery();
										while (rs1.next()) {
								%>
								<div class="mes_con">
								<table>
									<tr>
										<td rowspan="4">
											<img src="<%=path%><%=rs1.getString("photo")%>"
												width="40px" height="40px" />
										</td>
										<td>
											<%=rs1.getString("info")%></td>
									</tr>
									<tr>

										<td>
											<%=rs1.getString("name")%>&nbsp;<%=rs1.getString("date")%></td>
									</tr>
									
								</table>
								
								</div>

								<%
									}
										if (rs1 != null)
											rs1.close();
								%>
								
								<%
									Object user = session.getAttribute("name");
										System.out.println(user);
										if (user != null) {
								%>
						
							<form id="form2" name="form2" method="post"
								action="AddPingAction">
								<h3>
									我要评论：
								</h3>
								<p>
									<input type="hidden" value="<%=id%>" name="did" />
									<textarea name="info" id="info" cols="45" rows="5"
										class="text_mes"></textarea>
								</p>
								<p class="btn_box">
									<input type="submit" name="button2" id="button2" value="提交"
										class="btn" />
								</p>
							</form>
							<%
								}
							%>

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
			<!----------------内容区结束-------------------->
			<!---------------页脚开始---------------->
			<div class="bottom">
				<p>
					<a href="http://www.panduoma.com" style="color:white" target="_blank">潘多码-智能毕设辅导平台(www.panduoma.com)</a>
				</p>
			</div>
			<!---------------页脚结束---------------->
		</div>
		
	</body>
</html>
