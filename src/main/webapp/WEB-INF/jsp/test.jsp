<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="${pageContext.request.contextPath}/resources/">
<title>拖拽式表单设计器 Formbuild.leipi.org</title>
<meta name="keyword"
	content="拖拽式表单设计器,Web Formbuilder,Formbuild,专业表单设计器,高级表单设计器,智能表单设计器,WEB表单设计器,web formdesign,formdesigner">
<meta name="description"
	content="拖拽式表单设计器Formbuild是强大的在线WEB表单设计器，它通常在、OA系统、问卷调查系统、考试系统、等领域发挥着重要作用，你可以在此基础上任意修改使功能无限强大！">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="leipi.org">
<link href="Public/css/bootstrap/css/bootstrap.css?2024"
	rel="stylesheet" type="text/css" />
<!--[if lte IE 6]>
    <link rel="stylesheet" type="text/css" href="Public/css/bootstrap/css/bootstrap-ie6.css?2024">
    <![endif]-->
<!--[if lte IE 7]>
    <link rel="stylesheet" type="text/css" href="Public/css/bootstrap/css/ie.css?2024">
    <![endif]-->
<link href="Public/css/site.css?2024" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var _root = 'http://formbuild/index.php?s=/',
		_controller = 'index';
</script>
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
<!--link href="Public/css/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"-->


</head>
<body>


	<div class="container">
		<input type="hidden" id="activityId" name = 'activityId' value = "1">
		<form class="form-horizontal">
							<fieldset>
								<div id="legend" class="">
									<input type="hidden" name="form_name" value="" class="leipiplugins" leipiplugins="form_name">
									<legend class="leipiplugins-orgvalue">点击填写表单名</legend>
								</div>
							<div class="control-group">
										<!-- Text -->
										<label class="control-label leipiplugins-orgname">文本框</label>
										<div class="controls">
											<input name="文本框" type="text" placeholder="默认值" title="文本框" value="hello" class="leipiplugins" leipiplugins="text">
										</div>

									</div>

    

    <div class="control-group">
										<!-- Textarea -->
										<label class="control-label leipiplugins-orgname">多行文本</label>
										<div class="controls">
											<div class="textarea">
												<textarea title="多行文本" name="多行文本" class="leipiplugins" leipiplugins="textarea" orgname="多行文本">请输入名称</textarea>
											</div>
										</div>
									</div><div class="control-group">
										<!-- Select -->
										<label class="control-label leipiplugins-orgname">下拉菜单</label>
										<div class="controls">
											<select name="下拉菜单" title="下拉菜单" class="leipiplugins" leipiplugins="select">
												<option value="选项一">选项一</option>
												<option value="选项二">选项二</option>
												<option value="选项三">选项三</option>
											</select>
										</div>

									</div>

    

    

    <div class="control-group">
										<label class="control-label leipiplugins-orgname">单选</label>
										<div class="controls leipiplugins-orgvalue">
											<!-- Multiple Checkboxes -->
											<label class="radio inline"> <input type="radio" name="单选框" title="单选框" value="选项1" class="leipiplugins" leipiplugins="radio" orginline="inline">
												选项1
											</label> <label class="radio inline"> <input type="radio" name="单选框" title="单选框" value="选项2" class="leipiplugins" leipiplugins="radio" orginline="inline">
												选项2
											</label>
										</div>
									</div><div class="control-group">
										<label class="control-label leipiplugins-orgname">文件上传</label>

										<!-- File Upload -->
										<div>
											<input type="file" name="files" title="文件上传" class="leipiplugins" leipiplugins="uploadfile">
										</div>
									</div>

    <div class="control-group">
										<label class="control-label leipiplugins-orgname">复选框</label>
										<div class="controls leipiplugins-orgvalue">
											<!-- Multiple Checkboxes -->
											<label class="checkbox inline"> <input type="checkbox" name="复选框" title="复选框" value="选项1" class="leipiplugins" leipiplugins="checkbox" orginline="inline"> 选项1
											</label> <label class="checkbox inline"> <input type="checkbox" name="复选框" title="复选框" value="选项2" class="leipiplugins" leipiplugins="checkbox" orginline="inline"> 选项2
											</label>
										</div>

									</div>

    </fieldset>
						</form>
		<div class="row clearfix">
			<button class="mybtn">提交</button>
		</div>
		<div id="mf" style="display: none;"></div>
	</div>

	<script type="text/javascript" charset="utf-8"
		src="Public/js/jquery-1.7.2.min.js?2024"></script>
	<script type="text/javascript"
		src="Public/js/formbuild/bootstrap/js/bootstrap.min.js?2024"></script>
	<script type="text/javascript" charset="utf-8"
		src="Public/js/formbuild/leipi.form.build.core.js?2024"></script>
	<script type="text/javascript" charset="utf-8"
		src="Public/js/formbuild/leipi.form.build.plugins.js?2024"></script>
	<script type="text/javascript">
		$('.mybtn').click(function() {
			var formData = new FormData($('form').get(0));
			formData.append("activityId",$('#activityId').val());
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/formRecord/addFormRecord",
					async : false,
					data : formData,
					processData : false, //必不可缺
					contentType : false, //必不可缺
					dataType : "json",
					success : function(data) {
					}
				});
		})
	</script>
</body>
</html>