<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/resources/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线表单设计后台</title>
<link href="${pageContext.request.contextPath}/resources/back/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/back/css/my.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" charset="utf-8"
	src="Public/js/jquery-1.7.2.min.js?2024"></script>
<script type="text/javascript" charset="utf-8" src="js/template-web.js"></script>
<style type="text/css">
.resetPwdBtn {
	
}

.frozenBtn {
	
}
</style>
<style type="text/css">
.mybtn { /* 按钮美化 */
	width: 270px; /* 宽度 */
	height: 40px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: #1E90FF; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: white; /* 字体颜色 */
	font-size: 17px; /* 字体大小 */
}

.mybtn:hover { /* 鼠标移入按钮范围时改变颜色 */
	background: #5599FF;
}
</style>
<style>
#components {
	min-height: 600px;
}

#target {
	min-height: 200px;
	border: 1px solid #ccc;
	padding: 5px;
}

#target .component {
	border: 1px solid #fff;
}

#temp {
	width: 500px;
	background: white;
	border: 1px dotted #ccc;
	border-radius: 10px;
}

.popover-content form {
	margin: 0 auto;
	width: 213px;
}

.popover-content form .btn {
	margin-right: 10px
}

#source {
	min-height: 500px;
}
</style>
<script type="text/javascript">


		
</script>

</head>


<body>
	<div class="content">
		<jsp:include page="../public/head.jsp"></jsp:include>

		<div class="content-box">

			<jsp:include page="../public/content_left.jsp">
				<jsp:param value="addSend" name="type"/>
			</jsp:include>

			<!--右边内容-->
			<div class="content-rg">
				<div class="tityj">
					<p id="contentTitle" class="fl">活动管理</p>
					<div class="fr"></div>
					<div class="clear"></div>
				</div>
				<div class="rgtit">
					<ul>
						<li class="sele"><span>添加活动推送</span></li>
					</ul>
					<div class="clear"></div>
				</div>
				<div class="rgcon bodybai">
					<b style="font-size: 16px; margin-left: 20px;">推送标题</b> <input
						maxlength="50" id="title" name="title" type="text"
						placeholder="任务标题"
						style="width: 840px; font-size: 15px; height: 40px; margin-left: 100px; border: 1px solid darkgray; border-radius: 4px; padding: 0 20px;"><span
						class="titleTest" style="color: red"></span> <span
						style="color: red;">*</span>

					<div class="mubiaoyonghu" style="margin-top: 20px;">
						<b style="font-size: 16px; margin-left: 20px;">目标用户</b> 
						<input type="radio" id="allUser" value="1" name="targetUser" checked="checked" style="margin-left: 100px;"> 
						<span style="margin-left: 20px; font-size: 15px;">全部用户</span> 
						<input type="radio" id="chooseUser" value="2" name="targetUser" style="margin-left: 180px;"> 
						<span style="margin-left: 20px; font-size: 15px;">手动选择</span>
					</div>

					<div class="mubiaoyonghu" style="margin-top: 20px;">
						<b style="font-size: 16px; margin-left: 20px;">选择活动</b> <select
							id="activityId" name="activityId"
							style="margin-left: 100px;width: 400px; font-size: 15px; height: 40px; border: 1px solid darkgray; border-radius: 4px; padding: 0 20px;">

						</select>
					</div>

					<div class="mobanxiaoxishuju" style="margin-top: 20px;">
						<b style="font-size: 16px; margin-left: 20px;">推送方式</b> <select
							style="margin-left: 100px;width: 400px; font-size: 15px; height: 40px; border: 1px solid darkgray; border-radius: 4px; padding: 0 20px;">
							<option>邮件推送</option>
						</select>
						<div>
							<b style="font-size: 16px; margin-left: 20px;">备注信息</b> <input
								maxlength="200" id="remark"
								style="width: 840px; height: 80px; font-size: 15px; margin-left: 96px; margin-top: 20px; border: 1px solid darkgray; border-radius: 4px; padding: 0 20px;">
						</div>
						<button onclick="addSend()" class="btn  btn-info px14 padlr"
							id="submit1"
							style="width: 180px; height: 50px; background-color: #2f9833; border: 0px; color: white; border-radius: 4px; margin-left: 475px; margin-top: 20px;">
							<font style="font-size: 22px;">提交</font>
						</button>
					</div>
				</div>
				<div id="hd" style="display: none"></div>
				<script type="text/html" id="myTable">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table mytab">	
				<thead>
					<tr>
							<th>选择</th>
							<th>姓名</th>
							<th>性别</th>
							<th>手机号</th>
							<th>邮箱</th>
					</tr>
				</thead>
				<tbody id = "userList">
									
				</tbody>
			</table>
		</script>
				<script type="text/html" id="userRow">
	<tr style="text-align:center">
										<td><input type="checkbox" name = "user" value="{{id}}"></td>
										<td>{{name}}</td>
										<td>
											{{sex}}
										</td>
										<td>{{phone}}</td>
										<td>{{email}}</td>
	</tr>
</script>
</body>




<script type="text/javascript" charset="utf-8" src="layer/layer.js"></script>
<script type="text/javascript">
	function addSend() {
		var chooseUser = [];
		if ($("input[name=targetUser]:checked").val() == "2") {
			if (userIds.length == 0) {
				alert("请选择目标用户!");
				return;
			}
			chooseUser = userIds;
		} else {

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/targetUser/findAllTargetUser",
				dataType : "json",
				async : false,
				success : function(data) {
					if (data && data.code == 0) {
						var list = data.data;

						for (var i = 0; i < list.length; i++) {
							var curr = list[i];
							allUserIds.push(curr.id);
						}
						chooseUser = allUserIds;
					}
				}
			});
		}
		
		var userListStr = "";
		for(var i = 0; i < chooseUser.length; i++){
			if(i == 0){
				userListStr = userListStr + chooseUser[i];
			}else {
				userListStr = userListStr +","+ chooseUser[i];
			}
		}
		$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/sendDetail/addSendDetail",
				dataType : "json",
				data :{
					title : $('#title').val(),
					remark : $('#remark').val(),
					activityId : $('#activityId').val(),
					sendCount : chooseUser.length,
					userListStr : userListStr
				}, 
				success : function(data) {
					if (data && data.code == 0) {
						alert(data.info);
						window.location.reload();
					}
				}
			});
		console.log(chooseUser)
	}
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/sign/activity/findAll",
		dataType : "json",
		async : false,
		success : function(data) {
			if (data && data.code == 0) {
				var acList = data.data;
				for (var i = 0; i < acList.length; i++) {
					var curr = acList[i];
					$('#activityId').append("<option value = " + curr.id + ">" + curr.name + "</option>");
				}
			}
		}
	});



	var userIds = [];
	var allUserIds = [];
	$("input[name=targetUser]").click(function() {
		if ($(this).val() == '2') {
			var body = template("myTable", {});
			$('#hd').html(body);
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/targetUser/findAllTargetUser",
				dataType : "json",
				async : false,
				success : function(data) {
					if (data && data.code == 0) {
						var userList = data.data;
						for (var i = 0; i < userList.length; i++) {
							var curr = userList[i];
							curr.index = i + 1;
							var content = template('userRow', curr);
							$('#userList').append(content);

						}
					}
				}
			});



			layer.open({
				btn : [ '确定' ],
				type : 1,
				skin : 'layui-layer-rim', //加上边框
				area : [ '500px', '400px' ], //宽高
				shadeClose : true,
				content : $('#hd').html(),
				yes : function(index, layero) {
					userIds = [];
					//按钮【按钮三】的回调
					$('#hd').html("");
					var checkeds = $("input[name=user]:checked").each(function() {
						userIds.push($(this).attr("value"));
					});
					layer.close(index);
				}
			});
		} else {

		}

	});
</script>
</html>
