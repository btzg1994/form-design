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
<script type="text/javascript" charset="utf-8"
	src="Public/js/jquery-1.7.2.min.js?2024"></script>
<script type="text/javascript" charset="utf-8" src="js/template-web.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/back/css/my.css"
	rel="stylesheet" type="text/css">
<link href="Public/css/site.css?2024" rel="stylesheet" type="text/css" />
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
				<jsp:param value="sendRecord" name="type"/>
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
						<li class="sele"><span>活动推送记录</span></li>
					</ul>
					<div class="clear"></div>
				</div>
				<div class="rgcon bodybai">
					<div class="butdivs">

						<a type="button"
							href="${pageContext.request.contextPath}/view/addSend"
							class="btn btn-info">添加活动推送</a>

					</div>
					<div class="border-bom">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table mytab">
							<thead>
								<tr>
									<th>编号</th>
									<th>推送标题</th>
									<th>所属活动</th>
									<th>推送人数</th>
									<th>备注</th>
									<th>创建时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>

							<tbody>
							</tbody>
						</table>
					</div>
</body>

<script type="text/html" id="sendRow">
	<tr>
		                            <td>{{index}}</td>
		                            <td>{{title}}</td>
		                            <td>{{ac}}</td>
		                            <td>{{sendCount}}</td>
		                            <td>{{remark}}</td>
		                            <td>{{createTime}}</td>
		                            <td>{{status}}</td>
		                            <td>
										{{if status == '暂未推送'}}				
										<a href="javascript:begin({{id}});">开始推送</a>{{/if}}
										<a href="javascript:dele({{id}});">删除</a>
		                            </td>
	                          	</tr>
</script>
<script type="text/javascript" charset="utf-8" src="layer/layer.js"></script>
<script type="text/javascript">
	var sendMap = new Map();
	var acMap = new Map();
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
					acMap.set(curr.id, curr);
				}
			}
		}
	});
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/sendDetail/findAllSendDetail",
		dataType : "json",
		async : false,
		success : function(data) {
			if (data && data.code == 0) {
				var sendList = data.data;
				for (var i = 0; i < sendList.length; i++) {
					var curr = sendList[i];
					curr.index = i + 1;
					curr.ac = acMap.get(curr.activityId).name;
					if(curr.status == "0"){
						curr.status = "暂未推送";
					}else if(curr.status == "1"){
						curr.status = "正在推送";
					} else {
						curr.status = "推送完成";
					}
					sendMap.set(curr.id, curr);
					var content = template('sendRow', curr);
					$('tbody').append(content);
				}
			}
		}
	});
	
	function begin(id) {
		var curr = sendMap.get(id);
		$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/sendDetail/beginSendDetail",
		dataType : "json",
		data : {"id":id,"title" : curr.title,"userListStr":curr.userListStr},
		success : function(data) {
			alert(data.info);
			if(data && data.code == 0){
				window.location.reload();
			}
		}
	});
	}
	
	function dele(id) {
		var curr = sendMap.get(id);
		$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/sendDetail/deleteSendDetail",
		dataType : "json",
		data : {id : id},
		success : function(data) {
			alert(data.info);
			if(data && data.code == 0){
				window.location.reload();
			}
		}
	});
	}
</script>
</html>
