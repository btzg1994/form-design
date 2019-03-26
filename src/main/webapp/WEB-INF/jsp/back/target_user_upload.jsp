<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线表单生成系统</title>

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
	src="${pageContext.request.contextPath}/resources/back/js/jquery.ocupload-1.1.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/datetimeformat.js"></script>
<script src="${pageContext.request.contextPath}/resources/back/js/myjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/resources/back/js/template.3.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>
<script type="text/javascript">
$(function(){
		var index;
		$("#uploadBtn").upload({  
                    action: '${pageContext.request.contextPath}/targetUser/upload',  
                    name: 'myFile',  
                    params: {  
                        'rand': Math.random()  
                    },  
                    onComplete: function (data, self, element) {
                    	layer.close(index);
						renderByJson(data);
                    },
                    onSelect: function(){
                    	index = layer.open({
						  type: 1,
						  skin: 'layui-layer-rim', //加上边框
						  area: ['420px', '100px'], //宽高
						  content: '正在上传···'
						});
                    } 
                });  
})
	

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
    			<jsp:param value="targetUserUpload" name="type"/>
    		</jsp:include>  	
			<!--左边导航结束-->

			<!--右边内容-->
			<div class="content-rg">
				<div class="tityj">
                	<p id="contentTitle" class="fl">目标用户管理</p>
                	<div class="fr"></div>
                	<div class="clear"></div>
            	</div>
            
             	<div class="rgtit">
                	<ul>
                    	<li class="sele"><span>批量上传</span></li>
                	</ul>
                	<div class="clear"></div>
            	</div>
				
				<div class="rgcon bodybai">
					<div style="text-align: center; width: 100%">
						<button id="uploadBtn" type="button" class="btn btn-info but120" style="width: 50%;height:100px;font-size: 400%">上传</button>
					</div><br><br>
					<div class="border-bom" id="data">
					</div>

				</div>
			</div>
			<!--右边内容结束-->
		</div>
	</div>

</body>
<script type="text/javascript">
	
	/* 根据json数据渲染模版 */
	function renderByJson(data){
		var d = JSON.parse(data);
		var html= template('data_tpl', d);
	  	$("#data").html(html);
	}
</script>
<script type="text/html" id="data_tpl">
	<h2>上传完成！本次上传明细如下：</h2>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table mytab">
							<thead>
								<tr>
									<th>序号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>邮箱</th>
									<th>地址</th>
									<th>电话</th>
								</tr>
							</thead>

							<tbody  >
								{{each data as l i}}
									<tr>
										<td>{{i+1}}</td>
										<td>{{l.name}}</td>
										<td>
											{{if l.gender == 0}}
											女
											{{else if l.gender == 1}}
											男
											{{/if}}	
										</td>
										<td>{{l.email}}</td>
										<td>{{l.addr}}</td>
										<td>{{l.phone}}</td>
									</tr>
								{{/each}}
							<tbody>
						</table>
								
									
</script>

</html>
