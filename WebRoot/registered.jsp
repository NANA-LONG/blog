<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<title>用户注册</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/tab.js">
</script>
		<script type="text/javascript" src="<%=path%>/js/popup.js">
		</script>
		<script type="text/javascript">
function up() {
	var pop = new Popup( {
		contentType : 1,
		isReloadOnClose : false,
		width : 400,
		height : 200
	});
	pop.setContent("contentUrl", "<%=path%>/upload/upload.jsp");
	pop.setContent("title", "文件上传");
	pop.build();
	pop.show();
}
</script>

<script type="text/javascript">
function check() {

	if (document.getElementById("pwd").value.length < 6
			|| document.getElementById("pwd").value.length > 12) {
		alert("密码必须是６到１２位！");
		return false;
	}
	var age = document.all.age.value;

	if (isNaN(age) || age <= 0) {
		alert("年龄必须是正数！");
		return false;
	}

	var tels = document.getElementById("tel").value;

	if (isNaN(tels) || tels.length != 11) {
		alert("请输入正确手机号码！");
		return false;
	}

	

	return true;

}
</script>
	</head>

	<body>

		<div class="page">
			<div class="page_con">
				<jsp:include flush="true" page="/inc/top.jsp"></jsp:include>
				<div class="sub_main">
					<div class="sub_maincon">
						<div class="sub_mainbox clearfix">


							<div class="m_border">
								<div class="m_title2">
									<h3>
										注册
									</h3>
								</div>
								<div class="m_content message_con">
									<form id="form1" name="form1" method="post"
										action="UserRegAction" onSubmit="return check();">
										<p class="tips">
											<b>注：</b>带
											<span class="red">*</span>号为必填项
										</p>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="left_name">
													昵称：
												</td>
												<td>
													<input type="text" name="name" id="name"
														class="text_input text150" />
													<span class="red">*</span>
												</td>
												<td>

												</td>
											</tr>
											<tr>
												<td class="left_name">
													创建密码：
												</td>
												<td>
													<input type="password" name="pwd" id="pwd"
														class="text_input text150" />
													<span class="red">*</span>
												</td>
												<td>

												</td>

											</tr>
											<tr>
												<td class="left_name">
													手机号：
												</td>
												<td>
													<input type="text" name="tel" id="tel"
														class="text_input text150" />(手机号为登陆账号)

												</td>
												<td>

												</td>
											</tr>



											<tr>
												<td class="left_name">
													性别：
												</td>
												<td>
													<span><input type="radio" name="sex" id=""
															
															value="男" checked="checked"/>男</span><span><input
															type="radio" name="sex" id="radio" value="女" />女</span>
												</td>
												<td>
													&nbsp;
												</td>
											</tr>

											<tr>
												<td class="left_name">
													年龄：
												</td>
												<td>
													<input type="text" name="age" id="age"
														class="text_input text150" />

												</td>
												<td>

												</td>
											</tr>

											<tr>
												<td class="left_name">
													头像：
												</td>
												<td>
													<input type="text" name="fujian" id="fujian" size="30"
														readonly="readonly" />
													<input type="button" value="上传" onclick="up()" />
													<input type="hidden" name="fujian" id="fujian" />


												</td>

												<td>

												</td>
											</tr>
											<tr>
												<td class="left_name">

												</td>
												<td>
													<img src="" id="myphoto" alt="" width="70px" height="100px" />

												</td>
												<td>

												</td>
											</tr>

											<tr>
												<td>

												</td>
												<td>
													<input type="image" name="button" id="button"
														src="images/ok.gif" />
														
												</td>
											</tr>
										</table>
									</form>
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
