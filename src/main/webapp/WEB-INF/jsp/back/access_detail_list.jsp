<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线表单生成系统</title>
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
<link href="${pageContext.request.contextPath}/resources/back/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">  
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/resources/back/js/template.3.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>
<script type="text/javascript">


	
	function clearConditions(){
		$('#ip').val('');
		$('#activityId').val('');
		$('#type').val('');
	}
	
	

</script>

</head>


<body>
	<div class="content">
		<!--顶部信息-->
   	<jsp:include page="../public/head.jsp"></jsp:include>
	<!--顶部信息结束-->
    
    
    <div class="content-box">
     <!--左边导航-->
    		<jsp:include page="../public/content_left.jsp">
    			<jsp:param value="accessDetailList" name="type"/>
    		</jsp:include>  	
			<!--左边导航结束-->

			<!--右边内容-->
			<div class="content-rg">
				<div class="tityj">
                <p id="contentTitle" class="fl">数据管理</p>
                <div class="fr"></div>
                <div class="clear"></div>
            </div>
            
             <div class="rgtit">
                <ul>
                    <li class="sele"><span>活动页访问明细</span></li>
                </ul>
                <div class="clear"></div>
            </div>
				
				<div class="rgcon bodybai">
					<div class="col-md-8">
						<form class="form-horizontal">
						    <div class="col-md-2">
						    	<input type="tel"  class="form-control"  name="email" id="ip" value="" placeholder="ip地址">
						    </div>
						    <div class="form-group col-md-4">
							    <label  style="width: 100px" for="firstname" class="col-md-6 control-label">访问端类型</label>
							    <div class="col-md-6">
							    	<select id="type" class="form-control"  >
							    		<option value="">请选择</option>
							    		<option value="移动端">移动端</option>
							    		<option value="pc端">pc端</option>
		                     		</select>
							    </div>
						  	</div>
							<div class="form-group col-md-6">
							    <label style="width: 100px" for="firstname" class="col-md-6 control-label">所属活动</label>
							    <div class="col-md-6">
							    	<select id="activityId" class="form-control"  >
		                     		</select>
							    </div>
						  	</div>
						</form>
					</div>
					<div class="col-md-4">
						<div class="col-md-6">
							<a  id="searchBtn" href="javascript:renderByUrl('${pageContext.request.contextPath}/accessDetail/findAccessDetailByPage/1/10');" class="btn btn-info" >查询</a>
							<a  id="clearBtn" href="javascript:clearConditions();" class="btn btn-info" >清空条件</a>&nbsp;&nbsp;&nbsp;&nbsp;
					    </div>
					</div>
				
						<div class="border-bom">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table mytab">
							<thead>
								<tr>
									<th>序号</th>
									<th>访问者ip地址</th>
									<th>访问时间</th>
									<th>访问端类型</th>
									<th>所属活动</th>
								</tr>
							</thead>

							<tbody  id="data">
								
							<tbody>
						</table>
					</div>

						<!--分页-->
						<div class="fenye">
							
						</div>
						<!--分页结束-->
				</div>
				</div>
			</div>
			<!--右边内容结束-->
		</div>

</body>
<script type="text/javascript">
	$(function(){
		/* 进入页面初始化数据 */		
		renderActivity();
		renderByUrl("${pageContext.request.contextPath}/accessDetail/findAccessDetailByPage/1/10",1);
	})
	
	/* 加载数据 */
	function renderByUrl(url,status){
		if(!status || status != 1){
			var ip = $('#ip').val();
			var type = $('#type').val();
			var activityId = $('#activityId').val();
			var params = "?ip=" + ip +"&type=" + type+"&activityId=" + activityId;
			url = url + params;
		}
		
		$.post(url,{},function(data){
			renderByJson(data.data);				
		},"json");
	}
	
	function renderActivity(){
		$.post("${pageContext.request.contextPath}/sign/activity/findAll",{},function(data){
			var html = template('tpl_activity', data);
	  		$("#activityId").html(html);				
		},"json");
	}
	
	/* 根据json数据渲染模版 */
	function renderByJson(pageInfo){
		if(pageInfo){
			if(pageInfo.size == 0){
				$(".fenye").html('');
				$("#data").html('');
				$("#data").html('没有满足该条件的数据！');
				return;
			}
		}
		
		
		pageInfo.maxNavigatepageNum = pageInfo.navigatepageNums[pageInfo.navigatepageNums.length-1];
		pageInfo.baseUrl = "${pageContext.request.contextPath}/accessDetail/findAccessDetailByPage";
		pageInfo.pageSizeArr=[5,10,20,30];
		
		var fenye = template('fenye_tpl', pageInfo);
	  	$(".fenye").html(fenye);
		var data = template('data_tpl', pageInfo);
	  	$("#data").html(data);
	}
</script>
<script type="text/html" id="data_tpl">
								{{each list as l i}}
									<tr>
										<td>{{l.id}}</td>
										<td>{{l.ip}}</td>
										<td>{{l.createTime}}</td>
										<td>{{l.type}}</td>
										<td>{{l.remark}}</td>
									</tr>
								{{/each}}
									
</script>
<script type="text/html" id="fenye_tpl">
						{{if size > 0}}
							<div class="black2 black1 fl">
								<span>共 {{size}} 条 | </span>
								<span>每页显示条数：</span>

								{{each pageSizeArr as ps i}}
									{{if pageSize == ps}}
										<span class="current">{{ps}}条</span>
									{{else}}
										<a href="javascript:renderByUrl('{{baseUrl}}/{{pageNum}}/{{ps}}');">{{ps}}条</a>
									{{/if}}
								{{/each}}										

								
							</div>

							<div class="black2 fr">
								{{if pageNum == 1 }}
										<span class="disabled"> &lt; </span>
								{{else}}
										<a href="javascript:renderByUrl('{{baseUrl}}/{{pageNum - 1}}/{{pageSize}}');"> &lt; </a>
								{{/if}}
									

								{{each navigatepageNums as num i}}
                                	{{if pageNum == num}}
                                		<span class="{{pageNum == num ? 'current':'' }}">{{num}}</span>
                                	{{else}}
                                		<a href="javascript:renderByUrl('{{baseUrl}}/{{num}}/{{pageSize}}');">{{num}}</a>
                                	{{/if}}
                                {{/each}}

                                {{if maxNavigatepageNum != pages}}
	                                  ...<a href="javascript:renderByUrl('{{baseUrl}}/{{pages}}/{{pageSize}}');">{{pages}}</a>
                                {{/if}}

								{{if pageNum == pages }}
										<span class="disabled"> &gt; </span>
								{{else}}
										<a href="javascript:renderByUrl('{{baseUrl}}/{{pageNum + 1}}/{{pageSize}}');">&gt; </a>
								{{/if}}
							</div>
							<div class="clear"></div>
						{{/if}}
</script>
<script type="text/html" id="tpl_activity">
	<option value="">请选择</option>
	{{each data as l i}}
		<option value="{{l.id}}">{{l.name}}</option>
	{{/each}}
</script>
</html>
