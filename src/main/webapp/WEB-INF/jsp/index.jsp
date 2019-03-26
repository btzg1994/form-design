<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线表单设计后台</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/back/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/back/js/easyui/themes/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/back/js/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/back/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/back/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/back/css/my.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
.resetPwdBtn {
	
}

.frozenBtn {
	
}
</style>
<!--[if lt IE 9]><script src="${pageContext.request.contextPath}/resources/back/jrjs/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/resources/back/jrjs/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/resources/back/jrjs/html5shiv.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/back/jrjs/respond.min.js"></script>
<![endif]-->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/back/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/easyui/outOfBounds.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/zTree/jquery.ztree.all.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/jquery.ocupload-1.1.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/datetimeformat.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/back/js/jquery.easyui.plus.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/back/js/myjs.js"></script>
<script type="text/javascript">


		
</script>

</head>


<body>
	<div class="content">
		<jsp:include page="public/head.jsp"></jsp:include>

		<div class="content-box">

			<jsp:include page="public/content_left.jsp"></jsp:include>

			<!--右边内容-->
			<div class="content-rg">
				<div class="tityj">
					<p id="contentTitle" class="fl">活动管理</p>
					<div class="fr"></div>
					<div class="clear"></div>
				</div>
				<div class="rgtit">
					<ul>
						<li class="sele"><span>明细下载</span></li>
					</ul>
					<div class="clear"></div>
				</div>
				<div class="rgcon bodybai">
					<div class="formdiv">
						<form id="addOperatorForm">
							<table border="0" cellspacing="0" cellpadding="0"
								class="contab contab-wid">
								<tbody>
									<tr>
										<th>用户登录名：</th>
										<td><input id="adminName" name="adminName" type="text"
											class="form-control myinput"><span class="redxing">*</span></td>
									</tr>
									<tr>
										<th>用户密码：</th>
										<td><input id="pwd" name="pwd" type="password"
											class="form-control myinput"><span class="redxing">*</span></td>
									</tr>
									<tr>
										<th>姓名：</th>
										<td><input id="name" name="name" type="text"
											class="form-control myinput"><span class="redxing">*</span></td>
									</tr>
									<tr>
										<th>性别：</th>
										<td><select id="gender" name="gender"
											class="form-control myinput">
												<option value="1">男</option>
												<option value="0">女</option>
										</select><span class="redxing">*</span></td>
									</tr>
									<tr>
										<th>备注：</th>
										<td><input id="remark" name="remark" type="text"
											class="form-control myinput"></td>
									</tr>
								</tbody>
							</table>

							<div class="but-div">
								<button id="saveBtn" type="button" class="btn btn-info but120">保存</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button onclick="javascript:history.back(-1);" type="button"
									class="btn btn-info but120">返回</button>
							</div>
						</form>
					</div>
				</div>

			</div>
			<!--右边内容结束-->
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#saveBtn').click(function() {
				var adminName = $('#adminName').val();
				var pwd = $('#pwd').val();
				var name = $('#name').val();
				var gender = $('#gender').val();
				var remark = $('#remark').val();
				if (adminName == '' || pwd == '' || name == '' || gender == '') {
					alert("存在内容为空!");
					return;
				}
	
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/role/delete",
					data : {
						"adminName" : adminName,
						"pwd" : pwd,
						"name" : name,
						"gender" : gender,
						"remark" : remark
					},
					dataType : "json",
					success : function(data) {
						if (data && data.status == "success") {
							alert("用户成功!");
							window.location.reload();
						}
					}
				});
			});
		});
	</script>

</body>

</html>