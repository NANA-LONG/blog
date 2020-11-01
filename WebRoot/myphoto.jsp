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
		<title>我的照片</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		 
		 <link href="css/picture_preview.css" rel="stylesheet" type="text/css" />
		 <script src="js/jquery-1.4.2.js" type="text/javascript"></script>
    <script src="js/picture_preview.js" type="text/javascript"></script>
    <script>
	$(document).ready(function(){
		$("img[id^='preImg']").fancyZoom({scaleImg: true, closeOnClick: true});
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
							<div class="m_title2">
								<h3>
									我的照片
								</h3>
							</div>
							<div class="products_list clearfix">
								<ul>

									<%
										DBManager dbm = new DBManager();
										Connection conn = dbm.getConnection();
										
										String sql = "select * from dong d,img im where d.id=im.did and d.tel='"+session.getAttribute("tel")+"'";

										PreparedStatement pstmt = conn.prepareStatement(sql);
										ResultSet rs = pstmt.executeQuery();

										while (rs.next()) {
											String id = rs.getString("id");
									%>
									<li>
										<p class="pic">
										<img id="preImg<%=id %>" src="<%=path%>/<%=rs.getString("picurl") %>" alt='<%=rs.getString("date") %>'  style="width:110px;height:110px;background-color:#ccc;border:1px solid #333" />
										</p>
									</li>
									<%
										}
										if (rs != null)
											rs.close();
										if (pstmt != null)
											pstmt.close();
										if (conn != null)
											conn.close();
									%>
								</ul>
							</div>
							
							<div class="message_con">

								 
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
