<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div id="top">
	<!----------------页面头部开始-------------------->
	<div class="banner">

		<img src="images/top.jpg" />
	</div>
	<!----------------页面头部结束-------------------->
	<!----------------主导航菜单开始-------------------->
	<div id="nav">
		<ul>
			<li>
				&nbsp;
			</li>
			<li>
				&nbsp;
			</li>
			<li>
				&nbsp;
			</li>
			<li>
				&nbsp;
			</li>
			<li>
				&nbsp;
			</li>
			<li>
				&nbsp;
			</li>
			<li>
				&nbsp;
			</li>
			<li>
				<a href="dong.jsp"><span>博客浏览</span> </a>
			</li>
			<li>
				<a href="mydong.jsp" onclick="return checkLogin()"><span>我的博客</span>
				</a>
			</li>

			<li>
				<a href="friend.jsp" onclick="return checkLogin()"><span>我的好友</span>
				</a>
			</li>



			<li>
				<a href="message.jsp"><span>留言</span> </a>
			</li>
			<li>
				<a href="admin/login.jsp" target="_blank"><span>后台管理</span> </a>
			</li>

		</ul>
	</div>
	<!----------------主导航菜单结束-------------------->
</div>
<!----------------内容区开始-------------------->
<div class="login_con">
	<%
		Object user = session.getAttribute("name");
		System.out.println(user);
		boolean login = false;
		if (user != null) {
			login = true;
	%>

	<span>欢迎你：<%=user%></span>

	<span><a href="logout.jsp" class="zc">注销</a> </span><span><a
		href="userinfo.jsp" class="zc">我的信息</a> </span>
	<span><a href="newDong.jsp" class="zc">发布博文</a> </span>
	<%
		} else {
	%>

	<form id="form1" name="form1" method="post" action="UserLogAction">
		<span>账号： <input type="text" name="name" id="name"
				class="text_input" /> </span>
		<span>密码： <input type="password" name="pwd" id="pwd"
				class="text_input" /> </span>
		<span> <input type="submit" name="button" id="button"
				value="登录" class="denlu" /> </span>
		<span><a href="registered.jsp" class="zc">注册</a> </span>

	</form>
	
	<%
		}
	%>
	
</div>

<script type="text/javascript">
function checkLogin() {
	var islogin = "<%=login%>"

	if (islogin == 'false') {
		alert("请登录后使用");
		return false;
	} else {
		return true;
	}

}
</script>
&nbsp;&nbsp;&nbsp;
<div align="center"><form id="form1" name="form1" method="post" action="querydong.jsp" >
	<span> <input type="text" name="keywords" id="keywords"
				class="text_input" size="50"/> </span>
	<span> <input type="submit" name="button" id="button"
				value="搜索博文" class="denlu" /> </span>			
	</form></div>