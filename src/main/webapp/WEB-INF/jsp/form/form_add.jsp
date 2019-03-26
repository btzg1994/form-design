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
<script type="text/javascript" charset="utf-8"
	src="Public/js/jquery-1.7.2.min.js?2024"></script>
<%-- <link href="${pageContext.request.contextPath}/resources/back/css/bootstrap.min.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.contextPath}/resources/Public/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/back/css/my.css" rel="stylesheet" type="text/css">
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
				<jsp:param value="addForm" name="type"/>
			</jsp:include>

			<!--右边内容-->
			<div class="content-rg">
				<div class="tityj">
					<p id="contentTitle" class="fl">表单管理</p>
					<div class="fr"></div>
					<div class="clear"></div>
				</div>
				<div class="rgtit">
					<ul>
						<li class="sele"><span>创建表单模板</span></li>
					</ul>
					<div class="clear"></div>
				</div>
				<div class="rgcon bodybai">

					<div class="container">
						<div class="row clearfix">
							<div class="span6">
								<div class="clearfix">
									<h2>我的表单</h2>
									<hr>
									<div id="build">
										<form id="target" class="form-horizontal">
											<fieldset>
												<div id="legend" class="component" rel="popover"
													title="编辑属性" trigger="manual"
													data-content="
                <form class='form'>
                  <div class='controls'>
                    <label class='control-label'>表单名称</label> <input type='text' id='orgvalue' placeholder='请输入表单名称'>
                    <hr/>
                    <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
                  </div>
                </form>">
													<input type="hidden" name="form_name" value=""
														class="leipiplugins" leipiplugins="form_name" />
													<legend class="leipiplugins-orgvalue">点击填写表单名</legend>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
							</div>

							<div class="span6" style="height:600px;">
								<h2>拖拽下面的控件到左侧</h2>
								<hr>
								<div class="tabbable">
									<ul class="nav nav-tabs" id="navtab">
										<li class="active"><a href="#1" data-toggle="tab">常用控件</a></li>
										<li class><a href="#2" data-toggle="tab">定制控件</a></li>
										<li class><a id="sourcetab" href="#5" data-toggle="tab">源代码</a></li>
									</ul>
									<form class="form-horizontal" id="components">
										<fieldset>
											<div class="tab-content">

												<div class="tab-pane active" id="1">


													<!-- Text start -->
													<div class="control-group component" rel="popover"
														title="文本框控件" trigger="manual"
														data-content="
  <form class='form'>
    <div class='controls'>
      <label class='control-label'>控件名称</label> <input type='text' id='orgname' placeholder='必填项'>
      <label class='control-label'>默认值</label> <input type='text' id='orgvalue' placeholder='默认值'>
      <hr/>
      <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
    </div>
  </form>">
														<!-- Text -->
														<label class="control-label leipiplugins-orgname">文本框</label>
														<div class="controls">
															<input name="leipiNewField" type="text" placeholder="默认值"
																title="文本框" value="" class="leipiplugins"
																leipiplugins="text" />
														</div>

													</div>
													<!-- Text end -->


													<!-- Textarea start -->
													<div class="control-group component" rel="popover"
														title="多行文本控件" trigger="manual"
														data-content="
  <form class='form'>
    <div class='controls'>
      <label class='control-label'>控件名称</label> <input type='text' id='orgname' placeholder='必填项'>
      <label class='control-label'>默认值</label> <input type='text' id='orgvalue' placeholder='默认值'>
      <hr/>
      <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
    </div>
  </form>">
														<!-- Textarea -->
														<label class="control-label leipiplugins-orgname">多行文本</label>
														<div class="controls">
															<div class="textarea">
																<textarea title="多行文本" name="leipiNewField"
																	class="leipiplugins" leipiplugins="textarea" />
																</textarea>
															</div>
														</div>
													</div>
													<!-- Textarea end -->

													<!-- Select start -->
													<div class="control-group component" rel="popover"
														title="下拉控件" trigger="manual"
														data-content="
  <form class='form'>
    <div class='controls'>
      <label class='control-label'>控件名称</label> <input type='text' id='orgname' placeholder='必填项'>
      <label class='control-label'>下拉选项</label>
      <textarea style='min-height: 200px' id='orgvalue'></textarea>
      <p class='help-block'>一行一个选项</p>
      <hr/>
      <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
    </div>
  </form>">
														<!-- Select -->
														<label class="control-label leipiplugins-orgname">下拉菜单</label>
														<div class="controls">
															<select name="leipiNewField" title="下拉菜单"
																class="leipiplugins" leipiplugins="select">
																<option>选项一</option>
																<option>选项二</option>
																<option>选项三</option>
															</select>
														</div>

													</div>
													<!-- Select end -->


													<!-- Select start -->
													<div class="control-group component" rel="popover"
														title="多选下拉控件" trigger="manual"
														data-content="
  <form class='form'>
    <div class='controls'>
      <label class='control-label'>控件名称</label> <input type='text' id='orgname' placeholder='必填项'>
      <label class='control-label'>下拉选项</label>
      <textarea style='min-height: 200px' id='orgvalue'></textarea>
      <p class='help-block'>一行一个选项</p>
      <hr/>
      <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
    </div>
  </form>">
														<!-- Select -->
														<label class="control-label leipiplugins-orgname">下拉菜单</label>
														<div class="controls">
															<select multiple="multiple" name="leipiNewField"
																title="下拉菜单" class="leipiplugins" leipiplugins="select">
																<option>选项一</option>
																<option>选项二</option>
																<option>选项三</option>
																<option>选项四</option>
															</select>
														</div>

													</div>
													<!-- Select end -->


													<!-- Multiple Checkboxes start -->
													<div class="control-group component" rel="popover"
														title="复选控件" trigger="manual"
														data-content="
  <form class='form'>
    <div class='controls'>
      <label class='control-label'>控件名称</label> <input type='text' id='orgname' placeholder='必填项'>
      <label class='control-label'>复选框</label>
      <textarea style='min-height: 200px' id='orgvalue'></textarea>
      <p class='help-block'>一行一个选项</p>
      <hr/>
      <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
    </div>
  </form>">
														<label class="control-label leipiplugins-orgname">复选框</label>
														<div class="controls leipiplugins-orgvalue">
															<!-- Multiple Checkboxes -->
															<label class="checkbox inline"> <input
																type="checkbox" name="leipiNewField" title="复选框"
																value="选项1" class="leipiplugins" leipiplugins="checkbox"
																orginline="inline"> 选项1
															</label> <label class="checkbox inline"> <input
																type="checkbox" name="leipiNewField" title="复选框"
																value="选项2" class="leipiplugins" leipiplugins="checkbox"
																orginline="inline"> 选项2
															</label>
														</div>

													</div>

													<div class="control-group component" rel="popover"
														title="复选控件" trigger="manual"
														data-content="
  <form class='form'>
    <div class='controls'>
      <label class='control-label'>控件名称</label> <input type='text' id='orgname' placeholder='必填项'>
      <label class='control-label'>复选框</label>
      <textarea style='min-height: 200px' id='orgvalue'></textarea>
      <p class='help-block'>一行一个选项</p>
      <hr/>
      <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
    </div>
  </form>">
														<label class="control-label leipiplugins-orgname">复选框</label>
														<div class="controls leipiplugins-orgvalue">
															<!-- Multiple Checkboxes -->
															<label class="checkbox"> <input type="checkbox"
																name="leipiNewField" title="复选框" value="选项1"
																class="leipiplugins" leipiplugins="checkbox">
																选项1
															</label> <label class="checkbox"> <input type="checkbox"
																name="leipiNewField" title="复选框" value="选项2"
																class="leipiplugins" leipiplugins="checkbox">
																选项2
															</label>
														</div>
													</div>
													<!-- Multiple Checkboxes end -->

													<!-- Multiple radios start -->
													<div class="control-group component" rel="popover"
														title="单选控件" trigger="manual"
														data-content="
  <form class='form'>
    <div class='controls'>
      <label class='control-label'>控件名称</label> <input type='text' id='orgname' placeholder='必填项'>
      <label class='control-label'>单选框</label>
      <textarea style='min-height: 200px' id='orgvalue'></textarea>
      <p class='help-block'>一行一个选项</p>
      <hr/>
      <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
    </div>
  </form>">
														<label class="control-label leipiplugins-orgname">单选</label>
														<div class="controls leipiplugins-orgvalue">
															<!-- Multiple Checkboxes -->
															<label class="radio inline"> <input type="radio"
																name="leipiNewField" title="单选框" value="选项1"
																class="leipiplugins" leipiplugins="radio"
																orginline="inline"> 选项1
															</label> <label class="radio inline"> <input type="radio"
																name="leipiNewField" title="单选框" value="选项2"
																class="leipiplugins" leipiplugins="radio"
																orginline="inline"> 选项2
															</label>
														</div>
													</div>

													<div class="control-group component" rel="popover"
														title="单选控件" trigger="manual"
														data-content="
  <form class='form'>
    <div class='controls'>
      <label class='control-label'>控件名称</label> <input type='text' id='orgname' placeholder='必填项'>
      <label class='control-label'>单选框</label>
      <textarea style='min-height: 200px' id='orgvalue'></textarea>
      <p class='help-block'>一行一个选项</p>
      <hr/>
      <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
    </div>
  </form>">
														<label class="control-label leipiplugins-orgname">单选</label>
														<div class="controls leipiplugins-orgvalue">
															<!-- Multiple Checkboxes -->
															<label class="radio"> <input type="radio"
																name="leipiNewField" title="单选框" value="选项1"
																class="leipiplugins" leipiplugins="radio"> 选项1
															</label> <label class="radio"> <input type="radio"
																name="leipiNewField" title="单选框" value="选项2"
																class="leipiplugins" leipiplugins="radio"> 选项2
															</label>
														</div>
													</div>
													<!-- Multiple radios end -->


												</div>

												<div class="tab-pane" id="2">



													<div class="control-group component" rel="popover"
														title="文件上传" trigger="manual"
														data-content="
                  <form class='form'>
                    <div class='controls'>
                      <label class='control-label'>控件名称</label> <input type='text' id='orgname' placeholder='必填项'>
                      <hr/>
                      <button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button>
                    </div>
                  </form>">
														<label class="control-label leipiplugins-orgname">文件上传</label>

														<!-- File Upload -->
														<div>
															<input type="file" name="leipiNewField" title="文件上传"
																class="leipiplugins" leipiplugins="uploadfile">
														</div>
													</div>


												</div>



												<div class="tab-pane" id="5">
													<textarea id="source" class="span6"></textarea>
												</div>
										</fieldset>
									</form>
								</div>
								<!--tab-content-->
							</div>
							<!---tabbable-->
						</div>
						<!-- row -->

						<div class="row clearfix" style="padding-left:20px;">
							<button class="mybtn">提交</button>
						</div>
						<div id="mf" style="display: none;"></div>
					</div>
					<!-- /container -->
				</div>

			</div>
			<!--右边内容结束-->
		</div>
	</div>


	<script type="text/javascript"
		src="Public/js/formbuild/bootstrap/js/bootstrap.min.js?2024"></script>
	<script type="text/javascript" charset="utf-8"
		src="Public/js/formbuild/leipi.form.build.core.js?2024"></script>
	<script type="text/javascript" charset="utf-8"
		src="Public/js/formbuild/leipi.form.build.plugins.js?2024"></script>
	<script type="text/javascript">
		$('.mybtn').click(function() {
			//console.log($('#source').val());
	
			$('#mf').html($('#source').val());
			var a = getHasTitles($('#mf').get(0));
			var fieldList = [];
			var groupList = [];
			var fileFlag = false;
			for (var i = 0; i < a.length; i++) {
				var groupVal = $(a[i]).parents('.control-group').attr('val');
				
				a[i]['name'] = a[i]['title'];
				if (a[i]['type'] == 'select-one') {
					for (var j = 0; j < a[i].options.length; j++) {
						a[i].options[j].value = a[i].options[j].text;
					}
				}
				if (groupVal){
					a[i]['name'] = a[i]['name'] + "_" + (i -1);
				}else {
					a[i]['name'] = a[i]['name'] + "_" + i;
				}
				if (a[i]['type'] == 'file') {
					if (fileFlag == false) {
						a[i].name = "files";
						fileFlag = true;
					} else {
						alert("仅支持表单内含单文件标签!");
						return;
					}
				}
	
	
	
				//console.log("标签名称: "+a[i]['tagName'] + " ____ " +"标签类型: "+ a[i]['type'] + " ____ " +"标签title: "+ a[i]['title'] + " ____ " + "标签name: "+a[i]['name']);
				var field = {
					"formFieldName" : a[i]['name'],
					"type" : a[i]['type'],
					"required" : "false",
					"defaultVal" : a[i]['value'].replace(/[\r\n\t]/g, "")
				};
				if (groupVal == undefined) {
					$(a[i]).parents('.control-group').attr('val', i);
				} else {
					continue;
				}
				fieldList.push(field);
			}
	
			var form = {
				"title" : $('#mf').find('.leipiplugins-orgvalue').html(),
				"content" : $('#mf').html().replace(/[\r\n\t]/g, ""),
				"fieldList" : fieldList
			};
			if (fieldList.length == 0) {
				alert("表单内容不能为空");
			}
			console.log(form);
	
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/form/addForm",
				data : JSON.stringify(form),
				contentType : "application/json;charset=utf-8",
				dataType : "json",
				success : function(data) {
					alert(data.info);
					if (data && data.code == 0) {
						window.location.reload();
					}
				}
			});
	
	
		});
		function getHasTitles(parentNode) {
			var allNodes = parentNode.getElementsByTagName('*');
			var length = allNodes.length;
			var i;
			var hasTitles = [];
			var node;
			for (i = 0; i < length; i++) {
				node = allNodes[i];
				if (node.title) {
					hasTitles.push(node);
				}
			}
			return hasTitles;
		}
	</script>
</body>

</html>